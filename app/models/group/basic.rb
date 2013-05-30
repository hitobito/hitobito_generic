class Group::Basic < Group

  class Leader < Role::Leader
    self.permissions = [:group_full, :contact_data]
  end

  class Member < Role::Member
    self.permissions = [:group_read]
  end

  roles Leader, Member
end