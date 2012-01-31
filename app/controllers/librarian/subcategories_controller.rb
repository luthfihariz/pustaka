class Librarian::SubcategoriesController < ApplicationController
  before_filter :select, :only => [:edit, :show, :update, :destroy]
  
  def index
    @title = "Subcategory"
    @subcategories = Subcategory.order(:created_at).page(params[:page]).per(3)
  end

  def new
    @subcategory = Subcategory.new
  end
  
  def create
    @subcategory = Subcategory.new(params[:subcategory])
    
    if @subcategory.save
      redirect_to(librarian_subcategories_url, :notice => 'Subcategory was successfully created.')
      else
      render :action => "new"
    end
  end

  def edit
  end
  
  def update
    if @subcategory.update_attributes(params[:subcategory])
      redirect_to(edit_librarian_subcategories_url, :notice => 'Subcategory was successfully updated.')
      else
      render :action => "edit"
    end
  end

  def select
    @subcategory = Subcategory.find_id(params[:id])
  end

end
