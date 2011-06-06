#!/usr/bin/ruby
# -*- coding: utf-8 -*-

pos_t = { 
  "名詞" => :noun,
  "接頭詞" => :prefix,
  "動詞" => :verb,
  "形容詞" => :adjective,
  "副詞" => :adverb,
  "連体詞" => :adjectivalprenoun,
  "接続詞" => :conjuction,
  "助詞" => :particle,
  "助動詞" => :auxverb,
  "感動詞" => :interjection,
  "記号" => :symbol,
  "その他" => :other,
  "フィラー" => :fillword,
  "非言語音" => :nonverbalsound,
  "語断片" => :speechfragment
}

class String

  # String to Range
  def to_r
    if self.match(/\.\./)
      Range.new(*self.split("..").map{|s|s.to_i})
    else
      Range.new(*[self.to_i,self.to_i])
    end
  end

  # Kana to Romaji
  def to_romaji
    Kana2Rom::kana2rom(self.encode("EUC-JP")).encode("UTF-8")
  end

  def to_romaji!
    replace to_romaji
  end
  
  # Romaji to Kana
  def to_katakana
    if self.match(/[a-z]/i)
      Kana2Rom::rom2kata(self.encode("EUC-JP")).encode("UTF-8")
    else
      Kana2Rom::hira2kata(self.encode("EUC-JP")).encode("UTF-8")
    end
  end

  def to_katakana!
    replace to_katakana
  end

  def to_hiragana
    if self.match(/[a-z]/i)
      Kana2Rom::rom2hira(self.encode("EUC-JP")).encode("UTF-8")
    else
      Kana2Rom::kata2hira(self.encode("EUC-JP")).encode("UTF-8")
    end
  end

  def to_hiragana!
    replace to_hiragana
  end

end
