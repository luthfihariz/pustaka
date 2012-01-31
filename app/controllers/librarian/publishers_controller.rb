class Librarian::PublishersController < ApplicationController
  before_filter :select, :only => [:edit, :show, :update, :destroy]
  
  def index
    @title = "Publisher"
    @publishers = Publisher.order(:created_at).page(params[:page]).per(3)
  end

  def new
    @publisher = Publisher.new
  end
  
  def create
    @publisher = Publisher.new(params[:publisher])
    
    if @publisher.save
      redirect_to(librarian_publishers_url, :notice => 'Publisher was successfully created.')
      else
      render :action => "new"
    end
  end

  def edit
  end
  
  def update
    if @publisher.update_attributes(params[:publisher])
      redirect_to(edit_librarian_publisher_url, :notice => 'Publisher was successfully updated.')
      else
      render :action => "edit"
    end
  end

  def show
  end

  def select
    @publisher = Publisher.find_id(params[:id])
  end

end
