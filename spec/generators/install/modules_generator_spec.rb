require 'spec_helper'

describe Toppings::Generators::Install::ModulesGenerator do

  within_source_root do |tempdir|
    create_stylesheets_folder(tempdir)
    create_dummy_root_file(tempdir)
  end

  context "as a group of stylesheets" do
    it "should provide a relative base file" do
      subject.should generate(stylesheets_path.join("modules/_base.sass"))
    end
  end

end