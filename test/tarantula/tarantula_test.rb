# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

require 'test_helper'
require 'relevance/tarantula'
require 'tarantula/tarantula_config'

class TarantulaTest < ActionDispatch::IntegrationTest
  # Load enough test data to ensure that there's a link to every page in your
  # application. Doing so allows Tarantula to follow those links and crawl
  # every page.  For many applications, you can load a decent data set by
  # loading all fixtures.

  reset_fixture_path File.expand_path('../../../spec/fixtures', __FILE__)

  include TarantulaConfig

  def test_tarantula_as_administrator
    crawl_as(people(:admin))
  end

  def test_tarantula_as_board_leader
    crawl_as(people(:board_leader))
  end

  def test_tarantula_as_basic_leader
    crawl_as(people(:basic_leader))
  end

  def test_tarantula_as_member
    crawl_as(people(:basic_member))
  end

  def configure_urls_with_generic(t, person)
    configure_urls_without_generic(t, person)

    # do not update any role to avoid loosing access to them.
    t.skip_uri_patterns << /groups\/\d+\/roles\/\d+$/
  end
  alias_method_chain :configure_urls, :generic

end
