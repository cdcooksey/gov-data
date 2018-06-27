require 'rails_helper'

RSpec.describe V1::ConsumerComplaintZipCodesController, type: :controller do

  let(:actual) { JSON.parse(response.body) }
  subject { actual }

  describe "GET #index" do
    before do
      zip_codes
      action
    end

    let(:action) { get :index }
    let(:zip_codes) { FactoryBot.create_list(:consumer_complaint_zip_code, 103) }

    let(:expected_payload) do
      JSON.parse(ConsumerComplaintZipCodeSerializer.new(expected_zip_codes).serialized_json)
    end

    context 'without page param' do
      let(:expected_zip_codes) { zip_codes.first(50) }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end

    context 'with page param' do
      let(:page) { 1 }
      let(:action) { get :index, params: { page: page } }

      let(:expected_zip_codes) { zip_codes.drop(50).first(50) }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end

    context 'when no zip_codes exist' do
      let(:zip_codes) { [] }
      let(:expected_payload) { { data: [] }.as_json }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end

    describe 'searching by zip_code' do
      let(:search_term) { 0 }
      let(:action) { get :index, params: { zip_code: search_term } }

      describe 'not getting results' do
        let(:zip_codes) { [] }
        let(:expected_payload) { { data: [] }.as_json }

        it { expect(response).to have_http_status :ok }
        it { is_expected.to eq(expected_payload) }
      end

      describe 'getting results' do
        let(:zip_code_range) { rand(11111..11119) }
        let(:zip_codes) { FactoryBot.create_list(:consumer_complaint_zip_code, 4, name: zip_code_range) }
        let(:expected_zip_codes) { zip_codes }

        context 'when searching by one character' do
          let(:search_term) { zip_code_range.to_s.first(1) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by two characters' do
          let(:search_term) { zip_code_range.to_s.first(1) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by three characters' do
          let(:search_term) { zip_code_range.to_s.first(3) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by four characters' do
          let(:search_term) { zip_code_range.to_s.first(4) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by five characters' do
          let(:search_term) { zip_code_range.to_s.first(5) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by six characters' do
          let(:search_term) { zip_code_range.to_s.first(6) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by seven characters' do
          let(:search_term) { zip_code_range.to_s.first(7) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

      end
    end

  end


  describe "GET #show" do
    before do
      expected_payload
      action
    end

    let(:zip_code)    { FactoryBot.create(:consumer_complaint_zip_code) }
    let(:zip_code_id) { zip_code.id }

    let(:consumer_complaints) do 
      FactoryBot.create_list(:consumer_complaint, 1, consumer_complaint_zip_code: zip_code)
    end

    let(:expected_payload) do
      JSON.parse(ConsumerComplaintSerializer.new(expected_consumer_complaints).serialized_json)
    end

    let(:action) { get :show, params: { id: zip_code_id} }

    context 'without page param' do
      let(:expected_consumer_complaints) { consumer_complaints.first(50) }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end

    context 'with page param' do
      let(:page) { 1 }
      let(:action) { get :show, params: { id: zip_code_id, page: page } }
      let(:expected_consumer_complaints) { consumer_complaints.drop(50).first(50) }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end

    context 'when no ConsumerComplaints exist' do
      let(:consumer_complaints) { [] }
      let(:expected_payload) { { data: [] }.as_json }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end
  end


end

