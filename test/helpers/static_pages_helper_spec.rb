require 'rails_helper'
require 'f1data.rb'

# Specs in this file have access to a helper object that includes
# the StaticPagesHelper. For example:
#
# describe StaticPagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

# RSpec.describe StaticPagesHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end



  describe 'F1Data' do
    it "returns data correctly" do
      expect(F1Data.api_call).to  be_kind_of(Hash)
    end
  end