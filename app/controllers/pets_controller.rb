class PetsController < ApplicationController
  def index
    @pets = Pet.all

    render :index
  end

  def show
    @pet = Pet.find(params[:id])

    render :show
  end

  def create
    @pet = Pet.create(
      name: params["name"],
      age: params["age"],
      breed: params["breed"],
      user_id: params["user_id"]
    )

    if @pet.valid?
      render :show
    else
      render json: { errors: @pet.errors.full_messages }
    end
  end

  def update
    @pet = Pet.find(params["id"])

    @pet.update(
      name: params["name"] || @pet.name,
      age: params["age"] || @pet.age,
      breed: params["breed"] || @pet.breed,
      user_id: params["user_id"] || @pet.user_id
    )

    if @pet.valid?
      render :show
    else
      render json: { errors: @pet.errors.full_messages }
    end
  end

  def destroy
    @pet = Pet.find(params["id"])
    @pet.destroy

    render json: { message: "Pet successfully deleted." }
  end
end
