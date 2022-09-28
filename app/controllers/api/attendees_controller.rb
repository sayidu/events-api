# frozen_string_literal: true

module Api
  class AttendeesController < BaseController
    before_action :set_attendee, only: %i[show edit update]

    # To do: search should support event and user id
    def index
      search_term = params[:search]&.strip&.downcase
      @attendees = search_term.present? ? Attendee.get_by_search_term(search_term) : Attendee.all
      @attendees = @attendees.page(page_no(params[:page]))
      render json: @attendees, status: :ok
    end

    def create
      @event = Event.find(params[:event_id])
      @attendee = Attendee.new(event: @event, user: @user)
      if @attendee.save
        render json: @attendee, status: :created
      else
        render json: { errors: @attendee.errors.full_messages.join(',') },
               status: :unprocessable_entity
      end
    end

    def show
      render json: @attendee, status: :ok
    end

    def update
      if @attendee.update(attendees_params)
        render json: @attendee, status: :ok
      else
        render json: { errors: @attendee.errors.full_messages.join(',') },
               status: :unprocessable_entity
      end
    end

    private

    def attendees_params
      params.require(:attendee).permit(:event_id)
    end

    def set_attendee
      @attendee = Attendee.find(params[:id])
    end
  end
end
