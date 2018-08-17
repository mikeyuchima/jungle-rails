class Admin::AuthController < ApplicationController
    http_basic_authenticate_with name: Rails.configuration.admin[:Username], password: Rails.configuration.admin[:Password]
end