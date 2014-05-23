require 'spec_helper'

describe ContractorsController do
  describe "when signed in" do
    before do
      sign_in contractor
    end

    describe "as a contractor who isn't verified" do
      let(:contractor) { create(:contractor) }

      describe "post#verify" do
        before do
          post :verify, id: contractor
        end

        it "should now be verified" do
          contractor.reload
          expect(contractor.verified).to eq(true)
        end

        it "should redirect to contractors_path" do
          should redirect_to contractors_path
          expect(response.status).to be(302)
          expect(flash[:notice]).to eq("Contractor Successfully Verified")
        end
      end

      describe "get#show" do
        before do
          get :show, id: contractor
        end

        it "should redirect_to root_path" do
          should redirect_to root_path
          expect(flash[:notice]).to eq("Sorry you can't access this area until your profile has been verified!")
        end
      end

      describe "get#index" do
        before do
          get :index, id: contractor
        end

        it "should redirect_to root_path" do
          should redirect_to root_path
          expect(flash[:notice]).to eq("Sorry you can't access this area until your profile has been verified!")
        end
      end
    end

    describe "as a contractor who is verified" do
      let(:contractor) { create(:contractor, verified: true) }

      describe "get#show" do
        let!(:available_job) { create(:job) }
        let!(:current_job) { create(:job, contractor: contractor) }
        let!(:finished_job) { create(:job, contractor: contractor, finished: true) }

        before do
          get :show, id: contractor
        end

        it "should assign instance variables" do
          expect(assigns(:jobs_finished)).to eq([finished_job])
          expect(assigns(:jobs_current)).to eq([current_job])
          expect(assigns(:jobs_available)).to eq([available_job])
        end
      end

      describe "get#index" do
        before do
          get :index, id: contractor
        end

        it "should redirect_to root_path" do
          should redirect_to contractor_path(contractor)
          expect(flash[:notice]).to eq("Sorry this is an admin only area!")
        end
      end
    end

    describe "as an admin contractor get#index" do
      let(:contractor) { create(:contractor, verified: true, admin: true) }
      let(:contractor2) { create(:contractor) }

      before do
        get :index, id: contractor
      end

      it "should assign instance variables" do
        expect(assigns(:contractors)).to eq([contractor, contractor2])
      end

    end
  end
end
