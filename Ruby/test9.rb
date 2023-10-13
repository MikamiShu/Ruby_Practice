#関数の定義方法の話．

def test(a,d: "default") #デフォルト値を決めておける
    p "#{a}aaaa"
    p d
end
test("test1")
test("test2", d: "unko")
test("test3", d: "chimpo")

#可変長引数
def price(*i)
    p i #配列
end
price(1,2,3)

#ハッシュ引数
def price1(**i)
    p i#ハッシュ
end
price1(item1: 1, item2: 2)