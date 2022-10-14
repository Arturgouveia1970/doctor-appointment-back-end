require 'swagger_helper'

RSpec.describe 'api/v1/doctors', type: :request do
  path '/api/v1/doctors' do
    get('list doctors') do
      tags 'Doctors'
      response(200, 'successful') do
        let(:user_id) { User.create(name: 'Manuel', email: 'man@gmail.com', password: '123456').id }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create doctor') do
      tags 'Doctors'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            speciality: { type: :string },
            email: { type: :string },
            location: { type: :string },
            # user_id: { type: :bigint },
            image_url: { type: :string }
          },
          required: %w[name speciality location email user_id image_url]
        }
        let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
        let(:doctor_id) do
          Doctor.create(name: 'Jivago', location: 'Angola', speciality: 'Neurology', image_url: 'image.jpg').id
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show doctor') do
      tags 'Doctors'
      response(200, 'successful') do
        let(:id) { '123' }
        User.create(name: 'user', email: 'user@gmail.com', password: '123456').id
        # end
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'treats the nervous system', doctor_id:).id }
        let(:doctor_id) do
          Doctor.create(name: 'Jivago', location: 'Angola', speciality: 'Neurology', image_url: 'image.jpg').id
        end

        let(:speciality_id) { speciality.id }
        let(:doctor) do
          Doctor.create!(name: 'Jivago', location: 'Angola', speciality: 'Neurology', image_url: 'image.jpg')
        end

        let(:id) { doctor.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update doctor') do
      tags 'Doctors'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          speciality: { type: :string },
          email: { type: :integer },
          location: { type: :string },
          # user_id: { type: :integer },
          image_url: { type: :string }
        },
        required: %w[name speciality email location user_id image_url]
      }
      response(200, 'successful') do
        let(:id) { '123' }
        User.create(name: 'user', email: 'user@gmail.com', password: '123456').id
        # end
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'treats the nervous system', doctor_id:).id }
        let(:doctor_id) do
          Doctor.create(name: 'Jivago', location: 'Angola', speciality: 'Neurology', image_url: 'image.jpg').id
        end

        let(:doctor_id) { doctor.id }
        let(:doctor) do
          Doctor.create!(name: 'Jivago', location: 'Angola', speciality: 'Neurology', image_url: 'image.jpg')
        end
        let(:id) { appointment.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update doctor') do
      tags 'Doctors'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          speciality: { type: :string },
          email: { type: :integer },
          location: { type: :string },
          # user_id: { type: :bigint },
          image_url: { type: :string }
        },
        required: %w[name speciality email location user_id image_url]
      }
      response(200, 'successful') do
        let(:id) { '123' }
        User.create(name: 'user', email: 'user@gmail.com', password: '123456').id

        let(:speciality) { Speciality.create(name: 'Neurology', description: 'treats the nervous system', doctor_id:).id }
        let(:doctor_id) do
          Doctor.create(name: 'Jivago', location: 'Angola', speciality: 'Neurology', image_url: 'image.jpg').id
        end
        let(:doctor_id) { doctor.id }
        let(:doctor) do
          Doctor.create!(name: 'Jivago', location: 'Angola', speciality: 'Neurology', image_url: 'image.jpg')
        end
        let(:id) { appointment.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete doctor') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
