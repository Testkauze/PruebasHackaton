class ArticlesController < ApplicationController

	#GET  /articles
	def index
		#Obtiene todos los registros de la tabla de la base de datos article
		@articles =	Article.all
	end

	#GET /articles/:id
	def show
		#Encontrar un registro por id
		@article = Article.find(params[:id])
		#Where
		Article.where(" body LIKE ?","%ensaje%")
	end

	#GET /articles/new
	def new
		@article = Article.new #Se crea en memoria no la base de datos
	end

	#POST /articles
	def create
		#INSERT TO
		#Ootra forma de colocarlo
		#@article = Article.new(title: params[:article][:title], body: params[:article][:body])
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render :new
		end
	end

	#GET /articles/:id/edit
	def edit
		@article = Article.find(params[:id])
	end

	def update
		#UPDATE
		# @article.update_attributes({title: 'Nuevo titulo'})
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end 
	end

	def destroy
		#DELETE FROM ARTICLE
		@article = Article.find(params[:id])
		@article.destroy #Elimina el objeto en la DB
		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title,:body)
	end
end