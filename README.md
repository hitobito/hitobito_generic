# Hitobito Generic


This hitobito wagon defines a basic generic organization hierarchy.


## Organization Hierarchy

* Hauptebene
  * Hauptebene
    * Administrator*in: [:admin, :layer_and_below_full]
  * Vorstand
    * Präsident*in: [:layer_full, :contact_data]
    * Vizepräsident*in: [:layer_full, :contact_data]
    * Sekretär*in: [:layer_full, :contact_data]
    * Vorstandsmitglied: [:layer_full, :contact_data]
  * Geschäftsstelle
    * Leitung: [:layer_and_below_full, :admin, :contact_data, :approve_applications]
    * Mitglied: [:layer_and_below_full, :contact_data, :approve_applications]
  * Gremium/Projektgruppe
    * Leitung: [:group_and_below_full, :contact_data]
    * Mitglied: [:group_and_below_read, :contact_data]
  * Mitglieder
    * Aktivmitglied: []
    * Passivmitglied: []
  * Kontakte
    * Kontakt: []
* Region/Kanton
  * Vorstand
    * Präsident*in: [:layer_full, :contact_data]
    * Vizepräsident*in: [:layer_full, :contact_data]
    * Sekretär*in: [:layer_full, :contact_data]
    * Vorstandsmitglied: [:layer_full, :contact_data]
  * Geschäftsstelle
    * Leitung: [:layer_and_below_full, :admin, :contact_data, :approve_applications]
    * Mitglied: [:layer_and_below_full, :contact_data, :approve_applications]
  * Gremium/Projektgruppe
    * Leitung: [:group_and_below_full, :contact_data]
    * Mitglied: [:group_and_below_read, :contact_data]
  * Mitglieder
    * Aktivmitglied: []
    * Passivmitglied: []
  * Kontakte
    * Kontakt: []
* Lokalgruppe/Sektion
  * Lokalgruppe/Sektion
    * Hauptleitung: [:layer_and_below_full]
    * Adressverwaltung: [:group_and_below_full]
    * Leitung: [:group_and_below_full, :contact_data]
    * Aktivmitglied: [:group_and_below_read]
  * Vorstand
    * Präsident*in: [:layer_full, :contact_data]
    * Vizepräsident*in: [:layer_full, :contact_data]
    * Sekretär*in: [:layer_full, :contact_data]
    * Vorstandsmitglied: [:layer_full, :contact_data]
  * Geschäftsstelle
    * Leitung: [:layer_and_below_full, :admin, :contact_data, :approve_applications]
    * Mitglied: [:layer_and_below_full, :contact_data, :approve_applications]
  * Gremium/Projektgruppe
    * Leitung: [:group_and_below_full, :contact_data]
    * Mitglied: [:group_and_below_read, :contact_data]
  * Mitglieder
    * Leitung: [:group_and_below_full, :contact_data]
    * Aktivmitglied: [:group_and_below_read]
    * Passivmitglied: []
  * Kontakte
    * Kontakt: []

(Output of rake hitobito:permissions)
