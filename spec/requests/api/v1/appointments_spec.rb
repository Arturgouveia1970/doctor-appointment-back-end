require 'swagger_helper'

RSpec.describe 'api/v1/appointments', type: :request do
  path '/api/v1/users/{user_id}/appointments' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list appointments') do
      tags 'Appointments'
      response(200, 'successful') do
        let(:user_id) { User.create(name: 'Artur', email: 'art@gmail.com', password: '123456').id }

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

    post('create appointment') do
      tags 'Appointments'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :appointment, in: :body, schema: {
          type: :object,
          properties: {
            appointment_date: { type: :date },
            city: { type: :string },
            duration: { type: :integer },
            user_id: { type: :bigint },
            doctor_id: { type: :bigint }
          },
          required: %w[apointment_date city user_id doctor_id]
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

  path '/api/v1/users/{user_id}/appointments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show appointment') do
      tags 'Appointments'
      response(200, 'successful') do
        let(:user_id) do
          User.create(name: 'user', email: 'user@gmail.com', password: '123456').id
        end
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'treats the nervous system', doctor_id:).id }
        let(:doctor_id) do
          Doctor.create(name: 'Jivago', location: 'Angola', speciality: 'Neurology', image_url: 'image.jpg').id
        end

        let(:speciality_id) { speciality.id }
        let(:appointment) do
          Appointment.create!(city: 'Luanda', duration: 1, user_id:, doctor_id:)
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

    patch('update appointment') do
      tags 'Appointments'
      consumes 'application/json'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          appointment_date: { type: :date },
          city: { type: :string },
          duration: { type: :integer },
          user_id: { type: :bigint },
          doctor_id: { type: :bigint }
        },
        required: %w[appointment_date city duration user_id doctor_id]
      }
      response(200, 'successful') do
        let(:user_id) do
          User.create(name: 'user', email: 'user@gmail.com', password: '123456').id
        end
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'treats the nervous system', doctor_id:).id }
        let(:doctor_id) do
          Doctor.create(name: 'Jivago', location: 'Angola', speciality: 'Neurology', image_url: 'image.jpg').id
        end

        let(:doctor_id) { doctor.id }
        let(:appointment) do
          Appointment.create!(city: 'Luanda', duration: 1, user_id:, doctor_id:)
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

    put('update appointment') do
      tags 'Appointments'
      consumes 'application/json'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          appointment_date: { type: :date },
          city: { type: :string },
          duration: { type: :integer },
          user_id: { type: :bigint },
          doctor_id: { type: :bigint }
        },
        required: %w[appointment_date city duration user_id doctor_id]
      }
      response(200, 'successful') do
        let(:user_id) do
          User.create(name: 'user', email: 'user@gmail.com', password: '123456').id
        end
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'treats the nervous system', doctor_id:).id }
        let(:doctor_id) do
          Doctor.create(name: 'Jivago', location: 'Angola', speciality: 'Neurology', image_url: 'image.jpg').id
        end
        let(:doctor_id) { doctor.id }
        let(:appointment) do
          Appointment.create!(city: 'Luanda', duration: 1, user_id:, doctor_id:)
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

    delete('delete appointment') do
      tags 'Appointments'
      response(200, 'successful') do
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

  # path '/api/v1/appointments' do

  #   get('list appointments') do
  #     tags 'Appointments'
  #     consumes 'application/json'
  #         parameter name: :appointment, in: :body, schema: {
  #         type: :object,
  #         properties: {
  #           appointment_date: { type: :date },
  #           city: { type: :string },
  #           duration: { type: :integer },
  #           user_id: { type: :bigint },
  #           doctor_id: { type: :bigint }
  #         },
  #     response(200, 'successful') do

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end

  #   post('create appointment') do
  #     tags 'Appointments'
  #     response(200, 'successful') do
  #       consumes 'application/json'
  #         parameter name: :appointment, in: :body, schema: {
  #         type: :object,
  #         properties: {
  #           appointment_date: { type: :date },
  #           city: { type: :string },
  #           duration: { type: :integer },
  #           user_id: { type: :bigint },
  #           doctor_id: { type: :bigint }
  #         },

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  # path '/api/v1/appointments/{id}/edit' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'id', in: :path, type: :string, description: 'id'

  #   get('edit appointment') do
  #     tags 'Appointments'
  #     response(200, 'successful') do
  #       let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
  #       consumes 'application/json'
  #       parameter name: :appointment, in: :body, schema: {
  #       type: :object,
  #       properties: {
  #         appointment_date: { type: :date },
  #         city: { type: :string },
  #         duration: { type: :integer },
  #         user_id: { type: :bigint },
  #         doctor_id: { type: :bigint }
  #       },

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  #   path '/api/v1/appointments/{id}' do
  #     # You'll want to customize the parameter types...
  #     parameter name: 'id', in: :path, type: :string, description: 'id'

  #     get('show appointment') do
  #       tags 'Appointments'
  #       response(200, 'successful') do
  #         let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
  #         consumes 'application/json'
  #           parameter name: :appointment, in: :body, schema: {
  #           type: :object,
  #           properties: {
  #             appointment_date: { type: :date },
  #             city: { type: :string },
  #             duration: { type: :integer },
  #             user_id: { type: :bigint },
  #             doctor_id: { type: :bigint }
  #           },

  #         after do |example|
  #           example.metadata[:response][:content] = {
  #             'application/json' => {
  #               example: JSON.parse(response.body, symbolize_names: true)
  #             }
  #           }
  #         end
  #         run_test!
  #       end
  #     end

  #     patch('update appointment') do
  #       tags 'Appointments'
  #       response(200, 'successful') do
  #         let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
  #         consumes 'application/json'
  #           parameter name: :appointment, in: :body, schema: {
  #           type: :object,
  #           properties: {
  #             appointment_date: { type: :date },
  #             city: { type: :string },
  #             duration: { type: :integer },
  #             user_id: { type: :bigint },
  #             doctor_id: { type: :bigint }
  #           },
  #         after do |example|
  #           example.metadata[:response][:content] = {
  #             'application/json' => {
  #               example: JSON.parse(response.body, symbolize_names: true)
  #             }
  #           }
  #         end
  #         run_test!
  #       end
  #     end

  #     put('update appointment') do
  #       tags 'Appointments'
  #       response(200, 'successful') do
  #         let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
  #         consumes 'application/json'
  #           parameter name: :appointment, in: :body, schema: {
  #           type: :object,
  #           properties: {
  #             appointment_date: { type: :date },
  #             city: { type: :string },
  #             duration: { type: :integer },
  #             user_id: { type: :bigint },
  #             doctor_id: { type: :bigint }
  #           },

  #         after do |example|
  #           example.metadata[:response][:content] = {
  #             'application/json' => {
  #               example: JSON.parse(response.body, symbolize_names: true)
  #             }
  #           }
  #         end
  #         run_test!
  #       end
  #     end

  #     delete('delete appointment') do
  #       tags 'Appointments'
  #       response(200, 'successful') do
  #         let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
  #         consumes 'application/json'
  #           parameter name: :appointment, in: :body, schema: {
  #           type: :object,
  #           properties: {
  #             appointment_date: { type: :date },
  #             city: { type: :string },
  #             duration: { type: :integer },
  #             user_id: { type: :bigint },
  #             doctor_id: { type: :bigint }
  #           },

  #         after do |example|
  #           example.metadata[:response][:content] = {
  #             'application/json' => {
  #               example: JSON.parse(response.body, symbolize_names: true)
  #             }
  #           }
  #         end
  #         run_test!
  #       end
  #     end
  #   end
end
