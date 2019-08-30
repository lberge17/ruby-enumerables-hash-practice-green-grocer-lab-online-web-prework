def consolidate_cart(cart)
  new_cart = {}
  cart.each do |cart_hash|
    item = cart_hash.keys[0]
    stats = cart_hash.values[0]
    if new_cart.has_key?(item)
      stats[:count] += 1
    else
      new_cart[item] = stats
      stats[:count] = 1
    end
  end
  return new_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
    if cart[item] && cart[item][:count] >= coupon[:num] && !cart["#{item} W/COUPON"]
      cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance], count: coupon[:num]}
      cart[item][:count] -= coupon[:num]
    elsif cart[item][:count] >= coupon[:num] && cart["#{item} W/COUPON"]
      cart["#{item} W/COUPON"] += coupon[:num]
      cart[item][:count] -= coupon[:num]
    else
    end
  end
  cart
end

def apply_clearance(cart)
  
end

def checkout(cart, coupons)
  
end
