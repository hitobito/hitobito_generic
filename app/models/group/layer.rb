class Group::Layer < Group

  self.layer = true
  self.event_types = [Event, Event::Course]
  self.default_children = [Group::Board]

  children Group::Layer, Group::Board


  class Leader < Role::Leader
  end

  class Member < Role::Member
  end

  roles Leader, Member

end