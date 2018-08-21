require 'rails_helper'

RSpec.describe Product, type: :model do
    context 'Validations' do
        #happy path
        it 'should valid all, happy path' do
            @category = Category.find_or_create_by! name: 'test'
            @product = @category.products.new({
              name:  'Awesome Name',
              quantity: 1,
              price: 9.99
            })
            expect(@product.save).to be true
        end

        it 'should have category' do
            @product = Product.new({
              name:  'Awesome Name',
              quantity: 1,
              price: 9.99
            })
            expect(@product.save).to be false   
            expect(@product.errors.full_messages).to eq(["Category can't be blank"])
        end

        it 'should have name' do
            @category = Category.find_or_create_by! name: 'test'
            @product = @category.products.new({
              name:  nil,
              quantity: 1,
              price: 9.99
            })
            expect(@product.save).to be false   
            expect(@product.errors.full_messages).to eq(["Name can't be blank"])
        end

        it 'should have quantity' do
            @category = Category.find_or_create_by! name: 'test'
            @product = @category.products.new({
                name:  'Awesome Name',
                quantity: nil,
                price: 9.99
            })
            expect(@product.save).to be false   
            expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
        end
        
        it 'should have price' do
            @category = Category.find_or_create_by! name: 'test'
            @product = @category.products.new({
                name:  'Awesome Name',
                quantity: 1,
                price: nil
            })
            expect(@product.save).to be false   
            expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
        end
    end
  end