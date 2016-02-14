class CommentsController < ApplicationController
	
	before_action :authenticate_user!
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(params[:comment].permit(:content))
		 @comment.user= current_user
		@comment.post_id = @post.id

		if @comment.save
			redirect_to post_path(@post)
		else
			redirect_to post_path(@post)
			#render 'new'
		end
	end
	
	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		if  (@comment.user == current_user) 
		else 
			redirect_to post_path(@post)
		end
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:content))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		if  (@comment.user == current_user) 
				@comment.destroy
				redirect_to post_path(@post)
		else 
			redirect_to post_path(@post)

		end
	
		
	end
end