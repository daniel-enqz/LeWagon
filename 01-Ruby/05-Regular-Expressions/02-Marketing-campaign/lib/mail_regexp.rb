def valid?(email)
  email.match?(/\w*@\w*\.(com|net|org|fr|de)/)
end

def clean_database(emails)
  valid_emails = []
  emails.each { |email| valid_emails << email if valid?(email) }
  return valid_emails
end

def group_by_tld(emails)
  group_by_tld = { "de" => [], "com" => [], "fr" => [] }
  emails.each do |email|
    index_of_p = email.index(".")
    tld = email[index_of_p + 1..]
    group_by_tld[tld] << email
  end
  group_by_tld
end

def compose_mail(email)
  hash = { username: "", domain: "", tld: "" }
  index_of_ar = email.index("@")
  index_of_p = email.index(".")
  hash[:username] = email[0...index_of_ar]
  hash[:domain] = email[index_of_ar + 1...index_of_p]
  hash[:tld] = email[index_of_p + 1..]
  hash
end

LOCALES = {
  en: {
    subject: "Our website is online",
    body: "Come and visit us!",
    closing: "See you soon",
    signature: "The Team"
  },
  fr: {
    subject: "Notre site est en ligne",
    body: "Venez nous rendre visite !",
    closing: "A bientot",
    signature: "L'équipe"
  },
  de: {
    subject: "Unsere Website ist jetzt online",
    body: "Komm und besuche uns!",
    closing: "Bis bald",
    signature: "Das Team"
  }
}

def translate(keyword, language)
  return LOCALES[language][keyword]
end

def translation_process(hash, language)
  hash[:subject] = translate(:subject, language)
  hash[:body] = translate(:body, language)
  hash[:closing] = translate(:closing, language)
  hash[:signature] = translate(:signature, language)
end

def compose_translated_email(email)
  hash = compose_mail(email)
  translation_process(hash, :fr) if hash[:tld] == "fr"
  translation_process(hash, :de) if hash[:tld] == "de"
  translation_process(hash, :en) if hash[:tld] == "com"
  hash
end

compose_translated_email("julien@lewagon.fr")
