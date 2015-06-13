class SummariesController < ApplicationController
  
  def new
    @post = @topic.posts
    @summary = Summary.new
    authorize @summary
  end

  def show
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
    authorize @summary
  end

  def edit
    @summary = Summary.find(params[:id])
    authorize @summary
  end
  
  def create
     @post = @topic.posts
     @summary = Summary.new(params.require(:summary).permit(:name, :description, :public))
     authorize @summary
     if @summary.save
       redirect_to [@post,@summary], notice: "Summary was saved successfully."
     else
       flash[:error] = "Error creating summary. Please try again."
       render :new
     end
   end
 
   def update
     @summary = Summary.find(params[:id])
     authorize @summary
     if @summary.update_attributes(params.require(:summary).permit(:name, :description, :public))
       redirect_to [@post,@summary]
     else
       flash[:error] = "Error saving summary. Please try again."
       render :edit
     end
   end
end
