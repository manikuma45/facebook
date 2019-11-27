class NicesController < ApplicationController
	
	def create
		nice = current_user.nices.create(message_id: params[:message_id])
		redirect_to messages_url, notice: "#{nice.message.user.name}さんのメッセージにいいねをしました"
	end


	def destroy
		nice = current_user.nices.find_by(id: params[:id]).destroy
		redirect_to messages_url, notice: "#{nice.message.user.name}さんのいいねを解除しました"
	end
end
