require 'rails_helper'

RSpec.describe LandingsController, type: :controller do
  describe "GET index" do
    it "has equalivent index template" do
      get :index
      expect(response).to render_template('landings/index')
    end
  end
end
