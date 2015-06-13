class SummariesController < ApplicationController
  
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts
    @summary = Summary.new
    authorize @summary
  end

  def show
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    authorize @summary
  end

  def edit
    @summary = Summary.find(params[:id])
    authorize @summary
  end
  
  def create
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts
     @summary = Summary.new(params.require(:summary).permit(:name, :description, :public))
     authorize @summary
     if @summary.save
       redirect_to @summary, notice: "Summary was saved successfully."
     else
       flash[:error] = "Error creating topic. Please try again."
       render :new
     end
   end
 
   def update
     @summary = Summary.find(params[:id])
     authorize @summary
     if @summary.update_attributes(params.require(:summary).permit(:name, :description, :public))
       redirect_to @summary
     else
       flash[:error] = "Error saving summary. Please try again."
       render :edit
     end
   end
end
