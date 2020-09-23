class PetsController < ApplicationController
  # /pets
  def index
    @pets = Pet.all
  end

  # /pets/:id
  def show
    @pet = Pet.find(params[:id])
  end

  # pets/new
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  # /pets/:id - verb: delete
  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :date_of_birth, :type, :adopted, :photo)
  end
end
