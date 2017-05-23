---
permalink: /developers/guides/data
title: The Data API
---

# Overview

The data API is a grouped key-value store for arbirary chunks of JSON
data. Groups provide namespacing for related pieces of data, say, a
list of inventory. You can query for all values in a group or retrieve
directly by group and key.


# Example App

Github `https://github.com/ScalaInc/exp-sales-associate-ipad`

## Content

The content is host on EXP system under folder Retail App, there is two folders men and women, inside every folder there is two folders categories(basic,business,party,trend) and dashboard (first screen). For each category there is two large image that is show on the left also there is other folder call product_options inside this folder are all the images for the different products.

## Model

All the information display in the reatail Exp app is comming from EXP, there is a JSON file model that describe how the app is going to behave. You can find this model using swagger `https://api-develop.goexp.io/public/docs/` go to Data API and click on get `api/data/{group}` use `exp_retail` for group and `exp_retail_model` for key.

```json
{
        "beacon_uuid": "EBEFD083-70A2-47C8-9837-E7B5634DF528",
        "logo_app": "a3454504-2064-417b-9558-ed8665f34c23",
        "start_screen": "438421a2-9568-4f09-9877-322813fa8be9",
        "fling_icon": "be6bb014-9cd6-4fae-bbe1-f5129db39245",
        "menu_options": [
          {
            "name": "WOMEN",
            "dashboard_images": "438421a2-9568-4f09-9877-322813fa8be9",
            "categories": [
              {
                "name": "Basic",
                "product_options": "abf651e6-44ca-4e71-a074-23245f44f6d9",
                "products": [
                  {
                    "zone_key": "32e838b7-82df-4835-8d4f-9e33aa54cb6f",
                    "fling_content": "d199eee8-e971-4fa5-ae61-2355ba2f9f3a",
                    "price": "200,99",
                    "name": "Beaded Top",
                    "image_detail": "be659d06-291a-4062-9a94-9404d6c6a03c",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "With lavish, shiny silver decorative beads on the round front neckline front in silky jersey with a narrow crêpe trim at the hem back section in a crêpe fabric high-low style with small slits at the side seams loose drape fine texture \nFit:\nloosely figure-skimming, slightly flared cut"
                  },
                  {
                    "price": "60,99",
                    "name": "Figure-shaping Stretch Trousers",
                    "image_detail": "be659d06-291a-4062-9a94-9404d6c6a03c",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "design featuring studded pocket edges, statement zip on the coin pocket, waistband plus belt loops, metal button and front zip fly, shiny metal elements, tone-in-tone stitching stretchy and therefore very comfortable."
                  },
                  {
                    "price": "30,99",
                    "name": "Casual Clutch",
                    "image_detail": "be659d06-291a-4062-9a94-9404d6c6a03c",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "for women, in imitation fur at the front and imitation leather at the back (approx. 31 x 22 x 1.5 cm) Details:                                                            flat clutch format, an elegant accessory – absolutely perfect for after-work parties or your next dinner date, front in faux fur, back in imitation leather with a subtle grain, main compartment opens with a metal zip and a zip pull"
                  },
                  {
                    "price": "20,99",
                    "name": "Washed top",
                    "image_detail": "182aa7bf-1244-428d-a074-b50b1fdb051c",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "with lavish, shiny silver decorative beads on the round front neckline front in silky jersey with a narrow crêpe trim at the hem back section in a crêpe fabric high-low style with small slits at the side seams loose drape fine texture"
                  },
                  {
                    "price": "55,99",
                    "name": "Stretch Fine-knit Washed Jeans",
                    "image_detail": "182aa7bf-1244-428d-a074-b50b1fdb051c",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "waistband with belt loops and edc brand label at the back fastens with a shiny metal logo button plus a zip-fly classic five-pocket design with decorative studs and stitching clean garment wash metallic shimmering coating"
                  },
                  {
                    "zone_key": "32e838b7-82df-4835-8d4f-9e33aa54cb6f",
                    "price": "75,99",
                    "name": "Soft Street Style Sneakers",
                    "image_detail": "182aa7bf-1244-428d-a074-b50b1fdb051c",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "tone-in-tone high lacing opening and tongue in a mottled fabric with soft padding decorative stitching and a flag label zip on the inner side trainer sole featuring an all-round contrasting trim"
                  }
                ]
              },
              {
                "name": "Business",
                "product_options": "90976eb6-598c-4339-8f66-cd3adc6fa5c4",
                "products": [
                  {
                    "price": "20,99",
                    "name": "Plain Top",
                    "image_detail": "b30396d4-f8ce-4b81-a898-b8377c0515ce",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "bound armholes and rounde neckline buttoned slit at the nape for easy dressing gold tone accent button at the nape mock layer tiered hem matt-shimmering finish silky light drape slinky texture"
                  },
                  {
                    "price": "44,99",
                    "name": "Grey Suit Pants",
                    "image_detail": "b30396d4-f8ce-4b81-a898-b8377c0515ce",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "off-set waistband with belt loops, a concealed hook and zip fly side slit pockets at the front, welt pocket trims at the back pressed pleats velvety soft texture loose drape shape-retaining percentage of polyamide slightly stretchy for exceptional comfort"
                  },
                  {
                    "price": "18,99",
                    "name": "Casual Leather Belt",
                    "image_detail": "b30396d4-f8ce-4b81-a898-b8377c0515ce",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "regular design with an all-over animal skin texture embossed logo next to the rectangular metal pin buckle no belt loop five buckle holes square belt tip"
                  },
                  {
                    "price": "46,99",
                    "name": "Female suit top ",
                    "image_detail": "f4e03348-8b4a-475b-91f6-c76095f2b9fd",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "two-button fastening, pointed collar accentuated by topstitching on the edge, soft shoulder pads, flap pockets, three-button sleeve cuffs, back vent at the hem horn-look buttons"
                  },
                  {
                    "price": "56,99",
                    "name": "Female Suit Pantalon ",
                    "image_detail": "f4e03348-8b4a-475b-91f6-c76095f2b9fd",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "wide raised waistband with belt loops, two buttons and zip-fly welt pocket trims on the front and back pressed pleats"
                  },
                  {
                    "price": "56,99",
                    "name": "Female Suit Skirt",
                    "image_detail": "f4e03348-8b4a-475b-91f6-c76095f2b9fd",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "attached waistband with a zip at the back fine topstitching emphasises the waistband and outlines the side pockets hem slit at the back"
                  }
                ]
              },
              {
                "name": "Trend",
                "product_options": "019c794e-c895-4e9b-ad72-ddbc171ff94f",
                "products": [
                  {
                    "price": "79,99",
                    "name": "Leather Biker Jacket",
                    "image_detail": "5114d950-19aa-4ae9-b14b-3d25adfc3b3e",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "1 out of 3 star temperature rating: intended for milder winter temperatures narrow button-up band collar asymmetrical front zip two slanted zip pockets sleeve cuffs with zips approx. 12 cm in length all zips are made from metal with edc logo pulls elegant, shimmering lining"
                  },
                  {
                    "price": "53,99",
                    "name": "Flower Pattern Stretch Pants",
                    "image_detail": "5114d950-19aa-4ae9-b14b-3d25adfc3b3e",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "waistband with belt loops and an edc leather brand label metal button and zip fly classic five pocket design with studded corners on the front and e-embroidery on the back all-over print with a rose pattern"
                  },
                  {
                    "price": "37,99",
                    "name": "Biker Style low-top boots",
                    "image_detail": "5114d950-19aa-4ae9-b14b-3d25adfc3b3e",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "simple front plus a raised decorative seam shaft with a practical zip on the outer side and a stretchy insert running all the way around the back of the heel outsole with a tread as well as a mock platform and a solid block heel"
                  },
                  {
                    "price": "68,99",
                    "name": "Rosé Leather Jacket",
                    "image_detail": "59f5bc8b-c7d8-44ee-bc14-516f4310558f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "approx. 10 cm high stand-up collar + two straps for fastening press stud-fastening epaulettes asymmetric metal zip at the front two vertical zip pockets at waist height sporty biker-style seams at elbow height cuffs with zips and decorative ties, approx. 15 cm long waistband width approx. 7 cm decorative button-down flap to the side of the front"
                  },
                  {
                    "price": "56,99",
                    "name": "Female Lumber-Jack Shirt",
                    "image_detail": "59f5bc8b-c7d8-44ee-bc14-516f4310558f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "long, adjustable sleeves with single button cuffs: can be rolled up and held in place with the button-down strap interwoven all-over check pattern classic shirt collar placket with mother-of-pearl buttons two large patch breast pockets"
                  },
                  {
                    "price": "56,99",
                    "name": "Modern Stretch Jeans",
                    "image_detail": "59f5bc8b-c7d8-44ee-bc14-516f4310558f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "denim with worn areas, some scuffed edges, authentic pre-worn creases and fading waistband plus belt loops and a visible button-fly edc brand label at the back of the waistband five-pockets with decorative stitching and studs darts run diagonally across the thighs"
                  }
                ]
              },
              {
                "name": "Party",
                "product_options": "4fee0a4c-9b96-4e80-871b-6d28fed1db9c",
                "products": [
                  {
                    "price": "79,99",
                    "name": "Black beaded dress",
                    "image_detail": "659537c1-55d6-4ebc-92fd-b054a914e2e5",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "1 out of 3 star temperature rating: intended for milder winter temperatures narrow button-up band collar asymmetrical front zip two slanted zip pockets sleeve cuffs with zips approx. 12 cm in length all zips are made from metal with edc logo pulls elegant, shimmering lining"
                  },
                  {
                    "price": "53,99",
                    "name": "Flower Pattern Stretch Pants",
                    "image_detail": "659537c1-55d6-4ebc-92fd-b054a914e2e5",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "waistband with belt loops and an edc leather brand label metal button and zip fly classic five pocket design with studded corners on the front and e-embroidery on the back all-over print with a rose pattern"
                  },
                  {
                    "price": "37,99",
                    "name": "Biker Style low-top boots",
                    "image_detail": "659537c1-55d6-4ebc-92fd-b054a914e2e5",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "simple front plus a raised decorative seam shaft with a practical zip on the outer side and a stretchy insert running all the way around the back of the heel outsole with a tread as well as a mock platform and a solid block heel"
                  },
                  {
                    "price": "68,99",
                    "name": "Rosé Leather Jacket",
                    "image_detail": "2274693a-ab6c-4562-9703-fe8968a36ee3",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "approx. 10 cm high stand-up collar + two straps for fastening press stud-fastening epaulettes asymmetric metal zip at the front two vertical zip pockets at waist height sporty biker-style seams at elbow height cuffs with zips and decorative ties, approx. 15 cm long waistband width approx. 7 cm decorative button-down flap to the side of the front"
                  },
                  {
                    "price": "56,99",
                    "name": "Female Lumber-Jack Shirt",
                    "image_detail": "59f5bc8b-c7d8-44ee-bc14-516f4310558f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "long, adjustable sleeves with single button cuffs: can be rolled up and held in place with the button-down strap interwoven all-over check pattern classic shirt collar placket with mother-of-pearl buttons two large patch breast pockets"
                  },
                  {
                    "price": "56,99",
                    "name": "Modern Stretch Jeans",
                    "image_detail": "59f5bc8b-c7d8-44ee-bc14-516f4310558f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "denim with worn areas, some scuffed edges, authentic pre-worn creases and fading waistband plus belt loops and a visible button-fly edc brand label at the back of the waistband five-pockets with decorative stitching and studs darts run diagonally across the thighs"
                  }
                ]
              }
            ]
          },
          {
            "name": "MEN",
            "dashboard_images": "5a75fc89-def7-4105-b0af-7bde2f5f4e08",
            "categories": [
              {
                "name": "Basic",
                "product_options": "9915f8c1-6ea2-45bb-a673-239e264bd108",
                "products": [
                  {
                    "price": "24,99",
                    "name": "Modern Henley",
                    "image_detail": "a3ba0723-49f3-4365-98e2-81c64b79a744",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "Details:three-button placket short side slits, small flag label on the left Size information: centre back length approx. 72 cm, sleeve length approx. 70 cm in size L, may vary slightly according to size Material and care: slim rib with a striking texture and a mottled effect, soft feel in denser rib: trim around the round neckline and sleeve cuffs standard weight fabric stretchy opaque"
                  },
                  {
                    "price": "60,99",
                    "name": "Basic blue jeans",
                    "image_detail": "a3ba0723-49f3-4365-98e2-81c64b79a744",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "waistband with belt loops (for belts up to 5 cm wide) and brand logo on the faux leather label button-fly with metal logo buttons classic 5 pockets with small logo studs on the front and icon embroidery on the back pockets contrasting stitching."
                  },
                  {
                    "price": "30,99",
                    "name": "Light street-style sneakers",
                    "image_detail": "a3ba0723-49f3-4365-98e2-81c64b79a744",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "simple tone-in-tone lacing trimmed with suede reinforced opening and heel trim classic outsole with a tread and all-round trim"
                  },
                  {
                    "price": "20,99",
                    "name": "Modern basic polo",
                    "image_detail": "32c71b41-175f-4190-bf66-b5f0b9b462bc",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "turn-down collar in soft piqué with a three-button placket second shirt collar in chambray with a three-button placket round appliqué and California embroidery on the chest short side slits                                                  "
                  },
                  {
                    "price": "55,99",
                    "name": "Basic light-brown pantalon",
                    "image_detail": "32c71b41-175f-4190-bf66-b5f0b9b462bc",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "waistband with loops for belts up to approx. 5 cm wide, single loop displaying the stitched ESPRIT brand logo zip-fly and button fastening typical chino pockets: - slit pockets plus small welt pocket on the front, button-down piped pockets at the back tone-in-tone stitching delivered tightly rolled up"
                  },
                  {
                    "price": "75,99",
                    "name": "Modern-look watch",
                    "image_detail": "32c71b41-175f-4190-bf66-b5f0b9b462bc",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "dial in dark olive green with clear, contrasting markings and an edc logo second, minute and hour hands precise, silent quartz movement water-resistant to 3 bar: splash protected (against rain, hand washing etc.), can be worn for activities where water splashing may occur, do not expose to water pressure buckle fastener with an embossed edc and two loops cardboard storage box 24 month manufacturer guarantee (please refer to the included information)"
                  }
                ]
              },
              {
                "name": "Business",
                "product_options": "0ff94e41-cf4d-4724-bff1-8d76e29e72e8",
                "products": [
                  {
                    "price": "24,99",
                    "name": "Premium blazer",
                    "image_detail": "f7fffcce-b0b7-4e5a-83c6-8180314f4538",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "soft shoulder padding timeless lapel welt pocket and flap pockets on the front, two pockets and one narrow compartment inside two-button fastening, four-button sleeve vents two back vents AMF stitching on the edges"
                  },
                  {
                    "price": "60,99",
                    "name": "Premium suit trousers",
                    "image_detail": "f7fffcce-b0b7-4e5a-83c6-8180314f4538",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "classic waistband with loops (belt not included) with a zip-fly and button fastening front slit pockets, AMF stitching on the openings button-fastening piped pockets at the back front of the legs lined exquisite finishing."
                  },
                  {
                    "price": "30,99",
                    "name": "High-cut suede shoes",
                    "image_detail": "f7fffcce-b0b7-4e5a-83c6-8180314f4538",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "Details: two-hole lacing with round laces discreet, decorative stitching solid crepe sole with a flat heel Fit: round toe slightly higher cut, to the ankle + basic lacing Material and care: made of wonderfully soft suede rubber sole with a crepe tread Upper: Suede | Lining: Leather | Insole: Textile | Outsole: Rubber"
                  },
                  {
                    "price": "20,99",
                    "name": "Italian merino blazer",
                    "image_detail": "8579ee4b-c9e0-4c63-bbeb-42526b050f7f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "with lavish, shiny silver decorative beads on the round front neckline front in silky jersey with a narrow crêpe trim at the hem back section in a crêpe fabric high-low style with small slits at the side seams loose drape fine texture"
                  },
                  {
                    "price": "55,99",
                    "name": "Italian merino suit trousers",
                    "image_detail": "8579ee4b-c9e0-4c63-bbeb-42526b050f7f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "suit trousers made of ultra-fine, Italian merino material with a grainy texture, pure new wool Details: pressed pleats elaborately finished waistband plus loops (belt not included) zip-fly, concealed hook clasp and button fastening front slit pockets button-down, piped back pockets front of the legs lined Size information: extremely narrow hem width/leg opening approx. 38 cm (Dublin design, can vary from size to size) Material and care: Italian new wool composed of ultra fine merino: finely grained, clear pin-point texture, flowing drape standard weight fabric not stretchy opaque"
                  },
                  {
                    "price": "75,99",
                    "name": "Business shirt",
                    "image_detail": "8579ee4b-c9e0-4c63-bbeb-42526b050f7f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "reinforced Kent collar with stays in the corners (spare stays included) double-layer shoulder yoke curved hem two-width, button-fastening cuffs"
                  }
                ]
              },
              {
                "name": "Trend",
                "product_options": "afd39b8b-35f5-4f86-ac7d-bbe137bede32",
                "products": [
                  {
                    "price": "24,99",
                    "name": "Mottled knit yarn pull-over",
                    "image_detail": "53df6642-dbfc-423a-a487-67c35454f35f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "interwoven striped pattern body, hood and sleeves knit in stocking stitch ribbed cuffs double-layer hood with a drawstring leather label on the side of the hem"
                  },
                  {
                    "price": "60,99",
                    "name": "Dark slim-fit jeans",
                    "image_detail": "53df6642-dbfc-423a-a487-67c35454f35f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "waistband plus belt loops button fly two slit pockets with logo studs and an emblem at the front, button-down piped pockets on the rear with an edc label appliqué authentic pre-worn creases."
                  },
                  {
                    "price": "30,99",
                    "name": "Biker-style boots",
                    "image_detail": "53df6642-dbfc-423a-a487-67c35454f35f",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "round toe, front with a curved double seam and a perforated pattern trims and decorative stitching also at the side and on the heel high, lace-up fastening with round shoe laces in a darker, accent shade front and heel with a subtle vintage finish"
                  },
                  {
                    "price": "20,99",
                    "name": "Modern yarn cardigan",
                    "image_detail": "ef055fd8-88f1-45b4-944d-467faf4001cc",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "V-neckline full-length button placket jacquard intarsia knit in graduated colours two slit pockets ribbed edges edc brand loop on the hem"
                  },
                  {
                    "price": "55,99",
                    "name": "Soft cotton shirt",
                    "image_detail": "ef055fd8-88f1-45b4-944d-467faf4001cc",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "round neckline edged with a narrow trim double layer cuffs small flag label on the side of the hem"
                  },
                  {
                    "price": "75,99",
                    "name": "Soft Street Style Sneakers",
                    "image_detail": "ef055fd8-88f1-45b4-944d-467faf4001cc",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "tone-in-tone high lacing opening and tongue in a mottled fabric with soft padding decorative stitching and a flag label zip on the inner side trainer sole featuring an all-round contrasting trim"
                  }
                ]
              },
              {
                "name": "Party",
                "product_options": "1c365a2b-33e5-49e8-ae3f-f0cf6d9f91c3",
                "products": [
                  {
                    "price": "24,99",
                    "name": "Modern Henley",
                    "image_detail": "352f6a12-9ae5-4695-9161-c1a42b089b33",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "Details:three-button placket short side slits, small flag label on the left Size information: centre back length approx. 72 cm, sleeve length approx. 70 cm in size L, may vary slightly according to size Material and care: slim rib with a striking texture and a mottled effect, soft feel in denser rib: trim around the round neckline and sleeve cuffs standard weight fabric stretchy opaque"
                  },
                  {
                    "price": "60,99",
                    "name": "Figure-shaping Stretch Trousers",
                    "image_detail": "352f6a12-9ae5-4695-9161-c1a42b089b33",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "design featuring studded pocket edges, statement zip on the coin pocket, waistband plus belt loops, metal button and front zip fly, shiny metal elements, tone-in-tone stitching stretchy and therefore very comfortable."
                  },
                  {
                    "price": "30,99",
                    "name": "Casual Clutch",
                    "image_detail": "352f6a12-9ae5-4695-9161-c1a42b089b33",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "for women, in imitation fur at the front and imitation leather at the back (approx. 31 x 22 x 1.5 cm) Details:                                                            flat clutch format, an elegant accessory – absolutely perfect for after-work parties or your next dinner date, front in faux fur, back in imitation leather with a subtle grain, main compartment opens with a metal zip and a zip pull"
                  },
                  {
                    "price": "20,99",
                    "name": "Washed top",
                    "image_detail": "706648f9-00a6-4f21-aaaf-d7c2ea88bdb6",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "with lavish, shiny silver decorative beads on the round front neckline front in silky jersey with a narrow crêpe trim at the hem back section in a crêpe fabric high-low style with small slits at the side seams loose drape fine texture"
                  },
                  {
                    "price": "55,99",
                    "name": "Stretch Fine-knit Washed Jeans",
                    "image_detail": "706648f9-00a6-4f21-aaaf-d7c2ea88bdb6",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "waistband with belt loops and edc brand label at the back fastens with a shiny metal logo button plus a zip-fly classic five-pocket design with decorative studs and stitching clean garment wash metallic shimmering coating"
                  },
                  {
                    "price": "75,99",
                    "name": "Soft Street Style Sneakers",
                    "image_detail": "706648f9-00a6-4f21-aaaf-d7c2ea88bdb6",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "tone-in-tone high lacing opening and tongue in a mottled fabric with soft padding decorative stitching and a flag label zip on the inner side trainer sole featuring an all-round contrasting trim"
                  }
                ]
              }
            ]
          },
          {
            "name": "DRESSING ROOM",
            "dashboard_images": "438421a2-9568-4f09-9877-322813fa8be9"
          }
        ]
      }
```


