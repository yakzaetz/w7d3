class Goal < ApplicationRecord
    validates :name, :details, presence: true

    belongs_to :user,
        class_name: :User,
        foreign_key: :user_id

    
end
