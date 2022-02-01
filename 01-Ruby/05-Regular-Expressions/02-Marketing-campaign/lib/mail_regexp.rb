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

def compose_translated_email(email)
  hash = compose_mail(email)
  hash[:tld]
  if hash[:tld] == "en"
    hash[:subject] = translate(:subject, :en)
    hash[:body] = translate(:body, :en)
    hash[:closing] = translate(:closing, :en)
    hash[:signature] = translate(:signature, :en)
  elsif hash[:tld] == "fr"
    hash[:subject] = translate(:subject, :fr)
    hash[:body] = translate(:body, :fr)
    hash[:closing] = translate(:closing, :fr)
    hash[:signature] = translate(:signature, :fr)
  elsif hash[:tld] == "de"
    hash[:subject] = translate(:subject, :de)
    hash[:body] = translate(:body, :de)
    hash[:closing] = translate(:closing, :de)
    hash[:signature] = translate(:signature, :de)
  elsif hash[:tld] == "com"
    hash[:subject] = "Our website is online"
    hash[:body] = "Come and visit us!"
    hash[:closing] = "See you soon"
    hash[:signature] = "The Team"
  end
  hash
end

p compose_translated_email("julien@lewagon.fr")
