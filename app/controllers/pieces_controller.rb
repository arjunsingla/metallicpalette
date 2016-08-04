class PiecesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :admin_or_user, only: [:edit, :update, :destroy]
  before_action :piece_ready_to_show, only: [:show]
  before_action :admin_only, only: [:requests, :bought]
  respond_to :html

  def index
    @pieces = Piece.all
    respond_with(@pieces)
  end

   def requests
    @pieces = Piece.where(status: 2)
    respond_with(@pieces)
  end

  def bought
    @pieces = Piece.where(status: 3)
    respond_with(@pieces)
  end

  def show
    @purchase = Purchase.find_by(piece_id: [@piece.id])
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
    @piece.status = 2
    flash[:notice] = 'Piece was successfully created.' if @piece.save
    respond_with(@piece)
  end

  def update
    @piece.attributes = piece_params
    @piece.status = 2 if !admin_user_signed_in?
    if @piece.save
      flash[:notice] = 'Piece was successfully updated.'
      respond_with(@piece)
    else
      render :edit
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
      if user_signed_in?
        @piece = current_user.pieces.find_by(id: params[:id])
        redirect_to pieces_path, notice: "Access Denied! Not authorized to edit this piece." and return if @piece.nil?
      end
      if admin_user_signed_in?
        @piece = Piece.find(params[:id])
      end
    end

    def piece_ready_to_show
      if @piece.status == 2
        return if user_signed_in? and @piece.user == current_user
        return if admin_user_signed_in?
        redirect_to pieces_path, notice: "This piece is not ready to be shown."
      end   
    end

    def admin_only
      return if admin_user_signed_in?
      redirect_to pieces_path, notice: "Access Denied. Admin only." 
    end

    def admin_or_user
      return if admin_user_signed_in?
      authenticate_user!
    end

    def piece_params
      params.require(:piece).permit(:title, :image, :genre, :size, :price, :description, :status)
    end
end
