class PiecesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :piece_ready_to_show, only: [:show]
  before_action :can_see_requests, only: [:requests]
  respond_to :html

  def index
    @pieces = Piece.all
    respond_with(@pieces)
  end

   def requests
    @pieces = Piece.all
    respond_with(@pieces)
  end

  def show
    respond_with(@piece)
  end

  def new
    @piece = current_user.pieces.build
    respond_with(@piece)
  end

  def edit
  end

  def create
    @piece = current_user.pieces.build(piece_params)
    @piece.status = 2 if current_user.email != "arjun0999@gmail.com"
    flash[:notice] = 'Piece was successfully created.' if @piece.save
    respond_with(@piece)
  end

  def update
    @piece.attributes = piece_params
    @piece.status = 2 if current_user.email != "arjun0999@gmail.com"
    if @piece.save
      flash[:notice] = 'Piece was successfully updated.'
      respond_with(@piece)
    end
  end

  def destroy
    flash[:notice] = 'Piece was successfully deleted.' if @piece.destroy
    respond_with(@piece)
  end

  private
    def set_piece
      @piece = Piece.find(params[:id])
    end

    def correct_user
      @piece = current_user.pieces.find_by(id: params[:id])
      redirect_to pieces_path, notice: "Access Denied! Not authorized to edit this piece." and return if @piece.nil? and current_user.email != "arjun0999@gmail.com"
      @piece = Piece.find(params[:id]) if current_user.email == "arjun0999@gmail.com"
    end

    def piece_ready_to_show
      if @piece.status != 1
        if user_signed_in?
          return if current_user.email == "arjun0999@gmail.com"
          return if @piece.user == current_user  
          redirect_to pieces_path, notice: "This piece is not ready to be shown."

        else
          redirect_to pieces_path, notice: "This piece is not ready to be shown."
        end
      end   
    end

    def can_see_requests
      return if user_signed_in? and current_user.email == "arjun0999@gmail.com"
      redirect_to pieces_path, notice: "Access Denied. Admin only." 
    end

    def piece_params
      params.require(:piece).permit(:title, :image, :genre, :size, :price, :description, :status)
    end
end
