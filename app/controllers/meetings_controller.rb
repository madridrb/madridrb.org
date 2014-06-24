class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.by_starts_at.descending.page(params[:page])
  end

  def show
    @meeting = Meeting.find(params[:id])
    @comment = Comment.new
  end

end
