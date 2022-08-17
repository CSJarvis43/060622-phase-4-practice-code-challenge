class AppearancesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_valid_response

    def create
        appearance = Appearance.create!(appearance_params)
        render json: appearance, serializer: AppearanceGuestSerializer, status: :created
    end

    private

    def appearance_params
        params.permit(:rating, :episode_id, :guest_id)
    end

    def render_not_valid_response(inv)
        render json: { errors: inv.record.errors.full_messages }, status: :unprocessable_entity
    end

end
