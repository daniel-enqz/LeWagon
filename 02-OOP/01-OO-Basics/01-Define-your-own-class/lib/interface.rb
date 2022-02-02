require_relative "laptop"

apple = Laptop.new("MacBook Pro14´´", "M1 PRO", "16GB", "512GB")
huawei = Laptop.new("Huawei MateBook 16", "Ryzen7", "16GB", "512GB")

p apple.model
p huawei.model
