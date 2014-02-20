class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.by_starts_at.descending
  end

  def show
    @meeting = Meeting.find_by_slug!(params[:id])
  end

end
