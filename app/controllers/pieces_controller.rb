class PiecesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
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
    flash[:notice] = 'Piece was successfully created.' if @piece.save
    respond_with(@piece)
  end

  def update
    flash[:notice] = 'Piece was successfully updated.' if @piece.update(piece_params)
    respond_with(@piece)
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
      redirect_to pieces_path, notice: "Access Denied! Not authorized to edit this piece." if @piece.nil?
    end

    def piece_params
      params.require(:piece).permit(:title, :image, :genre, :size, :price, :description, :status)
    end
end
