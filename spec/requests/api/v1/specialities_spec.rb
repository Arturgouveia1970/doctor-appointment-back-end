require 'swagger_helper'

RSpec.describe 'api/v1/specialities', type: :request do
  path '/api/v1/specialities' do
    get('list specialities') do
      tags 'Specialities'

      response(200, 'successful') do
        let(:speciality_id) { Speciality.create(name: 'Neurology', description: 'looks after the nervous system', doctor_id:).id }

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

    post('create speciality') do
      tags 'Specialities'
      consumes 'application/json'
      parameter name: :speciality, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        },
        required: %w[name description]
      }

      response(200, 'successful') do
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'looks after the nervous system', doctor_id:).id }

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

  path '/api/v1/specialities/{id}/edit' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('edit speciality') do
      response(200, 'successful') do
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'looks after the nervous system', doctor_id:).id }

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

  path '/api/v1/specialities/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show speciality') do
      response(200, 'successful') do
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'looks after the nervous system', doctor_id:).id }
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

    patch('update speciality') do
      let(:speciality) { Speciality.create(name: 'Neurology', description: 'looks after the nervous system', doctor_id:).id }
      tags 'Specialities'
      consumes 'application/json'
      parameter name: :speciality, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        },
        required: %w[name description]
      }

      response(200, 'successful') do
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'looks after the nervous system', doctor_id:).id }

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

    put('update speciality') do
      let(:speciality) { Speciality.create(name: 'Neurology', description: 'looks after the nervous system', doctor_id:).id }
      tags 'Specialities'
      consumes 'application/json'
      parameter name: :speciality, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        },
        required: %w[name description]
      }

      response(200, 'successful') do
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'looks after the nervous system', doctor_id:).id }

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

    delete('delete speciality') do
      tags 'speciality'
      response(200, 'successful') do
        let(:speciality) { Speciality.create(name: 'Neurology', description: 'looks after the nervous system', doctor_id:).id }

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
