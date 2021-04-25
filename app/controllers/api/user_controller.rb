class Api::UserController < ApplicationController
	def create
		render json: User.create(user_params)
	end
	def show
		render json: User.find_by_id(params[:id])
	end

	def index
		render json: User.paginate(page: params[:page])
	end

	def update
		user = User.find_by_id(params[:id])
		user.update(user_params) if user
		render json: user
	end

	def delete
		User.delete(params[:id])
		render json: []
	end

	def typeahead
		str = params[:input]
		matches = []
		User.find_matches(str).each do |user|
			matches << user.first_name + ' ' + user.last_name
    	end
     results = matches.present? ? matches.join(' and ') : ''
     render json: {results: results}
	end

	private
	def user_params
		params.permit(:first_name,:last_name,:email)
	end
end
