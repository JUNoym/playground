class BooksController < ApplicationController
  protect_from_forgery except: [:destroy]
  before_action :set_book_params, only: [:show, :destroy]

  def show
    p "あああああああああああああああああ"
    p params
    p "あああああああああああああああああ"
    # @book = Book.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def destroy
    # @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { render json: @book }
    end
  end

  private
    def set_book_params
      puts "set_book_paramsが動いてる！！！！"
      @book = Book.find(params[:id])
    end
end
