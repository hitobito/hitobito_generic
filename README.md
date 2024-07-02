# Hitobito Generic


This hitobito wagon defines a basic generic organization hierarchy.


## Organization Hierarchy

* Hauptebene
  * Hauptebene
    * Administrator*in: [:admin, :layer_and_below_full, :impersonation]
  * Vorstand
    * Präsident*in: [:layer_full, :contact_data]
    * Vizepräsident*in: [:layer_full, :contact_data]
    * Sekretär*in: [:layer_full, :contact_data]
    * Kassier*in: [:layer_read, :contact_data, :finance]
    * Vorstandsmitglied: [:layer_full, :contact_data]
  * Geschäftsstelle
    * Leitung: [:layer_and_below_full, :admin, :contact_data, :approve_applications, :finance]
    * Kassier*in: [:layer_and_below_full, :contact_data, :finance]
    * Mitglied: [:layer_and_below_full, :contact_data, :approve_applications]
  * Gremium/Projektgruppe
    * Leitung: [:group_and_below_full, :contact_data]
    * Mitglied: [:group_and_below_read, :contact_data]
  * Mitglieder
    * Adressverwaltung: [:group_and_below_full]
    * Aktivmitglied: []
    * Passivmitglied: []
  * Kontakte
    * Adressverwaltung: [:group_and_below_full]
    * Kontakt: []
  * Region/Kanton
    * Region/Kanton
      * Administrator*in: [:layer_and_below_full, :contact_data, :finance]
    * Vorstand
      * Präsident*in: [:layer_full, :contact_data]
      * Vizepräsident*in: [:layer_full, :contact_data]
      * Sekretär*in: [:layer_full, :contact_data]
      * Kassier*in: [:layer_read, :contact_data, :finance]
      * Vorstandsmitglied: [:layer_full, :contact_data]
    * Geschäftsstelle
      * Leitung: [:layer_and_below_full, :admin, :contact_data, :approve_applications, :finance]
      * Kassier*in: [:layer_and_below_full, :contact_data, :finance]
      * Mitglied: [:layer_and_below_full, :contact_data, :approve_applications]
    * Gremium/Projektgruppe
      * Leitung: [:group_and_below_full, :contact_data]
      * Mitglied: [:group_and_below_read, :contact_data]
    * Mitglieder
      * Adressverwaltung: [:group_and_below_full]
      * Aktivmitglied: []
      * Passivmitglied: []
    * Kontakte
      * Adressverwaltung: [:group_and_below_full]
      * Kontakt: []
  * Lokalgruppe/Sektion
    * Lokalgruppe/Sektion
      * Hauptleitung: [:layer_and_below_full]
      * Adressverwaltung: [:group_and_below_full, :impersonation]
      * Leitung: [:group_and_below_full, :contact_data]
      * Aktivmitglied: [:group_and_below_read]
    * Vorstand
      * Präsident*in: [:layer_full, :contact_data]
      * Vizepräsident*in: [:layer_full, :contact_data]
      * Sekretär*in: [:layer_full, :contact_data]
      * Kassier*in: [:layer_read, :contact_data, :finance]
      * Vorstandsmitglied: [:layer_full, :contact_data]
    * Geschäftsstelle
      * Leitung: [:layer_and_below_full, :admin, :contact_data, :approve_applications, :finance]
      * Kassier*in: [:layer_and_below_full, :contact_data, :finance]
      * Mitglied: [:layer_and_below_full, :contact_data, :approve_applications]
    * Gremium/Projektgruppe
      * Leitung: [:group_and_below_full, :contact_data]
      * Mitglied: [:group_and_below_read, :contact_data]
    * Mitglieder
      * Leitung: [:group_and_below_full, :contact_data]
      * Adressverwaltung: [:group_and_below_full]
      * Aktivmitglied: [:group_and_below_read]
      * Passivmitglied: []
    * Kontakte
      * Adressverwaltung: [:group_and_below_full]
      * Kontakt: []

(Output of rake hitobito:permissions)
