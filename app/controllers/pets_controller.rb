class PetsController < ApplicationController
  def index
    @pets = Pet.all
    render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  def create
    @pet = Pet.new(
      name: params["name"],
      age: params["age"],
      breed: params["breed"],
      user_id: params["user_id"]
    )

    if @pet.save
      render json: @pet, status: :created
    else
      render json: { errors: @pet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @pet = Pet.find(params["id"])

    if @pet.update(
      name: params["name"] || @pet.name,
      age: params["age"] || @pet.age,
      breed: params["breed"] || @pet.breed,
      user_id: params["user_id"] || @pet.user_id
    )
      render json: @pet
    else
      render json: { errors: @pet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @pet = Pet.find(params["id"])
    @pet.destroy
    head :no_content
  end
end
