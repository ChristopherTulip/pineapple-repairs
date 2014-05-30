require 'spec_helper'

describe RegistrationsController do

	describe "when registering" do
    before do 
      @request.env["devise.mapping"] = Devise.mappings[:contractor]
    end 
    

    describe "as a new user" do
    	let!(:location) { Location.create( city: 'vancouver', country: 'canada') }
      let!(:location1) { Location.create( city: 'burnaby', country: 'canada')}

    	describe "with a new location" do

    		describe "registrations#create" do
    			before do
    				 post :create, contractor: attributes_for(:contractor).merge(location: {city: "toronto", country: "canada"})
    			end
    			
    			it "should create a new location" do
            contractor = Contractor.last

            expect(Location.last).to eq(contractor.location)

    				expect(Location.last.city).to eq("toronto")
    				expect(Location.last.country).to eq("canada")
    			end
    		end

    		
    	end

    	describe "with a current location" do
    		
    		describe "registrations#create" do
    			before do
            post :create, contractor: attributes_for(:contractor).merge(location: {city: 'vancouver', country: 'canada'})
          end

    			it "should not create a new location" do
            contractor = Contractor.last

            expect(Location.last).to_not eq(contractor.location)
            expect(Location.last.city).to_not eq("vancouver")
    			end
    		
    		end
    		
    	end


      describe "registrations#create" do
        before do
          post :create, contractor: {
            name: "Neal O'Grady",
            password: '12345678',
            email: "neal@nealogrady.com",
            phone_number: "7787066325",
            location: {
              city: 'vancouver',
              country: 'canada'
            }
          }
        end

	      it "should create a new contractor" do
          contractor = Contractor.last

	      	expect(contractor.name).to eq("Neal O'Grady")
	      	expect(contractor.email).to eq("neal@nealogrady.com")
          expect(contractor.phone_number).to eq("7787066325")
	      	expect(contractor.location.city).to eq("vancouver")
	      	expect(contractor.location.country).to eq("canada")
	      end

	      it "should redirect to dashboard_path" do
	        # should redirect_to root_path
	        expect(flash[:notice]).to eq("Thanks for creating an account, we will review and verify your account shortly.")
	      end
	    end
    end

    describe "as a returning user" do
      let!(:location) { Location.create( city: 'vancouver', country: 'canada') }
  		let!(:contractor) { create(:contractor, email: "neal@nealogrady.com", password: "12345678", name: "Neal O'Grady", location: location )}
      let!(:contractor1) { create(:contractor, email: "neal1@nealogrady.com", password: "12345678", name: "Neal O'Grady", location: location )}

      describe "registrations#create" do
        before do
          post :create, contractor: {
            name: "Neal O'Grady",
            password: '12345678',
            email: "neal@nealogrady.com",
            phone_number: "7787066325",
            location: {
              city: 'vancouver',
              country: 'canada'
            }
          }
        end

        it "should not create a new user" do
          contractor = Contractor.last
          puts Contractor.all

          expect(Contractor.last.email).to_not eq("neal@nealogrady.com")
        end
      end
    end
  end
end
