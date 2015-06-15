class SummariesController < ApplicationController
  
  def new
   @topic = Topic.find(params[:topic_id])
   @post = @topic.posts.new(post_params)
   @summary = Summary.new
   authorize @summary
  end

  def show
    @topic = Topic.find(params[:topic_id]) 
    @post = @topic.posts
    @summary = Summary.find(params[:id])
    authorize @summary 
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end
  
  def create
     @post = @topic.posts
     @summary = Summary.new(params.require(:summary).permit(:name, :description, :public))
     authorize @summary
     if @summary.save
       redirect_to [@topic,@post,@summary], notice: "Summary was saved successfully."
     else
       flash[:error] = "Error creating summary. Please try again."
       render :new
     end
   end
 
   def update
     @summary = Summary.find(params[:id])
     authorize @summary
     if @summary.update_attributes(params.require(:summary).permit(:name, :description, :public))
       redirect_to [@topic,@post,@summary], notice: "Summary was updated successfully."
     else
       flash[:error] = "Error saving summary. Please try again."
       render :edit
     end
   end
end
