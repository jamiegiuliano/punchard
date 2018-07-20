# frozen_string_literal: true

demo = User.create(email: 'test@gmail.com', password: 'testing')
# Nook Coffee
neat = demo.merchants.build(name: 'Neat Coffee', location: 'Costa Mesa, CA', star_count: 48, image: 'https://d1g145x70srn7h.cloudfront.net/files/401c9ce9ba3497f65476de4625f88b2c9311514a/original.jpeg')
neat_url = neat.links.build(url: 'https://squareup.com/loyalty/profile/ZLRHFMX2D2/overview')
neat_url.build_category(name: 'Loyalty Profile')
# Demitasse
demitasse = demo.merchants.build(name: 'Demitasse', location: 'Santa Monica, CA', star_count: 1, image: 'https://d1g145x70srn7h.cloudfront.net/files/e7df0fc1b939091c61feaeb1beececc37eb095eb/original.jpeg')
demitasse_url = demitasse.links.build(url: 'https://squareup.com/loyalty/profile/JQDU776L8M/overview')
demitasse_url.build_category(name: 'Loyalty Profile')
# Reborn Coffee
reborn = demo.merchants.build(name: 'Reborn', location: 'Brea, CA', star_count: 9, image: 'https://square-postoffice-production.s3.amazonaws.com/images/NVDHQSSTW00gMHZBKyaXFIj0cTaG6lVH.jpg')
reborn_url = reborn.links.build(url: 'https://squareup.com/loyalty-status/4B2YLFT71O')
reborn_url.build_category(name: 'Loyalty Profile')
# Vibe Kitchen
vibe = demo.merchants.build(name: 'Vibe', location: 'Costa Mesa, CA', star_count: 33, image: 'https://d1g145x70srn7h.cloudfront.net/files/a0b400cf027e5c561a4c67a8c2b7b36eae81adea/original.jpeg')
vibe_loyalty = vibe.links.build(url: 'https://squareup.com/r/r1M9TXP93DMAHAT?sms=1')
vibe_loyalty.build_category(name: 'Loyalty Profile')

vibe_receipt = vibe.links.build(url: 'https://squareup.com/r/r1M9TXP93DMAHAT?sms=1')
vibe_receipt.build_category(name: 'Receipt')

demo.save
