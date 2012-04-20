require 'spec_helper'

describe ApplicationHelper do
  describe "#display_time" do
    it "prints formatted time" do
      helper.display_time(Time.new).should be_kind_of(String)
    end

    it "returns nil if time is nil" do
      helper.display_time(nil).should be_nil
    end
  end

  describe "#display_date" do
    it "prints date" do
      helper.display_date(Time.new).should be_kind_of(String)
    end
  end

  describe "#format_start_end_date" do
    it "formats start and end dates based on month and year" do
      helper.format_start_end_date(
        Time.new, Time.new
      ).should match(/-/)
      helper.format_start_end_date(
        Time.new, Time.new.advance(:months => 1)
      ).should match(/-/)
      helper.format_start_end_date(
        Time.new, Time.new.advance(:years => 1)
      ).should match(/-/)
    end
  end

  describe "#kaminari_sort_by" do

    it "raises ArgumentError with invalid arguments" do
      lambda {
        helper.kaminari_sort_by(:pages_path)
      }.should raise_error(ArgumentError)
    end

    it "returns a link without an arrow image with valid arguments" do
      params = {
        :page => 1
      }
      helper.stub!(:params).and_return { params }
      helper.kaminari_sort_by(:pages_path, "Sort Me").should eq(
        %Q(<a href="/pages?dir=asc&amp;page=1&amp;sort=sort_me">Sort Me</a>)
      )
    end

    it "returns a link with an arrow image with valid arguments DESC" do
      params = {
        :dir  => "desc",
        :sort => "sort_me",
        :page => 1
      }
      helper.stub!(:params).and_return { params }
      helper.kaminari_sort_by(:pages_path, "Sort Me").should include(
        %Q(/pages?dir=asc&amp;page=1&amp;sort=sort_me">Sort Me)
      )
    end

    it "returns a link with an arrow image with valid arguments ASC" do
      params = {
        :dir  => "asc",
        :sort => "sort_me",
        :page => 2
      }
      helper.stub!(:params).and_return { params }
      helper.kaminari_sort_by(:pages_path, "Sort Me").should include(
        %Q(/pages?dir=desc&amp;page=2&amp;sort=sort_me">Sort Me)
      )
    end

  end
end