## App Logo

Inside the JSON model `"logo_app": "UUID"` UUID from EXP.

## App Menu Options

Menu options is and array of Object where each object has a name where is the name display on the top menu and dashboard_images where is the folder with the images for the first page.

```json
"menu_options": [
          {
            "name": "WOMEN",
            "dashboard_images": "438421a2-9568-4f09-9877-322813fa8be9",
```    

## App Categories

Each option(Men,Women) has categories inside(basic,trend,party,business) for each categories we have different products and each product has the description(price,name,description). The `image_detail` property is the image that it will be show if you click in that particular product. 
```json
"menu_options": [
          {
            "name": "WOMEN",
            "dashboard_images": "438421a2-9568-4f09-9877-322813fa8be9",
            "categories": [
              {
                "name": "Basic",
                "product_options": "abf651e6-44ca-4e71-a074-23245f44f6d9",
                "products": [
                  {
                    "zone_key": "32e838b7-82df-4835-8d4f-9e33aa54cb6f",
                    "fling_content": "d199eee8-e971-4fa5-ae61-2355ba2f9f3a",
                    "price": "200,99",
                    "name": "Beaded Top",
                    "image_detail": "be659d06-291a-4062-9a94-9404d6c6a03c",
                    "size_available": "6696d495-3371-4927-89b1-a9bbbf5a89ac",
                    "description": "With lavish, shiny silver decorative beads on the round front neckline front in silky jersey with a narrow crêpe trim at the hem back section in a crêpe fabric high-low style with small slits at the side seams loose drape fine texture \nFit:\nloosely figure-skimming, slightly flared cut"
                  },
```

## App Beacon Integration

  - Add the beacon into EXP system using admin-mobile-app(`https://github.com/ScalaInc/exp-mobile-admin`)
  - Add the beacon to particular location and zone.
  - App Json model you need to add the beacon uuid `"beacon_uuid": "EBEFD083-70A2-47C8-9837-E7B5634DF528"` that you want to range for.
  - Add the zone key UUID into the JSON model for the particular product that you want the beacon to change the content
  `"products": [{"zone_key": "32e838b7-82df-4835-8d4f-9e33aa54cb6f"}`
  
## App Fling Integration

Inside each product there is a property call  `"fling_content": "Content UUID"` you need to add the content UUID, if you don't add one it will fling the property `image_detail`.