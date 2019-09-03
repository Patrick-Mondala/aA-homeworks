require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email" do
        post :create, params: { user: {email: "", password: "bad_password" } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post :create, params: { user: {email: "fake@fake.com", password: "" } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present      
      end
    end

    context "with valid params" do
      it "redirects user to bands index on success" do
        post :create, params: { user: {email: "good@email.com", password: "123456" } }
        expect(response).to redirect_to(user_url(User.last))
      end
    end
  end
end