class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end
  
  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])

    render :edit
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if Cat.persisted?(@cat)
      if @cat.update(cat_params)
        redirect_to cat_url(@cat)
      else
        render :edit
      end
    else
      render json: "this cat doesnt exist"
    end
  end

  def destroy
    render json: "what are you doing here"
  end
  
  private

  def cat_params
    params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
  end
end
