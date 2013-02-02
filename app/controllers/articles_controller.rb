class ArticlesController < ApplicationController

	before_filter current_user 

	def index
		@articles = Article.order('updated_at desc')
	end
	def list
	end
	def show
	end
	def new
		@article = Article.new
	end
	def create
		article = Article.new(params[:article])
		article.content.gsub!(/\r\n/m,"\<br\>")

		isuploaded = !(params[:upload]==nil)
		if isuploaded
			uploaded_file = params[:upload][:file]
			name = params[:upload][:file].original_filename
			directory = "/home/ubuntu/Develop/mobock/app/assets/images/"
			path = File.join(directory, name)
			f = File.open(path, "wb")
			f.write(uploaded_file.read)
			f.close
			flash[:notice] = "File uploaded"
			article.content = "\<img src= \"http://54.248.218.60:9999/assets/" + name + "\" width=\"100%\" /\> \<br\>" +article.content
		end

		if article.save
			redirect_to(:action => "index")
		else
			redirect_to(:action => "new")
		end

	end
	def edit
	end
	def update
	end
	def delete
	end
end
