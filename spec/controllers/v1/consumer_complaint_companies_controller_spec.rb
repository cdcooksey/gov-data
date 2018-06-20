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
 
  end





  describe "GET #show" do
    let(:company)    { FactoryBot.create(:consumer_complaint_company) }
    let(:company_id) { company.id }


    before { get :show, params: { id: company_id } }
    
    let(:consumer_complaints) { FactoryBot.create_list(:consumer_complaint, 100, consumer_complaint_company: company) }

    let(:expected_payload) do
      JSON.parse(ConsumerComplaintSerializer.new(expected_consumer_complaints).serialized_json)
    end

    context 'without page param' do
      let(:expected_consumer_complaints) { consumer_complaints.first(50) }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end

    context 'with page param' do
      let(:page) { 1 }
      let(:action) { get :index, params: { page: page } }
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

