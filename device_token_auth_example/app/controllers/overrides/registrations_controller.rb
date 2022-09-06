# frozen_string_literal: true

module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController    
    private

    def sign_up_params
      params.permit(:name, :nickname, :email, :password, :password_confirmation)
    end
  end
end
