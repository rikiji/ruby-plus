# -*- coding: euc-jp -*-
# kana2rom.rb
# This script is distributed freely in the sense of GNU General Public License.
# K.Kodama 2002.06
#
# Kana2Rom::kana2rom(str) かな-->ロ−マ字 変換
# Kana2Rom::rom2kata(str) ロ−マ字-->片仮名 変換
# Kana2Rom::rom2hira(str) ロ−マ字-->平仮名 変換
# Kana2Rom::hira2kata(str) 平仮名-->片仮名 変換
# Kana2Rom::kata2hira(str) 片仮名-->平仮名 変換

module Kana2Rom;
	Kana2romH={
		"ア"=>"a", "イ"=>"i", "ウ"=>"u", "エ"=>"e","オ"=>"o",
		"あ"=>"a", "い"=>"i", "う"=>"u", "え"=>"e","お"=>"o",
		"カ"=>"ka", "キ"=>"ki", "ク"=>"ku", "ケ"=>"ke", "コ"=>"ko",
		"か"=>"ka", "き"=>"ki", "く"=>"ku", "け"=>"ke", "こ"=>"ko",
		"ガ"=>"ga", "ギ"=>"gi", "グ"=>"gu", "ゲ"=>"ge", "ゴ"=>"go",
		"が"=>"ga", "ぎ"=>"gi", "ぐ"=>"gu", "げ"=>"ge", "ご"=>"go",
		"サ"=>"sa", "シ"=>"si", "ス"=>"su", "セ"=>"se", "ソ"=>"so",
		"さ"=>"sa", "し"=>"si", "す"=>"su", "せ"=>"se", "そ"=>"so",
		"ザ"=>"za", "ジ"=>"ji", "ズ"=>"zu", "ゼ"=>"ze", "ゾ"=>"zo",
		"ざ"=>"za", "じ"=>"ji", "ず"=>"zu", "ぜ"=>"ze", "ぞ"=>"zo",
		"タ"=>"ta", "チ"=>"ti", "ツ"=>"tu", "テ"=>"te", "ト"=>"to",
		"た"=>"ta", "ち"=>"ti", "つ"=>"tu", "て"=>"te", "と"=>"to",
		"ダ"=>"da", "ヂ"=>"di", "ヅ"=>"du", "デ"=>"de", "ド"=>"do",
		"だ"=>"da", "ぢ"=>"di", "づ"=>"du", "で"=>"de", "ど"=>"do",
		"ナ"=>"na", "ニ"=>"ni", "ヌ"=>"nu", "ネ"=>"ne", "ノ"=>"no",
		"な"=>"na", "に"=>"ni", "ぬ"=>"nu", "ね"=>"ne", "の"=>"no",
		"ハ"=>"ha", "ヒ"=>"hi", "フ"=>"hu", "ヘ"=>"he", "ホ"=>"ho",
		"は"=>"ha", "ひ"=>"hi", "ふ"=>"hu", "へ"=>"he", "ほ"=>"ho",
		"バ"=>"ba", "ビ"=>"bi", "ブ"=>"bu", "ベ"=>"be", "ボ"=>"bo",
		"ば"=>"ba", "び"=>"bi", "ぶ"=>"bu", "べ"=>"be", "ぼ"=>"bo",
		"パ"=>"pa", "ピ"=>"pi", "プ"=>"pu", "ペ"=>"pe", "ポ"=>"po",
		"ぱ"=>"pa", "ぴ"=>"pi", "ぷ"=>"pu", "ぺ"=>"pe", "ぽ"=>"po",
		"マ"=>"ma", "ミ"=>"mi", "ム"=>"mu", "メ"=>"me", "モ"=>"mo",
		"ま"=>"ma", "み"=>"mi", "む"=>"mu", "め"=>"me", "も"=>"mo",
		"ヤ"=>"ya", "ユ"=>"yu", "ヨ"=>"yo",
		"や"=>"ya", "ゆ"=>"yu", "よ"=>"yo",
		"ラ"=>"ra","リ"=>"ri","ル"=>"ru","レ"=>"re","ロ"=>"ro",
		"ら"=>"ra","り"=>"ri","る"=>"ru","れ"=>"re","ろ"=>"ro",
		"ワ"=>"wa","ヰ"=>"wi", "ヱ"=>"we", "ヲ"=>"wo", "ン"=>"nn",
		"わ"=>"wa","ゐ"=>"wi", "ゑ"=>"we", "を"=>"wo", "ん"=>"nn",
		"ァ"=>"xa", "ィ"=>"xi", "ゥ"=>"xu", "ェ"=>"xe", "ォ"=>"xo",
		"ぁ"=>"xa", "ぃ"=>"xi", "ぅ"=>"xu", "ぇ"=>"xe", "ぉ"=>"xo",
		"ッ"=>"xtu", "ャ"=>"xya", "ュ"=>"xyu", "ョ"=>"xyo",
		"っ"=>"xtu", "ゃ"=>"xya", "ゅ"=>"xyu", "ょ"=>"xyo",
		"ヴ"=>"vu","ヵ"=>"xka","ヶ"=>"ga","ヮ"=>"xwa",
		"ゎ"=>"xwa",
		"ー"=>"-", "−"=>"-", "゛"=>'"', "゜"=>"'"}
	
	Rom2KataH1={
		"a"=>"ア", "i"=>"イ", "u"=>"ウ", "e"=>"エ", "o"=>"オ", "-"=>"ー"
	}

	Rom2KataH2={
		"xa"=>"ァ", "xi"=>"ィ", "xu"=>"ゥ", "xe"=>"ェ", "xo"=>"ォ",
		"ka"=>"カ", "ki"=>"キ", "ku"=>"ク", "ke"=>"ケ", "ko"=>"コ",
		"ca"=>"カ", "cu"=>"ク", "co"=>"コ",
		"ga"=>"ガ", "gi"=>"ギ", "gu"=>"グ", "ge"=>"ゲ", "go"=>"ゴ", 
		"sa"=>"サ", "si"=>"シ", "su"=>"ス", "se"=>"セ", "so"=>"ソ", 
		"za"=>"ザ", "zi"=>"ジ", "zu"=>"ズ", "ze"=>"ゼ", "zo"=>"ゾ",
		"ja"=>"ジャ", "ji"=>"ジ", "ju"=>"ジュ", "je"=>"ジェ", "jo"=>"ジョ", 
		"ta"=>"タ", "ti"=>"チ", "tu"=>"ツ", "te"=>"テ", "to"=>"ト", 
		"da"=>"ダ", "di"=>"ヂ", "du"=>"ヅ", "de"=>"デ", "do"=>"ド", 
		"na"=>"ナ", "ni"=>"ニ", "nu"=>"ヌ", "ne"=>"ネ", "no"=>"ノ", 
		"ha"=>"ハ", "hi"=>"ヒ", "hu"=>"フ", "he"=>"ヘ", "ho"=>"ホ", 
		"ba"=>"バ", "bi"=>"ビ", "bu"=>"ブ", "be"=>"ベ", "bo"=>"ボ", 
		"pa"=>"パ", "pi"=>"ピ", "pu"=>"プ", "pe"=>"ペ", "po"=>"ポ", 
		"va"=>"ヴァ", "vi"=>"ヴィ", "vu"=>"ヴ", "ve"=>"ヴェ", "vo"=>"ヴォ", 
		"fa"=>"ファ", "fi"=>"フィ", "fu"=>"フ", "fe"=>"フェ", "fo"=>"フォ", 
		"ma"=>"マ", "mi"=>"ミ", "mu"=>"ム", "me"=>"メ", "mo"=>"モ", 
		"ya"=>"ヤ", "yi"=>"イ", "yu"=>"ユ", "ye"=>"イェ", "yo"=>"ヨ", 
		"ra"=>"ラ", "ri"=>"リ", "ru"=>"ル", "re"=>"レ", "ro"=>"ロ", 
		"la"=>"ラ", "li"=>"リ", "lu"=>"ル", "le"=>"レ", "lo"=>"ロ", 
		"wa"=>"ワ", "wi"=>"ヰ", "wu"=>"ウ", "we"=>"ヱ", "wo"=>"ヲ", 
		"nn"=>"ン"
	}

	Rom2KataH3={
		"xka"=>"ヵ", "xke"=>"ヶ",
		"xwa"=>"ヮ", "xtu"=>"ッ", "xya"=>"ャ", "xyu"=>"ュ", "xyo"=>"ョ",
		"kya"=>"キャ", "kyi"=>"キィ", "kyu"=>"キュ", "kye"=>"キェ", "kyo"=>"キョ", 
		"gya"=>"ギャ", "gyi"=>"ギィ", "gyu"=>"ギュ", "gye"=>"ギェ", "gyo"=>"ギョ", 
		"sya"=>"シャ", "syi"=>"シィ", "syu"=>"シュ", "sye"=>"シェ", "syo"=>"ショ", 
		"sha"=>"シャ", "shi"=>"シ", "shu"=>"シュ", "she"=>"シェ", "sho"=>"ショ", 
		"zya"=>"ジャ", "zyi"=>"ジィ", "zyu"=>"ジュ", "zye"=>"ジェ", "zyo"=>"ジョ", 
		"jya"=>"ジャ", "jyi"=>"ジィ", "jyu"=>"ジュ", "jye"=>"ジェ", "jyo"=>"ジョ",
		"tya"=>"チャ", "tyi"=>"チィ", "tyu"=>"チュ", "tye"=>"チェ", "tyo"=>"チョ", 
		"cya"=>"チャ", "cyi"=>"チィ", "cyu"=>"チュ", "cye"=>"チェ", "cyo"=>"チョ", 
		"cha"=>"チャ", "chi"=>"チ", "chu"=>"チュ", "che"=>"チェ", "cho"=>"チョ", 
		"tha"=>"テャ", "thi"=>"ティ", "thu"=>"テュ", "the"=>"テェ", "tho"=>"テョ", 
		"dya"=>"ヂャ", "dyi"=>"ヂィ", "dyu"=>"ヂュ", "dye"=>"ヂェ", "dyo"=>"ヂョ", 
		"dha"=>"デャ", "dhi"=>"ディ", "dhu"=>"デュ", "dhe"=>"デェ", "dho"=>"デョ", 
		"nya"=>"ニャ", "nyi"=>"ニィ", "nyu"=>"ニュ", "nye"=>"ニェ", "nyo"=>"ニョ",
		"hya"=>"ヒャ", "hyi"=>"ヒィ", "hyu"=>"ヒュ", "hye"=>"ヒェ", "hyo"=>"ヒョ", 
		"bya"=>"ビャ", "byi"=>"ビィ", "byu"=>"ビュ", "bye"=>"ビェ", "byo"=>"ビョ", 
		"pya"=>"ピャ", "pyi"=>"ピィ", "pyu"=>"ピュ", "pye"=>"ピェ", "pyo"=>"ピョ", 
		"mya"=>"ミャ", "myi"=>"ミィ", "myu"=>"ミュ", "mye"=>"ミェ", "myo"=>"ミョ", 
		"rya"=>"リャ", "ryi"=>"リィ", "ryu"=>"リュ", "rye"=>"リェ", "ryo"=>"リョ",
		"lya"=>"リャ", "lyi"=>"リィ", "lyu"=>"リュ", "lye"=>"リェ", "lyo"=>"リョ"
	}

	Kata2hiraH={
		"ア"=>"あ", "イ"=>"い", "ウ"=>"う", "エ"=>"え", "オ"=>"お",
		"カ"=>"か", "キ"=>"き", "ク"=>"く", "ケ"=>"け", "コ"=>"こ",
		"ガ"=>"が", "ギ"=>"ぎ", "グ"=>"ぐ", "ゲ"=>"げ", "ゴ"=>"ご",
		"サ"=>"さ", "シ"=>"し", "ス"=>"す", "セ"=>"せ", "ソ"=>"そ",
		"ザ"=>"ざ", "ジ"=>"じ", "ズ"=>"ず", "ゼ"=>"ぜ", "ゾ"=>"ぞ",
		"タ"=>"た", "チ"=>"ち", "ツ"=>"つ", "テ"=>"て", "ト"=>"と",
		"ダ"=>"だ", "ヂ"=>"ぢ", "ヅ"=>"づ", "デ"=>"で", "ド"=>"ど",
		"ナ"=>"な", "ニ"=>"に", "ヌ"=>"ぬ", "ネ"=>"ね", "ノ"=>"の",
		"ハ"=>"は", "ヒ"=>"ひ", "フ"=>"ふ", "ヘ"=>"へ", "ホ"=>"ほ",
		"バ"=>"ば", "ビ"=>"び", "ブ"=>"ぶ", "ベ"=>"べ", "ボ"=>"ぼ",
		"パ"=>"ぱ", "ピ"=>"ぴ", "プ"=>"ぷ", "ペ"=>"ぺ", "ポ"=>"ぽ",
		"マ"=>"ま", "ミ"=>"み", "ム"=>"む", "メ"=>"め", "モ"=>"も",
		"ヤ"=>"や", "ユ"=>"ゆ", "ヨ"=>"よ",
		"ラ"=>"ら", "リ"=>"り", "ル"=>"る", "レ"=>"れ", "ロ"=>"ろ",
		"ワ"=>"わ", "ヰ"=>"ゐ", "ヱ"=>"ゑ", "ヲ"=>"を", "ン"=>"ん",
		"ァ"=>"ぁ", "ィ"=>"ぃ", "ゥ"=>"ぅ", "ェ"=>"ぇ", "ォ"=>"ぉ",
		"ッ"=>"っ", "ャ"=>"ゃ", "ュ"=>"ゅ", "ョ"=>"ょ",
		"ヴ"=>"う゛", "ヵ"=>"か", "ヶ"=>"が", "ヮ"=>"ゎ"
	}
	Hira2kataH={}; Kata2hiraH.each_pair{|k,v| Hira2kataH[v]=k}; Hira2kataH["か"]="カ"; Hira2kataH["が"]="ガ"

	def kana2rom(str)
		s="";str.split(//e).each{|c|if(Kana2romH.key?(c))then s+=Kana2romH[c];else s+=c;end}
		s=s.gsub(/(k)([aiueo])(")/,'g\2').gsub(/(s)([aiueo])(")/,'z\2').gsub(/(t)([aiueo])(")/,'d\2')
		s=s.gsub(/(h)([aiueo])(")/,'b\2').gsub(/(h)([aiueo])(')/,'p\2').gsub(/u"/,'vu') # [半]濁点゛゜
		sw=s;
		while nil!=sw.gsub!(/(xtu)([kgszjtdhbpmyrwv])/,'\2\2') do; s=sw; end # ッカ-->xtuka-->kka
		# きゃきぃきゅきぇきょ
		s=s.gsub(/([kgszjtdnhbpmr])(ixy)([auo])/,'\1y\3') #キャ-->kixya-->kya 
		s=s.gsub(/([kgszjtdnhbpmr])(ix)([ie])/,'\1y\3') #キィ-->kixi-->kyi 
		# テャティテュテェテョ, デャディデュデェデョ
		s=s.gsub(/([td])(exy)([auo])/,'\1h\3') #テャ texya-->tha
		s=s.gsub(/([td])(ex)([ie])/,'\1h\3') # ティ texi-->thi
		# かー --> ka- --> kaa. オ− --> oh/oo
		s=s.gsub(/(vux)([aieo])/ ,'v\2')#ヴァヴィヴェヴォ, ヴァ-->vuxa-->va	
		s=s.gsub(/(hux)([aieo])/ ,'f\2')#ファフィフェフォ, ファ-->huxa-->fa
		s=s.gsub(/(nn)([kgszjtdhfbpmrwv])/,'n\2').sub(/nn$/,'n')# ン-->nn-->子音の前ではn
		return s;
	end;
	
	def rom2kata(str)
		r=""; w=[]; chars=str.split(//e)
		loop{
			case w.size;
			when 0 then
				if chars.size>0 then w.push(chars.shift) else return r; end
			when 1 then
				if w[0]=~/[aiueo-]/ then r+=Rom2KataH1[w[0]]; w=[] # a-->ア
				elsif w[0]=~/[xkcgszjtdnhbpvfmyrlw]/ then
					if chars.size>0 then w.push(chars.shift)
					else return r+(w[0].gsub(/n/,"ン")); 
					end
				else r+=w.shift;
				end;
			when 2 then 
				if Rom2KataH2.key?(w.join) then r+=Rom2KataH2[w.join]; w=[];
				elsif w.join=~/([kgszjtcdnhbpmrl]y)|([stcd]h)|(x[wytk])/ then # goto 3
					if chars.size>0 then w.push(chars.shift) 
					else return r+(w.join.gsub(/n/,"ン"));
					end
				elsif w[0]=="n" then r+="ン"; w.shift # nk-->ンk
				elsif w[0]==w[1] then r+="ッ"; w.shift # kk-->ッk
				else r+=w.shift;
				end;
			when 3 then
				if Rom2KataH3.key?(w.join) then r+=Rom2KataH3[w.join]; w=[];
				elsif w[0]=="n" then r+="ン"; w.shift;
				else r+=w.shift;
				end;
			end;
		}
	end;

	def rom2hira(sta)
		return kata2hira(rom2kata(str))
	end;
	def kata2hira(str)
		s=""; str.split(//e).each{|c|if(Kata2hiraH.key?(c))then s+=Kata2hiraH[c];else s+=c; end}
		return s;
	end;
	def hira2kata(str)
		s=""; str.split(//e).each{|c|if(Hira2kataH.key?(c))then s+=Hira2kataH[c];else s+=c; end}
		return s;
	end;

	module_function :kana2rom, :rom2kata, :kata2hira, :hira2kata; 
end;

if $0 == __FILE__ then
	# sample
	str="ケッツァチャッカきゃっかちゃちぃてゃてぃは゛ふ゜っっきゃっヴァンンファン"
	printf("%s \n--> %s\n",  str,Kana2Rom::kana2rom(str))
	printf("%s \n--> %s\n",  str,Kana2Rom::kata2hira(str))
	printf("%s \n--> %s\n",  str,Kana2Rom::hira2kata(str))
	str="akakkannnkakyakhashanyanxnyn"
	printf("%s \n--> %s\n",  str,Kana2Rom::rom2kata(str))
end
