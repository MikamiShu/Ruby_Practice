#クラス，インスタンスの話
#requireで別ファイルを読み込む．''で囲んでファイルをパス指定

require './test10.rb'
cat1 = Cat.new("a", 5) #インスタンス生成
cat1.eat("fish")