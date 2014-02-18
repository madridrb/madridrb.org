class MeetingsController < ApplicationController

  def show
    @meeting = Meeting.find_by_id(params[:id])
  end

end
