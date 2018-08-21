require 'rails_helper'


RSpec.describe Product, type: :model do
    context 'Validations' do
        it 'should validate all user requirements' do
            @user = User.new({
              name:  'Lighthouse',
              email: 'Lighthouse@labs.com',
              password: 'lightbulb',
              password_confirmation: 'lightbulb'
            })
            expect(@user.save).to be true
        end

        it 'should make password and confirmation the same' do
            @user = User.new({
              name:  'Lighthouse',
              email: 'Lighthouse@labs.com',
              password: 'lightbulb',
              password_confirmation: 'bulbLight'
            })
            expect(@user.save).to be false
        end

        it 'should make password and confirmation the same' do
            @user = User.new({
              name:  'Lighthouse',
              email: 'Lighthouse@labs.com',
              password: 'lightbulb',
              password_confirmation: ''
            })
            expect(@user.save).to be false
        end
        
        it 'should make emails unique, case sensative is not unique' do
            @user = User.new({
              name:  'Lighthouse',
              email: 'Lighthouse@labs.com',
              password: 'lightbulb',
              password_confirmation: 'lightbulb'
            })

            @user2 = User.new({
                name:  'Lighthouse',
                email: 'LIGHTHOUSE@LABS.COM',
                password: 'lightbulb',
                password_confirmation: 'lightbulb'
              })
              
            @user.save
            expect(@user2.save).to be false
        end

        it 'should make password longer than 7' do
            @user = User.new({
              name:  'Lighthouse',
              email: 'Lighthouse@labs.com',
              password: 'bulb',
              password_confirmation: 'bulb'
            })
            expect(@user.password.length > 7 && @user.password_confirmation.length > 7).to be false
        end
    end

    describe '.authenticate_with_credentials' do
        it 'should return an instance of the user if authenticated' do

            @user = User.new({
                name:  'Lighthouse',
                email: 'Lighthouse@labs.com',
                password: 'lightbuld',
                password_confirmation: 'lightbulb'
            })
            @user.save
            @authenticated_user = User.authenticate_with_credentials('Lighthouse@labs.com', 'lightbulb')
            expect(@authenticated_user).to be true
        end
    end
end