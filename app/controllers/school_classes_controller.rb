class SchoolClassesController < ApplicationController
  def new
    @school_class = SchoolClass.new
  end
  
  def create
    @school_class = SchoolClass.new
    @school_class.title = params[:school_class][:title]
    @school_class.room_number = params[:school_class][:room_number]
    @school_class.save
    
    redirect_to school_class_path(@school_class)
  end
  
  def show
    @school_class = SchoolClass.find(params[:id])
  end
  
  def edit
    @school_class = SchoolClass.find(params[:id])
  end
  
  def update
    @school_class = SchoolClass.find(params[:id])
    @school_class.update(school_class_params)
    
    redirect_to school_class_path @school_class
  end
  
  private
  
  def school_class_params # (*args)
    # params.require(:school_class).permit(*args) # doesn't work in this case I think
    params.require(:school_class).permit(:title, :room_number)
  end
end
