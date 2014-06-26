class Meetings::CommentsController < ApplicationController

  before_action :load_meeting

  def create
    @comment = Comment.new
    authorize @comment, :create?

    if @meeting.add_comment(current_user, comment_params)
      redirect_to @meeting
    else
      render 'meetings/show'
    end
  end

  def destroy
    comment = @meeting.comments[params[:id].to_i]
    authorize comment, :destroy?

    if @meeting.delete_comment(comment)
      redirect_to @meeting, notice: 'Comment destroyed successfully'
    else
      @comment = Comment.new
      render 'meetings/show'
    end
  end

  private

  def load_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def comment_params
    params.require(:comment).permit(policy(@comment).permitted_params)
  end
end
