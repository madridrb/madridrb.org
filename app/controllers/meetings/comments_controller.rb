class Meetings::CommentsController < ApplicationController

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @comment = Comment.new
    authorize @comment, :create?

    if @meeting.add_comment(comment_params)
      redirect_to @meeting
    else
      render 'meetings/show'
    end
  end

  private

  def comment_params
    permitted_comment_params.merge(user_name: current_user.name)
  end

  def permitted_comment_params
    params.require(:comment).permit(policy(@comment).permitted_params)
  end
end
