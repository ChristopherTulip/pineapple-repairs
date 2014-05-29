require 'spec_helper'

describe RegistrationsController do

	describe "when registering" do

    

    describe "as a new user" do
    	let(:location) { Location.create( city: 'vancouver', country: 'canada') }

    	describe "with a new location" do
    		params = {
	        name: "Neal O'Grady",
	        email: "neal@nealogrady.com",
	        password: "password"
	      }
    		params[:city] = "toronto"
    		params[:country] = "canada"

    		describe "registrations#create" do
    			before do
    				# post "registrations#"
    			end
    			
    			it "should create a new location" do
    				expect(contractor.location.city).to eq("toronto")
    				expect(contractor.location.country).to eq("canada")
    			end
    		end

    		
    	end

    	# describe "with a current location" do
    	# 	params = {
     #    name: "Neal O'Grady",
     #    email: "neal@nealogrady.com",
     #    password: "password"
     #  }
    	# 	params[:city] = "vancouver"
    	# 	params[:country] = "canada"

    	# 	describe "registrations#create" do
    	# 		post :create, registration: params

    	# 		it "should not create a new location" do

    	# 		end
    		
    	# 	end
    		
    	# end


     #  describe "registrations#create" do
     #    post :create, registration: params


	    #   it "should create a new contractor" do
	    #   	expect(contractor.name).to eq("Neal O'Grady")
	    #   	expect(contractor.email).to eq("neal@nealogrady.com")
	    #   	expect(contractor.location.city).to eq("vancouver")
	    #   	expect(contractor.location.country).to eq("canada")
	    #   end

	    #   it "should redirect to dashboard_path" do
	    #     should redirect_to root_path
	    #     expect(flash[:notice]).to eq("Thanks for creating an account, we will review and verify your account shortly.")
	    #   end
	    # end
    end

    describe "as a returning user" do
    	before do 
    	#	let(:contractor) { create(:contractor, email: "neal@nealogrady.com", "")}
    	end
    end
  end

end
