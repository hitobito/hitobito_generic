# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

require 'spec_helper'

describe Group do

  include_examples 'group types'

  # # not necessary with this sctrucutre
  # describe '#all_types' do
  #   subject { Group.all_types }
  #
  #   it 'must have simple group as last item' do
  #     expect(subject.last).to eq(Group::Basic)
  #   end
  # end

  describe '.course_offerers' do
    subject { Group.course_offerers }

    it 'includes top layer' do
      is_expected.to include groups(:ch)
    end

    it 'includes regions' do
      is_expected.to include groups(:be)
      is_expected.to include groups(:no)
    end

    it 'does not include local groups' do
      is_expected.not_to include groups(:bern)
      is_expected.not_to include groups(:thun)
      is_expected.not_to include groups(:asterix)
      is_expected.not_to include groups(:obelix)
      is_expected.not_to include groups(:mickey)
    end

    it 'orders by parent and name' do
      expected = ['Verband', 'Nordostschweiz', 'Region Bern', 'Ausserroden', 'Innerroden']
      expect(subject.map(&:name)).to eq expected
    end
  end


end
