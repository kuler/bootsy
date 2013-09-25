require 'spec_helper'

describe Bootsy::ApplicationHelper do
  let(:unsaved_gallery){ FactoryGirl.build(:image_gallery) }
  let(:saved_gallery){ FactoryGirl.create(:image_gallery) }

  describe '#refresh_btn' do
    subject { helper.refresh_btn }

    it { should include('class="btn btn-default btn-xs refresh-btn"') }

    it { should include('Refresh') }

    it { should include('href="#refresh-gallery"') }
  end

  describe '#resource_or_nil' do
    context 'argument is nil' do
      subject { helper.resource_or_nil nil }

      it { should be_nil }
    end

    context 'argument is not persisted' do
      subject { helper.resource_or_nil unsaved_gallery }

      it { should be_nil }
    end

    context 'argument is persisted' do
      subject { helper.resource_or_nil saved_gallery }

      it('returns the given argument'){ should == saved_gallery }
    end
  end
end
