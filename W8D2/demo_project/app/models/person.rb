class Person < ApplicationRecord
    self.table_name = "people"
    validates :name, :house, presense: true

    belongs_to :house,
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :House
end