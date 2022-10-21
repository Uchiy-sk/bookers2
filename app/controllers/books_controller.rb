class BooksController < ApplicationController

  def index
    # 新規投稿用
    @book = Book.new
    # 一覧表示用
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id # ユーザーid情報の紐づけ
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)

  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
