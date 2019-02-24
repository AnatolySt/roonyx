require 'rails_helper'

RSpec.describe SalesController, type: :controller do
  describe 'GET #index' do

    let!(:good) { create(:good) }
    let!(:first_sale) { create(:first_sale, good: good) }
    let!(:last_sale) { create(:last_sale, good: good) }

    context 'with date params' do
      before { get :index, params: { from: first_sale.date, to: last_sale.date }, format: :json }

      it 'render index view' do
        expect(response).to render_template :index
      end

      it 'returns 200 status code' do
        expect(response).to be_successful
      end

      it 'returns list of sales' do
        expect(response.body).to have_json_size(4)
      end

      %w(from to goods total_revenue).each do |attr|
        it "returns json with #{attr} included" do
          hash_body = JSON.parse(response.body)
          expect(hash_body.keys).to include(attr)
        end
      end
    end

    context 'without date params' do
      before { get :index, format: :json }

      it 'returns 422 status code' do
        expect(response.status).to eq 422
      end
    end

  end
end
