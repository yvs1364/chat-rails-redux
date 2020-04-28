class Api::V1::MessagesController < ApplicationController
  before_action :set_chan

  def index
    messages = @channel.messages
    render json: messages
  end

  def create
    message = @channel.messages.build(content: params[:content])
    message.user = current_user
    message.save
    render json: message
  end

  private

  def set_chan
    @channel = Channel.find_by(params[:name])
  end
end
