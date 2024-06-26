class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    @user = current_user
    # 新規投稿用
    @book = Book.new
    # 一覧表示用
    @tag = params[:tag_name]
    if @tag
      @books = Book.tagged_with("#{params[:tag_name]}") # タグ絞り込み機能
    else
      @books = Book.all
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id # ユーザーid情報の紐づけ
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @comment = BookComment.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :tag_list)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
