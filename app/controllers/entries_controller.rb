class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      flash[:notice] = "Entry has been successfully saved!"
      redirect_to root_path
    else
      flash[:alert] = "Sorry, something went wrong. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.expect(entry: [:name, :url, :username, :password])
  end
end
