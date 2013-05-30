quali_kinds = QualificationKind.seed(:label,
 {label: 'Leitung',
  validity: 2},

 {label: 'Experte',
  validity: 2},
)

Event::Kind.seed(:short_name,
 {label: 'Leitungskurs',
  short_name: 'LK',
  qualification_kind_ids: [quali_kinds[0].id]},

 {label: 'Expertenkurs',
  short_name: 'EK',
  qualification_kind_ids: [quali_kinds[1].id]},

 {label: 'Fortbildungskurs',
  short_name: 'FK',
  prolongation_ids: [quali_kinds[0].id]},
)
