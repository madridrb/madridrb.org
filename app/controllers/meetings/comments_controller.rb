class Meetings::CommentsController < ApplicationController

  def create
    @meeting = Meeting.find(params[:meeting_id])

    if @meeting.add_comment(comment_params)
      redirect_to @meeting
    else
      @comment = Comment.new
      render 'meetings/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_name: current_user.name)
  end
end
