shared_context "init credentials" do

  before(:all) do
    Chute.app_id = "508fc620018d162a070000d6"
    Chute.app_secret = "2ee285c24d8ffa83145aba8834f29ca1644b293a76a49db59a037e7301a26119"
    Chute.access_token = "fe5d08d828c1d4562e5d2a7bbbb76e7dfa1fbc0932467a7a710bec66935df654"
  end

end