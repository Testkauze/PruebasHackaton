class Article < ActiveRecord::Base
	# La tabla => articles
	# Campos =>	article.tittle() => 'El titulo del articulo'
	# Escribir metodos =>
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: { minimum: 15 }
end
