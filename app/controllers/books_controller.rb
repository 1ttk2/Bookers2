class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @current_user = current_user
  end

  def create
    @book =Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "create successfully"
    else
      @books = Book.all
      @current_user = current_user
      render :index
    end
  end

  def show
    @book=Book.find(params[:id])
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "update successfully"
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books", notice: "Book was successfully destroyed"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
