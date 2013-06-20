require 'spec_helper'

describe Toppings::Generators::Install::GroupGenerator do

  describe "sporting multiple stylesheet files" do
    within_source_root do |tempdir|
      tempdir = Pathname(tempdir)

      FileUtils.mkdir_p tempdir.join(stylesheets_path)
      FileUtils.touch tempdir.join(stylesheets_path).join("toppings.css.sass")
    end

    context "a group file" do
      it "should be generated" do
        subject.should generate(stylesheets_path.join("group/_base.css.sass"))
      end

      it "should be appended to the base file" do
        subject.should generate(stylesheets_path.join('toppings.css.sass')) { |content|
          content.should =~ /\@import \"group\/base\"/
        }
      end
    end

    context "a group generator with templates" do
      subject {
        # creating a new class on each test here, to avoid side effects
        Class.new(Toppings::Generators::Install::GroupGenerator)
      }

      describe "with no template assigned, templates" do
        it { subject.templates.should be_empty }
      end

      describe "with a template assigned, templates" do
        before do
          subject.with_templates "file1"
        end

        it { subject.templates.should include('file1') }
      end

      describe "with multiple templates assigned, templates" do
        before do
          subject.with_templates "file1", "file2"
        end

        it { subject.templates.should include('file1', 'file2') }
      end

      describe "with a template assigned multiple times, templates" do
        before do
          subject.with_templates "file1", "file1"
        end

        it { subject.templates.select() { |template| template == 'file1' }.size.should eq(1) }
      end

    end
  end

end
