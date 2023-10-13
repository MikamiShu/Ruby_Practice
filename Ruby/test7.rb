#配列の話．

array = [1,2,3,4,5]
p array[10] # nill

#ハッシュの話

array2 = {"one" => "Ruby", "two" => "PHP"} #{}で定義．左側がキー，右側が名前
p array2["one"] # "Ruby"
array3 = {:key1 => "Ruby", :key2 => "PHP"} #シンボルという
p array3[:key1] #"Ruby"
array4 = {a: "Ruby", b: "PHP"}
p array4[:b]