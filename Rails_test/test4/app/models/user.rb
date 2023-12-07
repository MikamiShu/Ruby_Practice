class User < ApplicationRecord
    scope :search, -> (search_params) do
        return if search_params.blank?

        search_like(search_params[:text_content])
    end

    scope :search_like, -> (text_content) {where('text_content LIKE ?', "%#{text_content}%") if text_content.present? }
end
