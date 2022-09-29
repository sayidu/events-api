# frozen_string_literal: true

module Api
  class EventsController < BaseController
    before_action :set_event, only: %i[show edit]

    # to do: index should support filtering for my events
    def index
      search_term = params[:search]&.strip&.downcase
      @events = search_term.present? ? Event.get_by_search_term(search_term) : Event.all
      @events = @events.page(page_no(params[:page]))
      render json: @events, status: :ok
    end

    def create
      @event = @user.events.new(events_params)
      if @event.save
        render json: @event, status: :created
      else
        render json: { errors: @event.errors.full_messages.join(',') },
               status: :unprocessable_entity
      end
    end

    def show
      render json: @event, status: :ok
    end

    def update
      @event = @user.events.find(params[:id])
      if @event.present? && @event.update(events_params)
        render json: @event, status: :ok
      else
        render json: { errors: @event.errors.full_messages.join(',') },
               status: :unprocessable_entity
      end
    end

    private

    def events_params
      params.require(:event).permit(:name, :description, :start_date, :end_date, :image)
    end

    def set_event
      @event = Event.find(params[:id])
    end
  end
end
