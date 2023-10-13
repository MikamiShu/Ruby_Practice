#クラスの継承の話
#子クラス
require './classtest1.rb'
class Cat < Animal
    def cry
        p "myaoooow"
    end
end

cat1 = Cat.new "one", 5
cat1.eat("fish")