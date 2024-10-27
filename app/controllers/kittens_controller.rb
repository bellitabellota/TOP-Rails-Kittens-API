class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(perm_params)

    if @kitten.save
      flash[:success] = "You successfully created an entry for #{@kitten.name}!"
      redirect_to @kitten
    else
      flash.now[:error] = "Ups. That did not work."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(perm_params)
      flash[:success] = "You successfully updated the entry for #{@kitten.name}!"
      redirect_to @kitten
    else
      flash.now[:error] = "Ups. That did not work."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "You successfully deleted the entry for #{@kitten.name}!"
    redirect_to root_path
  end

  private

  def perm_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
