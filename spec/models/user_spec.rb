require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "#to_s" do
    it "returns nil if there is no user" do
      user = User.new
      expect(user.to_s).to eq nil
    end

    it "returns user email" do
      email = "huy@gmail.com"
      user = User.new email: email

      expect(user.to_s).to eq "huy@gmail.com"
    end
  end

  describe ".from_omniauth" do
    SAMPLE_AUTH = {
      provider: 'facebook',
      uid: '1234567',
      info: {
        email: 'joe@bloggs.com',
        name: 'Joe Bloggs',
        first_name: 'Joe',
        last_name: 'Bloggs',
        image: 'http://graph.facebook.com/1234567/picture?type=square',
        verified: true
      },
      credentials: {
        token: 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
        expires_at: 1321747205, # when the access token expires (it always will)
        expires: true # this will always be true
      },
      extra: {
        raw_info: {
          id: '1234567',
          name: 'Joe Bloggs',
          first_name: 'Joe',
          last_name: 'Bloggs',
          link: 'http://www.facebook.com/jbloggs',
          username: 'jbloggs',
          location: { id: '123456789', name: 'Palo Alto, California' },
          gender: 'male',
          email: 'joe@bloggs.com',
          timezone: -8,
          locale: 'en_US',
          verified: true,
          updated_time: '2011-11-11T06:21:03+0000',
          # ...
        }
      }
    }

    it "parses email, name, and user correctly" do
      user = User.from_omniauth(SAMPLE_AUTH)
      expect(user.email).to eq('joe@bloggs.com')
    end
  end
end
