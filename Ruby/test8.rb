#配列を順番に取り出す

array = [0,1,2,3,4,5,6,7,8,9]
array2 = [11,12,13,14,15,16,17,18,19,20]
array.each do |tmp|
    next if tmp == 2 #no 13
    p array2[tmp]
end

array3 = {key1: "1", key2: "2", key3: "3"}
array3.each do |key, value|
    p "#{key}は#{value}"
end


