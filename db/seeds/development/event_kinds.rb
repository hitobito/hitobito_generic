# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

quali_kinds = QualificationKind.seed(:id,
 {id: 1,
  validity: 2,
  reactivateable: 2},

 {id: 2,
  validity: 2},
)

QualificationKind::Translation.seed(:qualification_kind_id, :locale,
  {qualification_kind_id: quali_kinds[0].id,
   locale: 'de',
   label: 'Leitung'},

  {qualification_kind_id: quali_kinds[1].id,
   locale: 'de',
   label: 'Experte'},
)

event_kinds = Event::Kind.seed(:id,
 {id: 1},

 {id: 2},

 {id: 3},
)

Event::Kind::Translation.seed(:event_kind_id, :locale,
  {event_kind_id: event_kinds[0].id,
   locale: 'de',
   label: 'Leitungskurs',
   short_name: 'LK'},

  {event_kind_id: event_kinds[1].id,
   locale: 'de',
   label: 'Expertenkurs',
   short_name: 'EK'},

  {event_kind_id: event_kinds[2].id,
   locale: 'de',
   label: 'Fortbildungskurs',
   short_name: 'FK'}
)

Event::KindQualificationKind.seed(:id,
  {id: 1,
   event_kind_id: event_kinds[0].id,
   qualification_kind_id: quali_kinds[0].id,
   category: :qualification,
   role: :participant},

  {id: 2,
   event_kind_id: event_kinds[1].id,
   qualification_kind_id: quali_kinds[1].id,
   category: :qualification,
   role: :participant},

  {id: 3,
   event_kind_id: event_kinds[2].id,
   qualification_kind_id: quali_kinds[0].id,
   category: :prolongation,
   role: :participant},
)
