class Meetings::CommentsController < ApplicationController

  before_action :load_meeting

  def create
    @comment = Comment.new
    authorize @comment, :create?

    if @meeting.add_comment(comment_params)
      redirect_to @meeting
    else
      render 'meetings/show'
    end
  end

  def destroy
    @meeting.comments.delete_at(params[:id].to_i)
    if @meeting.save
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
    permitted_comment_params.merge(user_name: current_user.name)
  end

  def permitted_comment_params
    params.require(:comment).permit(policy(@comment).permitted_params)
  end
end
