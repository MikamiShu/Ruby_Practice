class User < ApplicationRecord
    has_many :scores, dependent: :destroy
    
    scope :search, -> (search_params) do
        return if search_params.blank?

        name_like(search_params[:name])
        .email_like(search_params[:email])
    end

    scope :name_like, -> (search_word) {where('name LIKE ?', "%#{search_word}%")}
    scope :email_like, -> (search_text) {where('email LIKE ?', "%#{search_text}%")}

    scope :name_sort, -> {order(name: :ASC)}
    scope :create_sote, -> {order(created_at: :ASC)}
end
