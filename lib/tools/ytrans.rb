require 'uri'
require 'net/http'
require 'net/https'
require 'json'

class YTrans
  OAUTH_TOKEN = "AgAAAAADRRzMAATuwTh3HaSDGkFrh8r1t3MPAv0";
  FOLDER_ID = "b1grl2f0omsgn1skpdd8";

  def self.get_iamToken
    uri = URI('https://iam.api.cloud.yandex.net/iam/v1/tokens')
    res = Net::HTTP.post(uri, '{"yandexPassportOauthToken":"'+OAUTH_TOKEN+'" }')
    res_json = JSON.parse(res.body)
    return res_json['iamToken']
  end

  def self.translate_text text, lang_source='en', lang_taget='ru'

    @toSend = {
      'folder_id' => FOLDER_ID,
      'targetLanguageCode' => lang_taget,
      'sourceLanguageCode' => lang_source,
      'texts' => [text]
    }.to_json

    uri = URI.parse('https://translate.api.cloud.yandex.net/translate/v2/translate')
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json'})
    req['Authorization']='Bearer '+get_iamToken

    req.body = @toSend
    res = https.request(req)
    res_json = JSON.parse(res.body)
    return res_json['translations'][0]['text']
  end

end

#puts YTrans.get_iamToken
text = 'Original values are recorded when an entity is queried from the database. Changes are detected by scanning the
 current property values and comparing them to the recorded values. This scanning takes place when
 <see cref=\"ChangeTracker.DetectChanges\" /> is called, or when another API call (such as <see cref=\"DbContext.SaveChanges()\" />)
 triggers the change detection process.'
#puts YTrans.translate_text text, 'en', 'ru'