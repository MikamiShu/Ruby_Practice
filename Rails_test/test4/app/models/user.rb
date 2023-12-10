class User < ApplicationRecord
    
    scope :search, -> (search_params) do
        return if search_params.blank?

        name_like(search_params[:name])
        .email_like(search_params[:email])
    end

    scope :name_like, -> (search_word) {where('name LIKE ?', "%#{search_word}%")}
    scope :email_like, -> (search_text) {where('email LIKE ?', "%#{search_text}%")}

    scope :sorted, -> {order(name: :ASC)}
end
