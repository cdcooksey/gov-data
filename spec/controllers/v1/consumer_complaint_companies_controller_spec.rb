require 'rails_helper'

RSpec.describe V1::ConsumerComplaintCompaniesController, type: :controller do

  let(:actual) { JSON.parse(response.body) }
  subject { actual }

  describe "GET #index" do
    before do
      companies
      action
    end

    let(:action) { get :index }
    let(:companies) { FactoryBot.create_list(:consumer_complaint_company, 103) }

    let(:expected_payload) do
      JSON.parse(ConsumerComplaintCompanySerializer.new(expected_companies).serialized_json)
    end

    context 'without page param' do
      let(:expected_companies) { companies.first(50) }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end

    context 'with page param' do
      let(:page) { 1 }
      let(:action) { get :index, params: { page: page } }

      let(:expected_companies) { companies.drop(50).first(50) }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end

    context 'when no companies exist' do
      let(:companies) { [] }
      let(:expected_payload) { { data: [] }.as_json }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end
 

    describe 'searching by company name' do
      let(:search_term) { 0 }
      let(:action) { get :index, params: { company: search_term } }

      describe 'not getting results' do
        let(:expected_companies) { [] }
        let(:expected_payload) { { data: [] }.as_json }

        it { expect(response).to have_http_status :ok }
        it { is_expected.to eq(expected_payload) }
      end

      describe 'getting results' do
        let(:company_name) { Faker::Lorem.characters(7) }
        let(:companies) { FactoryBot.create_list(:consumer_complaint_company, 4, name: company_name) }
        let(:expected_companies) { companies }

        context 'when searching by one character' do
          let(:search_term) { company_name.first(1) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by two characters' do
          let(:search_term) { company_name.first(1) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by three characters' do
          let(:search_term) { company_name.first(3) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by four characters' do
          let(:search_term) { company_name.first(4) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by five characters' do
          let(:search_term) { company_name.first(5) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by six characters' do
          let(:search_term) { company_name.first(6) }
          it { expect(response).to have_http_status :ok }
          it { is_expected.to eq(expected_payload) }
        end

        context 'when searching by seven characters' do
          let(:search_term) { company_name.first(7) }
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

    let(:company)    { FactoryBot.create(:consumer_complaint_company) }
    let(:company_id) { company.id }

    let(:consumer_complaints) do 
      FactoryBot.create_list(:consumer_complaint, 1, consumer_complaint_company: company)
    end

    let(:expected_payload) do
      JSON.parse(ConsumerComplaintSerializer.new(expected_consumer_complaints).serialized_json)
    end

    let(:action) { get :show, params: { id: company_id } }

    context 'without page param' do
      let(:expected_consumer_complaints) { consumer_complaints.first(50) }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end

    context 'with page param' do
      let(:page) { 1 }
      let(:action) { get :show, params: { id: company_id, page: page } }
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

