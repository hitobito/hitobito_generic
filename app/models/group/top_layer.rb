class Group::TopLayer < Group

  self.layer = true
  self.event_types = [Event, Event::Course]
  self.default_children = [Group::Board]

  children Group::Layer, Group::Board


  class Administrator < Role
    self.permissions = [:admin, :layer_full]
  end

  class Leader < Role::Leader
  end

  class Member < Role::Member
  end

  roles Administrator, Leader, Member

end