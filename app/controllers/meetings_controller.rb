class MeetingsController < ApplicationController

  def show
    @meeting = Meeting.find_by_slug(params[:id])
  end

end
