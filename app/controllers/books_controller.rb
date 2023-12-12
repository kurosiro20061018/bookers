class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "successfully投稿に成功しました。"
    redirect_to book_path(@book.id)
    else
    flash.now[:alert] = "successfully投稿に失敗しました。"
    @books = Book.all
    render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success] = "successfully更新に成功しました。"
    render :show
    else
    flash.now[:alert] = "successfully更新に失敗しました。"
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:deleted] = "successfully削除に成功しました。"
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end