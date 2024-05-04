class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    #@prototype = Prototype.index
      #@room = Room.find(params[:room_id])
      #@messages = @room.messages.includes(:user)
      #@prototypes = Prototype.includes(:user).order("created_at DESC")
      @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    #redirect_to '/'
    if @prototype.save
      redirect_to prototypes_path
    else
    render :new, status: :unprocessable_entity
  end

    

    #Prototype.create(prototype_params)
    #redirect_to '/'
     
  end

  def show
    @prototype = Prototype.find(params[:id])
    #@comment = Comment.new(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end
  
  def edit
   @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
    redirect_to prototype_path
    else
      render :edit, status: :unprocessable_entity
      #redirect_to prototype_path(:id)
    end
    #if prototype.save
    #redirect_to prototype_path(prototype)
    #if @prototype.update(prototype_params)
    #redirect_to root_path
    #else
     # render :edit, status: :unprocessable_entity
    #end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path

  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless user_signed_in?&& current_user.id == @prototype.user_id
      redirect_to action: :index
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
