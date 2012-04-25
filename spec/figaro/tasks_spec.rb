require "spec_helper"

describe "Figaro Rake tasks", :rake => true do
  describe "figaro:heroku" do
    it "configures Heroku" do
      Figaro.stub(:env => {"HELLO" => "world", "FOO" => "bar"})
      Kernel.should_receive(:system).once.with("heroku config:add FOO=bar HELLO=world")
      task.invoke
    end

    it "configures a specific Heroku app" do
      Figaro.stub(:env => {"HELLO" => "world", "FOO" => "bar"})
      Kernel.should_receive(:system).once.with("heroku config:add FOO=bar HELLO=world --app my-app")
      task.invoke("my-app")
    end
  end

  describe "figaro:travis" do
    context "with no .travis.yml" do
      it "creates .travis.yml" do

      it "adds encrypted vars to .travis.yml env"

      it "merges additional vars"
    end

    context "with no env in .travis.yml" do
      it "appends env to .travis.yml"

      it "merges additional vars"
    end

    context "with existing env in .travis.yml" do
      it "merges into existing .travis.yml env(s)"

      it "merges additional vars"
    end
  end
end
