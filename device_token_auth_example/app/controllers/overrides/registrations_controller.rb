# frozen_string_literal: true

module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def create
      cookies[:key] = { value: 'value', httponly: true, expires: 1.day }
      binding.pry
      super
    end
    private

    def sign_up_params
      params.permit(:name, :nickname, :email, :password, :password_confirmation)
    end
  end
end
