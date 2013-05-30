class Group::Board < Group

  class Leader < Role::Leader
  end

  class Member < Role::Member
  end

  roles Leader, Member

end