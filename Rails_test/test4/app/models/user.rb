class User < ApplicationRecord
    
    scope :search, -> (search_params) do
        return if search_params.blank?

        title_like(search_params[:title])
        .text_content_like(search_params[:text_content])
    end

    scope :title_like, -> (search_word) {where('title LIKE ?', "%#{search_word}%")}
    scope :text_content_like, -> (search_text) {where('text_content LIKE ?', "%#{search_text}%")}
end
