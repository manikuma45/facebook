class MessagesController < ApplicationController
	before_action :set_message, only: [:show, :edit, :update, :destroy]
	def index
		@messages = Message.all
	end

	def show
		@nice = current_user.nices.find_by(message_id: @message.id)
	end

	def new
		if params[:back]
			@message = Message.new(message_params)
		else
			@message = Message.new
		end
	end

	def edit
	end

	def create
		@message = current_user.messages.build(message_params)

		if @message.save
			redirect_to @message, notice: '投稿しました！'
		else
			render :new, notice: '投稿に失敗しました！'
		end

	end
	def update

		if @message.update(message_params)
			redirect_to @message, notice: 'Message was successfully updated.' 
		else
			render :edit
		end

	end
	def destroy
		@message.destroy
		redirect_to messages_url, notice: '投稿を削除しました'

	end

	def confirm
		@message = current_user.messages.build(message_params)
		render :new if @message.invalid?
	end

	private
	def set_message
		@message = Message.find(params[:id])
	end
	def message_params
		params.require(:message).permit(:content, :image, :image_cache)
	end
end
