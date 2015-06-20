class AssetsController < ApplicationController

	def get
		asset = current_user.assets
	end

end
