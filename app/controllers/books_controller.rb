class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new#レイアウト試し
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "1 error prohibited this book from being saved:"
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "1 error prohibited this book from being saved:"
      render :edit
    end
    # book = Book.find(params[:id])
    # book.update(book_params)
    # redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully created."
    redirect_to '/books'
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
