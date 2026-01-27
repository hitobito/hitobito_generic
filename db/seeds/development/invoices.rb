# encoding: utf-8

#  Copyright (c) 2012-2022, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

INVOICE_ARTICLE_ATTRIBUTES = [
  {
    name: 'Beitrag Erwachsene',
    number: 'BEI-18',
    description: 'Normaler Beitrag für Erwachsene',
    category: 'Beiträge',
    unit_cost: 10,
    vat_rate: 8,
    cost_center: 'BEI',
    account: 23
  },
  {
    name: 'Beitrag Kinder',
    number: 'BEI-JU',
    description: 'Ermässigter Betrag für Kinder und Jugendliche',
    category: 'Beiträge',
    unit_cost: 5,
    vat_rate: 8,
    cost_center: 'BEI',
    account: 23
  },
  {
    name: 'Abonnement der Mitgliederzeitschrift',
    number: 'ABO-NEWS',
    description: 'Monatliche Mitgliederzeitschrift',
    category: 'Publikationen',
    unit_cost: 120,
    vat_rate: 8,
    cost_center: 'PUB',
    account: 42
  }
].freeze

######################
# HELPER METHODS START
######################

def seed_invoice(group, state = :draft, item = random_invoice_item, due_at = Faker::Date.forward(days: 30), recipient = nil)
  invoice_recipient = recipient || Person.all.sample
  invoice = Invoice.new(invoice_attributes(group, state, item, invoice_recipient, due_at))

  invoice.validate # Calculate invoice attributes
  with_state_specific_attributes(invoice)
end

def seed_invoice_run(group)
  item = random_invoice_item
  due_at = Faker::Date.forward(days: 30)
  invoice = seed_invoice(group, :issued, item, due_at)

  InvoiceRun.new(invoice_run_attributes(group, invoice, item, due_at))
end

def invoice_attributes(group, state, item, recipient, due_at)
  {
    title: "Rechnung für #{item.name}",
    group: group,
    invoice_items: [item],
    recipient: recipient,
    recipient_email: recipient.email,
    issued_at: state == 'draft' ? nil : due_at - 30.days,
    due_at: due_at,
    state: state
  }
end

def invoice_run_attributes(group, invoice, item, due_at)
  recipients = rand(6..12).times.map { Person.all.sample }

  {
    title: "Rechnungslauf für #{invoice.invoice_items.first.name}",
    group: group,
    invoice: invoice,
    invoices: recipients.map { seed_invoice(group, [:issued, :payed].sample, item, due_at, _1) },
    recipient_source: InvoiceRuns::RecipientSourceBuilder.new({ids: recipients.pluck(:id)}, group).recipient_source
  }
end

def random_invoice_item
  article = InvoiceArticle.all.sample

  item = article.slice(:name, :unit_cost, :vat_rate)
  item[:count] = 1

  InvoiceItem.new(**item)
end

def with_state_specific_attributes(invoice)
  case invoice.state
  when 'payed'
    invoice.payments = [Payment.new(amount: invoice.total)]
  when 'reminded'
    invoice.issued_at = Faker::Date.between(from: 40.days.ago, to: 30.days.ago)
    invoice.payment_reminders = [random_payment_reminder(invoice)]
  when 'sent'
    invoice.sent_at = 1.day.ago
  end

  invoice
end

def random_payment_reminder(invoice)
  config = find_or_create_payment_reminder_config(invoice)
  attrs = config.slice('title', 'text', 'level').merge(due_at: Time.zone.today + config.due_days)
  PaymentReminder.new(attrs)
end


def find_or_create_payment_reminder_config(invoice)
  config = PaymentReminderConfig.find_by(level: 1)
  return config if config

  config = PaymentReminderConfig.new
  config.with_defaults(1)
  config.invoice_config = invoice.invoice_config
  config.save!
  config
end

####################
# HELPER METHODS END
####################

group = Group.find_by(name: 'Region Bern')

return unless group

group.invoice_config.update(payee: 'Hitobito AG')

# Seed predefined Articles
INVOICE_ARTICLE_ATTRIBUTES.each do |attrs|
  InvoiceArticle.seed_once(:name, :number, attrs.merge(group: group))
end

# Seed Invoices of every state
Invoice::STATES.each do |state|
  seed_invoice(group, state).save!
end

# Seed 5 random invoices
5.times do
  seed_invoice(group, Invoice::STATES.sample).save!
end

# Seed an InvoiceRun
list = seed_invoice_run(group)
list.save!
list.update_paid
list.update_total
