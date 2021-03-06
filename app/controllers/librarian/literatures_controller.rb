class Librarian::LiteraturesController < ApplicationController
  before_filter :select, :only =>[:edit, :update, :destroy]  
  
  
  def index
    @literatures=Literature.order(:created_at).page(params[:page]).per(7)
  end

  def new
    @literature = Literature.new
    @literature.writings.build
    @writers = Writer.find_all
    @publishers = Publisher.find_all
    @categories = Category.find_all
    @subcategories = Subcategory.find_all
  end
  
  def create
    @literature = Literature.new(params[:literature])
    @literature.writings.build(:literature_id=>params[:literature],:writer_id=>params[:writing])
    
     if @literature.save
      redirect_to(librarian_literatures_url, :notice => 'Literature was successfully created.')
     else
      render :action => "new"
    end
  end
  
  def edit
    @literature.writings.build
    @writers = Writer.find_all
    @publishers = Publisher.find_all
    @categories = Category.find_all
    @subcategories = Subcategory.find_all
  end
  
  def update
    if @literature.update_attributes(params[:literature])
      redirect_to(edit_librarian_literature_url, :notice => 'Literature was successfully updated.')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @literature.destroy
    redirect_to librarian_literatures_path
  end
  
  def select
    @literature = Literature.find_id(params[:id])
  end

end
