module ApplicationHelper
    def auth_token
        <<-HTML.html_safe
        <input
            type="hidden"
            name="authenticity_token"
            value="#{ html_escape(form_authenticity_token) }"
        />
        HTML
    end
end
