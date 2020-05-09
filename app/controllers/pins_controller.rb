class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :destroy, :update]

	def index
		@pins = Pin.all.order("created_at ASC")
	end

	def new
		@pin = current_user.pins.build
	end

	def create
		@pin = current_user.pins.build(params_pin)

		if @pin.save
			redirect_to @pin, notice: "Successfully created new pin"
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @pin.update(params_pin)
			redirect_to @pin, notice: 'Pin was Successfully'
		else
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path
	end

	private

	def find_pin
		@pin = Pin.find(params[:id])
	end

	def params_pin
		params.require(:pin).permit(:title, :description, :image)
	end
end
