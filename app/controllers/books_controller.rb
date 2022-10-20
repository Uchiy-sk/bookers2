class BooksController < ApplicationController

  def index
    # 新規投稿用
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id # ユーザーid情報の紐づけ
    @book.save
    redirect_to books_path
  end

  def edit
  end

  def show
  end

  def destroy
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
