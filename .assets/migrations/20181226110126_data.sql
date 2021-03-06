-- +goose Up
-- SQL in this section is executed when the migration is applied.
INSERT INTO users (id) VALUES (1);

INSERT INTO products (id, min_quantity, tags) VALUES
-- 
('pineapple',1000,'["fruits"]'),
('apple',150,'["fruits"]'),
('apricot',25,'["fruits"]'),
('banana',120,'["fruits"]'),
('melon',1000,'["fruits"]'),
('kiwi',80,'["fruits"]'),
('mango',300,'["fruits"]'),
('peach',85,'["fruits"]'),
('pear',85,'["fruits"]'),
('plum',30,'["fruits"]'),
('orange',100,'["fruits"]'),
('grape',8,'["fruits"]'),
('blueberries',1,'["berries"]'),
('strawberries',8,'["berries"]'),
('raspberries',8,'["berries"]'),
('berry_mix',8,'["berries"]'),
--
('dates',8,'["berries"]'),
('chocolate',8,'["berries"]'),
--
('pecan',1,'["nuts"]'),
('pistachios',1,'["nuts"]'),
('macadamia',1,'["nuts"]'),
('walnuts',1,'["nuts"]'),
('chestnuts',1,'["nuts"]'),
('hazelnut',1,'["nuts"]'),
('almond',1,'["nuts"]'),
('cashew',1,'["nuts"]'),
('pumpkin_seed',1,'["nuts"]'),
-- 
('turkey',1,'["meat"]'),
('pork',1,'["meat"]'),
('mince',1,'["meat"]'),
('eggs',1,'["eggs"]'),
--
('salmon',1,'["fish"]'),
('codfish',1,'["fish"]'),
('tuna',1,'["fish"]'),
('shrimp',1,'["fish"]'),
('canned_fish',1,'["fish"]'),
-- 
('pan_cheese',1,'["cheese"]'),
-- 
('champinions',1,'["mushrooms"]'),
-- 
('oatmeal',1,'["groats"]'),
('bulgur',1,'["groats"]'),
('rice',1,'["groats"]'),
('quinoa',1,'["groats"]'),
('millet',1,'["groats"]'),
('polenta',1,'["groats"]'),
-- 
('potato',1,'["vegetables"]'),
('sweet_potato',300,'["vegetables"]'),
('zucchini',220,'["vegetables"]'),
('broccoli',1,'["vegetables"]'),
('cauliflower',750,'["vegetables"]'),
('chinese_cabbage',75,'["vegetables"]'),
('fennel',1,'["vegetables"]'),
('spinach',1,'["vegetables"]'),
('leek',1,'["vegetables"]'),
('carrot',75,'["vegetables"]'),
('cooked_beet',75,'["vegetables"]'),
('canned_beans',1,'["beans"]'),
('lentil',1,'["beans"]'),
('green_beans',1,'["beans"]'),
('canned_chickpea',1,'["beans"]'),
('red_pepper',1,'["vegetables"]'),
-- 
('coconut_milk',1,'["milk"]'),
('sour_cream',1,'["dairy"]'),
('camembert',1,'["cheese"]'),
('white_cheese',1,'["cheese"]'),
('mozzarella',1,'["cheese"]'),
('parmesan',1,'["cheese"]'),
('mustard',1,'["spice"]'),
('ginger',1,'["spice"]'),
('garlic',50,'["spice"]'),
('onion',80,'["spice"]'),
('green_onion',40,'["spice"]'),
('chili',1,'["spice"]'),
('lime',70,'["spice", "fruit"]'),
('lemon',100,'["spice", "fruit"]'),
('basil',1,'["spice"]'),
('parsley',1,'["spice"]'),
('thyme',1,'["spice"]'),
('mint',1,'["spice"]'),
('coriander',1,'["spice"]'),
('dill',1,'["spice"]'),
('rosmarin',1,'["spice"]'),
('curry',1,'["spice"]'),
('salz',1,'["spice"]'),
('black_pepper',1,'["spice"]'),
('soy_sauce',1,'["spice"]'),
('balsamic_sauce',1,'["spice"]'),
('pesto',1,'["spice"]'),
('olive_oil',1,'["spice"]'),
('coconut_oil',1,'["spice"]'),
('linseed_oil',1,'["spice"]'),
('yogurt',1,'["dairy"]'),
('kefir',1,'["dairy"]'),
('butter',1,'["dairy"]'),
('milk',1,'["dairy"]'),
('kakao',1,'["spice"]'),
('kaffee',1,'["spice"]'),
('tea',1,'["spice"]'),
('corn_waffles',1,'["groats"]'),
('trout_caviar',1,'["groats"]'),
-- 
('iceberg',400,'["vegetables"]'),
('romano',400,'["vegetables"]'),
('avocado',180,'["vegetables"]'),
('tomato',20,'["vegetables"]'),
('yellow_pepper',1,'["vegetables"]'),
('cucumber',80,'["vegetables"]'),
('celery',80,'["vegetables"]'),
('radish',1,'["vegetables"]'),
('canned_corn',1,'["vegetables"]'),
('mini_carrots',1,'["vegetables"]'),

--
('gum',1,'["hygiene"]'),
('sun_protection',1,'["hygiene"]'),
('lip_balsam',1,'["hygiene"]'),

('toilet_paper',1,'["hygiene"]'),
('paper_towels',1,'["hygiene"]'),

('tooth_paste', 1,'["hygiene"]'),
('tooth_brush_header', 1,'["hygiene"]'),
('deodorant', 1,'["hygiene"]'),
('q_tips', 1,'["hygiene"]'),

('liners',1,'["hygiene"]'),
('tampons',1,'["hygiene"]'),
('dailies',1,'["hygiene"]'),

('trash_bag_big',1,'["hygiene"]'),
('trash_bag_small',1,'["hygiene"]'),
('glass_wipes',1,'["hygiene"]'),

('showergel',1,'["hygiene"]'),
('shampoo',1,'["hygiene"]'),
('conditioner',1,'["hygiene"]'),

('liquid_soap',1,'["hygiene"]'),

('shaving_cream',1,'["hygiene"]'),
('razors',1,'["hygiene"]'),
('depilation_creme',1,'["hygiene"]'),

('hand_creme',1,'["hygiene"]'),
('body_creme',1,'["hygiene"]'),
('plaster',1,'["hygiene"]'),

('dish_soap',1,'["hygiene"]'),
('dish_sponges',1,'["hygiene"]'),
('table_cloth',1,'["hygiene"]'),
('floor_cloth',1,'["hygiene"]'),
('gloves',1,'["hygiene"]'),
('wc_soap',1,'["hygiene"]'),
('wc_cleaner',1,'["hygiene"]');

INSERT INTO rewe_products (product_id, id, link, quantity, name, image, price) VALUES
('coconut_milk', '13-8858135000059-rewe-online-services|48462001-231006', '/PD1332748', 250,'Real Thai Kokosnussmilch 17-19% 250ml',  '1332748/23734338_digital-image.png', 195),
('oatmeal', '13-4013138002095-rewe-online-services|48462001-231006', '/PD3850390', 500, 'Wurzener Haferflocken Kernig 500g',  '3850390/21487553_digital-image.png', 69),
('blueberries', '13-8718367801223-rewe-online-services|48462001-231006', '/PD2486005',200, 'Heidelbeeren 200g',  '2486005/24019286_digital-image.png', 179),
('pineapple', '13-8718868968081-rewe-online-services|48462001-231006', '/PD7384394', 500,  'Ananas groß extra süß',  '7384394/7360890_digital-image.png', 249),
('apple', '8-29175390-rewe-online-services|48462001-231006', '/PD9175393', 250, 'Apfel Gala', '9175393/24568905_digital-image.png', 67),
('apple', '8-29639793-rewe-online-services|48462001-231006', '/PD9639799', 250, 'Apfel Golden Delicious', '9639799/24569040_digital-image.png', 67),
('apricot', '8-24668453-rewe-online-services|48462001-231006', '/PD2237132', 1000, 'Aprikosen 1kg', '2237132/24021625_digital-image.png', 259),
('banana', '8-23376267-rewe-online-services|48462001-231006', '/PD1930502', 200,  'Bio Banane', '1930502/24568902_digital-image.png', 36),
('melon', '13-8717903560303-rewe-online-services|48462001-231006', '/PD20974',500, 'Galiamelone', '0020974/24570188_digital-image.png', 179),
('melon', '13-8717624949074-rewe-online-services|48462001-231006', '/PD45783', 500, 'Honigmelone', '0045783/8613000_digital-image.png', 199),
('kiwi', '8-20195632-rewe-online-services|48462001-231006', '/PD195634',80, 'Kiwi', '0195634/9686230_digital-image.png', 55),
('mango', '13-8717428061460-rewe-online-services|48462001-231006', '/PD25267',300, 'Mango essreif', '0025267/24569609_digital-image.png', 189),
('peach', '13-8427660000218-rewe-online-services|48462001-231006', '/PD2472828', 500,  'Pfirsich platt 500g', '2472828/24061035_digital-image.png', 129),
('plum', '13-8717906000479-rewe-online-services|48462001-231006', '/PD946252',  500, 'Pflaumen blau/schwarz 500g', '0946252/25704936_digital-image.png', 159),
('strawberries', '8-22698056-rewe-online-services|48462001-231006', '/PD1098643', 250,'REWE Beste Wahl Erdbeeren 250g', '1098643/22177717_digital-image.png', 249),
('kiwi', '13-4388844293465-rewe-online-services|48462001-231006', '/PD273968', 320, 'REWE Bio Kiwi 4 Stück', '0273968/4731960_digital-image.png', 259),
('orange', '13-4388844009684-rewe-online-services|48462001-231006', '/PD284208', 1000, 'REWE Bio Orange 1kg Netz', '0284208/8890440_digital-image.png', 219),
('peach', '13-5381858200596-rewe-online-services|48462001-231006', '/PD3401324', 500,  'REWE Bio Pfirsiche gelbfleischig 500g', '3401324/24324453_digital-image.png', 269),
('grape', '13-8908010339016-rewe-online-services|48462001-231006', '/PD1105044',  500, 'Tafeltrauben hell kernlos 500g', '1105044/21306366_digital-image.png', 129),
('grape', '13-8052780110020-rewe-online-services|48462001-231006', '/PD1104863', 500, 'Tafeltrauben rosé kernlos 500g Schale', '1104863/21432767_digital-image.png', 269),
('orange', '8-21057960-rewe-online-services|48462001-231006', '/PD1057961',1500, 'Valensina Saftorangen 1,5kg Netz', '1057961/21306091_digital-image.png', 299),
('pecan', '13-4010442407097-rewe-online-services|48462001-231006', '/PD2105363', 125, 'Farmer''s Snack Pekannuss 125g', '2105363/22901802_digital-image.png', 399),
('pistachios', '13-4003786602259-rewe-online-services|48462001-231006', '/PD1179404',225, 'Max Premium Pistazien geröstet & gesalzen 225g', '1179404/25991423_digital-image.png', 449),
('macadamia', '13-4388844241558-rewe-online-services|48462001-231006', '/PD334877', 125, 'REWE Beste Wahl Macadamia 125g', '0334877/21450132_digital-image.png', 339),
('walnuts', '13-4388844045699-rewe-online-services|48462001-231006', '/PD3158316', 150, 'REWE Beste Wahl aromatische Walnüsse 150g', '3158316/26801438_digital-image.png', 349),
('chestnuts', '13-4388844030008-rewe-online-services|48462001-231006', '/PD1026287', 100, 'REWE Bio Maronen 100g', '1026287/8672690_digital-image.png', 299),
('hazelnut', '13-4008258100011-rewe-online-services|48462001-231006', '/PD4744659', 200, 'Seeberger Haselnusskerne 200g', '4744659/975570_digital-image.png', 499),
('almond', '13-4008258065013-rewe-online-services|48462001-231006', '/PD4744411', 200,'Seeberger Mandeln 200g', '4744411/696350_digital-image.png', 369),
('codfish', '13-8712565106302-rewe-online-services|48462001-231006', '/PD2477147', 300,'Profish Kabeljau-Filet frisch 300g', '2477147/24195291_digital-image.png', 499),
('tuna', '13-8715271601062-rewe-online-services|48462001-231006', '/PD2835971', 150,'Profish MSC Thunfisch 150g', '2835971/25168382_digital-image.png', 449),
('salmon', '13-8712565111955-rewe-online-services|48462001-231006', '/PD2923423', 250, 'Profish Norwegisches Lachsfilet 250g', '2923423/25479090_digital-image.png', 499),
('turkey','13-2161350000008-rewe-online-services|48462001-231006', '/PD1267901', 200,'REWE Bio Putenmedaillons 200g', '1267901/21087796_digital-image.png', 598),
('turkey', '13-2161160000007-rewe-online-services|48462001-231006', '/PD1267789', 320, 'REWE Bio Putenschnitzel ca. 320g', '1267789/21087765_digital-image.png', 1017),
('pork','13-2196770000000-rewe-online-services|48462001-231006', '/PD1287057', 500,'REWE Bio Schweine Minutensteaks 500g', '1287057/19750840_digital-image.png', 1395),
('pork', '13-2196560000005-rewe-online-services|48462001-231006', '/PD1287067', 500, 'REWE Bio Schweine Schnitzel 500g', '1287067/20464546_digital-image.png', 1395),
('pork', '13-2196620000006-rewe-online-services|48462001-231006', '/PD1287122', 300, 'REWE Bio Schweinefilet 300g', '1287122/19750800_digital-image.png', 897),
('champinions', '13-4388858202354-rewe-online-services|48462001-231006', '/PD2991870', 200,'REWE Bio Champignons braun 200g', '2991870/11402940_digital-image.png', 199),
('champinions', '13-4388844058293-rewe-online-services|48462001-231006', '/PD1168615', 200,'REWE Bio Champignons weiß 200g', '1168615/21045438_digital-image.png', 199),
('salmon', '13-4250073439818-rewe-online-services|48462001-231006', '/PD760540', 200,'Followfish Bio-Lachs-Filets 200g', '0760540/6797910_digital-image.png', 799),
('bulgur', '13-4005009105455-rewe-online-services|48462001-231006', '/PD2321716',400,'Bio Zentrale Bulgur 400g', '2321716/24220479_digital-image.png', 249),
('canned_beans', '13-4388844128989-rewe-online-services|48462001-231006', '/PD920127', 250,'REWE Beste Wahl Kidney-Bohnen 250g', '0920127/21120153_digital-image.png', 89),
('canned_beans', '13-4388844017757-rewe-online-services|48462001-231006', '/PD734574', 250, 'REWE Beste Wahl Weiße Riesenbohnen 250g', '0734574/22223405_digital-image.png', 79),
('rice', '13-4388844168992-rewe-online-services|48462001-231006', '/PD276687', 500, 'REWE Bio Langkorn Naturreis Spitzenqualität 500g', '0276687/3767910_digital-image.png', 149),
('quinoa', '13-4388844273290-rewe-online-services|48462001-231006', '/PD3269394', 400, 'REWE Bio Quinoa Tricolore 400g', '3269394/26440488_digital-image.png', 299),
('canned_chickpea', '13-4388844300217-rewe-online-services|48462001-231006', '/PD7055914', 370, 'Rewe Bio Kichererbsen 370ml', '7055914/27084991_digital-image.png', 109),
('carrot', '8-24673808-rewe-online-services|48462001-231006', '/PD2588140',1000, 'Bio Speisemöhren 1kg', '2588140/24343912_digital-image.png', 199),
('spinach', '13-4251291101945-rewe-online-services|48462001-231006', '/PD7033343', 250, 'Blattspinat 250g', '7033343/26547223_digital-image.png', 199),
('cauliflower', '8-20482336-rewe-online-services|48462001-231006', '/PD482331', 750, 'Blumenkohl weiß', '0482331/7361280_digital-image.png', 139),
('broccoli', '8-23021648-rewe-online-services|48462001-231006', '/PD1007433', 500, 'Broccoli 500g', '1007433/21403678_digital-image.png', 139),
('potato', '13-4388844240148-rewe-online-services|48462001-231006', '/PD3525775', 1500, 'REWE Bio Speisefrühkartoffeln Festkochend 1,5kg', '3525775/21266397_digital-image.png', 259),
('zucchini', '8-24333245-rewe-online-services|48462001-231006', '/PD2577507',  500, 'REWE Bio Zucchini 500g', '2577507/26644840_digital-image.png', 199),
('sweet_potato', '8-20475963-rewe-online-services|48462001-231006', '/PD475963',300,  'Süßkartoffel', '0475963/24569668_digital-image.png', 90),
('zucchini', '8-20482169-rewe-online-services|48462001-231006', '/PD482161', 220, 'Zucchini grün', '0482161/24570156_digital-image.png', 26),
('camembert', '13-4388844014442-rewe-online-services|48462001-231006', '/PD578901', 150, 'REWE Bio Camembert 150g', '0578901/5917630_digital-image.png', 179),
('white_cheese', '13-4388844066113-rewe-online-services|48462001-231006', '/PD1260439', 150,'REWE Bio Feta 45% 150g', '1260439/17809780_digital-image.png', 199),
('canned_corn', '13-4388844092389-rewe-online-services|48462001-231006', '/PD371375', 140, 'REWE Bio Sonnenmais 140g', '0371375/7943370_digital-image.png', 99),
('iceberg', '13-8437003849046-rewe-online-services|48462001-231006', '/PD482595', 400,  'Eisbergsalat', '0482595/24570316_digital-image.png', 109),
('avocado', '13-4388840090785-rewe-online-services|48462001-231006', '/PD2333554',  180, 'REWE Bio Avocado', '2333554/24569615_digital-image.png', 189),
('basil', '8-22617576-rewe-online-services|48462001-231006', '/PD1045916', 30, 'REWE Bio Basilikum im Topf', '1045916/21289421_digital-image.png', 179),
('tomato', '13-4388840086191-rewe-online-services|48462001-231006', '/PD987085', 250,'REWE Bio Cherrytomate 250g', '0987085/11980510_digital-image.png', 129),
('red_pepper', '13-4388844031814-rewe-online-services|48462001-231006', '/PD1056856',400, 'REWE Bio Paprika Mix 400g', '1056856/9685530_digital-image.png', 349),
('cucumber', '13-8436000259209-rewe-online-services|48462001-231006', '/PD483303', 80, 'Salatgurke', '0483303/24569873_digital-image.png', 49),
('kefir', '13-4104060024931-rewe-online-services|48462001-231006', '/PD173780', 500,  'Andechser Natur Bio-Kefir 500g', '0173780/2301740_digital-image.png', 119),
('yogurt', '13-4388844006942-rewe-online-services|48462001-231006', '/PD194192',  150,'REWE Bio Joghurt mild 150g', '0194192/1210600_digital-image.png', 35),
('mozzarella', '13-4388844007512-rewe-online-services|48462001-231006', '/PD200385',  125,'REWE Bio Mozzarella 125g', '0200385/7299280_digital-image.png', 95),
('sour_cream', '13-4388844006935-rewe-online-services|48462001-231006', '/PD194191',  200, 'REWE Bio Saure Sahne 200g', '0194191/2459300_digital-image.png', 59),
('sour_cream', '13-4388844018549-rewe-online-services|48462001-231006', '/PD850243',  150, 'REWE Bio Schmand 150g', '0850243/5878710_digital-image.png', 59),
('butter', '13-4388844014251-rewe-online-services|48462001-231006', '/PD559003',  250,  'REWE Bio Süßrahmbutter 250g', '0559003/2923130_digital-image.png', 249),
('olive_oil', '13-4005009102973-rewe-online-services|48462001-231006', '/PD1116131', 500,  'Bio Zentrale Oliven-Öl 500ml', '1116131/23478858_digital-image.png', 699),
('soy_sauce', '13-4005009106117-rewe-online-services|48462001-231006', '/PD1099996', 140,  'Bio Zentrale Soja-Sauce 140ml', '1099996/23478925_digital-image.png', 269),
('curry', '13-4002674052046-rewe-online-services|48462001-231006', '/PD4201981', 40, 'Ostmann Curry 40g', '4201981/22457690_digital-image.png', 199),
('mustard', '13-4388860000160-rewe-online-services|48462001-231006', '/PD7070891', 200,  'REWE Beste Wahl Dijon Senf Scharf 200ml', '7070891/27424434_digital-image.png', 79),
('ginger', '13-2795400000009-rewe-online-services|48462001-231006', '/PD5222060', 100, 'Ingwer', '5222060/8945760_digital-image.png', 59),
('garlic', '13-4388860144642-rewe-online-services|48462001-231006', '/PD7219991', 150, 'Knoblauch 150g', '7219991/28163303_digital-image.png', 99),
('green_onion', '8-20482404-rewe-online-services|48462001-231006', '/PD482404', 40, 'Lauchzwiebeln Bund', '0482404/7360070_digital-image.png', 59),
('lime', '8-21316463-rewe-online-services|48462001-231006', '/PD1316461', 280, 'Limetten 4 Stück', '1316461/21287523_digital-image.png', 199),
('onion', '13-4388844265707-rewe-online-services|48462001-231006', '/PD3021457', 350,  'REWE Beste Wahl Zwiebel rot 350g', '3021457/26845602_digital-image.png', 119),
('lemon', '13-4388840085682-rewe-online-services|48462001-231006', '/PD7589883', 500,  'REWE Bio Zitrone 500g Netz', '7589883/8537390_digital-image.png', 219),
('onion', '8-22609991-rewe-online-services|48462001-231006', '/PD1041162', 500,  'REWE Bio Zwiebeln gelb 500g', '1041162/21289369_digital-image.png', 119),
('onion', '13-8713575340601-rewe-online-services|48462001-231006', '/PD1041138', 1000,  'Speisezwiebeln 1kg Netz', '1041138/21288183_digital-image.png', 119),
('thyme', '8-22617262-rewe-online-services|48462001-231006', '/PD1045853', 15,  'Thymian 15g Schale', '1045853/24320076_digital-image.png', 99),
('cashew', '13-4388844001770-rewe-online-services|48462001-231006', '/PD39464', 250, 'REWE Bio Cashewkerne 250g', '0039464/3951970_digital-image.png', 389),
--
('toilet_paper', '13-4388844255500-rewe-online-services|48462001-231006', '/PD2915973', 1, 'ja! Toilettenpapier 3-lagig 10x200 Blatt', '2915973/25929524_digital-image.png', 285),
('paper_towels', '13-4388844063020-rewe-online-services|48462001-231006', '/PD5863430', 1, 'ja! Küchenrollen 3-lagig 4 Stück', '5863430/21619223_digital-image.png', 145),
('razors', '13-7702018024612-rewe-online-services|48462001-231006', '/PD920417', 1, 'Gillette Simply Venus 2 Einwegrasierer 4 Stück', '0920417/22051589_digital-image.png', 199),
('glass_wipes', '13-4006508177325-rewe-online-services|48462001-231006', '/PD529338', 1, 'Swirl Brillen-Putztücher 30 Stück', '0529338/2098540_digital-image.png', 199),
('shaving_cream', '8-24791885-rewe-online-services|48462001-231006', '/PD1314797', 1,  'Today Rasiergel Aloe Vera 150ml', '1314797/20851001_digital-image.png', 119),
('trash_bag_small', '13-4006508173167-rewe-online-services|48462001-231006', '/PD3150674', 1, 'Swirl Tragegriff-Müllbeutel 5l, 40 Stück', '3150674/5405260_digital-image.png', 199),
('trash_bag_big', '13-4006508189632-rewe-online-services|48462001-231006', '/PD357009', 1, 'Swirl Zugband-Müllbeutel 20l, 20 Stück', '0357009/17711270_digital-image.png', 199),
('gum', '13-4009900385824-rewe-online-services|48462001-231006', '/PD5580820', 1, 'Wrigley''s Orbit Peppermint Multipack 5x5 Stück', '5580820/20689024_digital-image.png', 149),
--
('pumpkin_seed', '13-4388844001756-rewe-online-services|48462001-231006', '/PD39501', 175, 'REWE Bio Kürbiskerne ohne Schale 175g', '0039501/1341970_digital-image.png', 199),
('pan_cheese', '13-4002566010703-rewe-online-services|48462001-231006', '/PD575540',200, 'Gazi Grill- und Pfannenkäse Mediterrane Kräuter 2x100g', '0575540/7170410_digital-image.png', 219),
('white_cheese', '13-4002566003002-rewe-online-services|48462001-231006', '/PD9747915', 200, 'Gazi Hirtenkäse Classic 45% 200g', '9747915/2517700_digital-image.png', 169),
('parsley', '13-4388858202330-rewe-online-services|48462001-231006', '/PD2810050', 50, 'REWE Bio Petersilie im Topf', '2810050/24380667_digital-image.png', 179),
('chili', '13-8033803723724-rewe-online-services|48462001-231006', '/PD2212948', 500, 'Paprika rot spitz 500g', '2212948/23275441_digital-image.png', 199),
('fennel', '8-20483920-rewe-online-services|48462001-231006', '/PD483923', 250, 'Fenchel', '0483923/24570157_digital-image.png', 57),
('leek', '8-21236006-rewe-online-services|48462001-231006', '/PD1236008', 250, 'Porree', '1236008/24569677_digital-image.png', 40),
('parmesan', '13-8001230001302-rewe-online-services|48462001-231006', '/PD2024832', 150, 'Giovanni Ferrari Parmigiano Reggiano DOP 150g', '2024832/22552775_digital-image.png', 459),
('mint', '13-4012414994277-rewe-online-services|48462001-231006', '/PD139137', 15, 'Minze 15g Schale', '0139137/24345934_digital-image.png', 99),
('coriander', '8-22617255-rewe-online-services|48462001-231006', '/PD1045852', 15, 'Koriander 15g Schale', '1045852/24320401_digital-image.png', 99),
('black_pepper', '13-4388844014473-rewe-online-services|48462001-231006', '/PD577380', 60, 'REWE Bio Pfeffer schwarz 60g', '0577380/5228610_digital-image.png', 299),
('salz', '13-4003885000048-rewe-online-services|48462001-231006', '/PD2337023', 600, 'Saldoro Urmeersalz Weiß grob 600g', '2337023/25731330_digital-image.png', 199),
--
('dailies', '13-8001090740427-rewe-online-services|48462001-231006', '/PD7180161', 1, 'Always Fresh&Protect Slipeinlagen', 'https://img.rewe-static.de/7180161/27242358_digital-image.png?resize=60px:60px', 259),
('dailies', '13-8001090361912-rewe-online-services|48462001-231006', '/PD2876041', 1, 'Always Slipeinlagen Singles to go 20 Stück', 'https://img.rewe-static.de/2876041/26898304_digital-image.png?resize=60px:60px', 129),
('liners', '13-4015400731597-rewe-online-services|48462001-231006', '/PD3258205', 1, 'Always Ultra Damenbinden Normal mit Flügeln Sensitive 14 Stück', 'https://img.rewe-static.de/3258205/26438453_digital-image.png?resize=60px:60px', 179),
('tooth_paste', '13-8001090271471-rewe-online-services|48462001-231006', '/PD3091439', 1, 'Blend-a-med Complete Protect Extra frisch 75ml', 'https://img.rewe-static.de/3091439/26329975_digital-image.png?resize=60px:60px', 149),
('deodorant', '8-50120000-rewe-online-services|48462001-231006', '/PD2157165', 1, 'Dove Deo Roll-On Invisible Dry Anti-Transpirant 50ml', 'https://img.rewe-static.de/2157165/23079306_digital-image.png?resize=60px:60px', 199),
('liquid_soap', '13-4000388179004-rewe-online-services|48462001-231006', '/PD4139720', 1, 'Dove Seife Pflegende Hand-Waschlotion Nachfüllbeutel 500 ml', 'https://img.rewe-static.de/4139720/23192928_digital-image.png?resize=60px:60px', 299),
('plaster', '13-4005800099922-rewe-online-services|48462001-231006', '/PD3104796', 1, 'Hansaplast Pflaster Universal 20 Stück', 'https://img.rewe-static.de/3104796/2219150_digital-image.png?resize=60px:60px', 219),
('liquid_soap', '13-8714789510309-rewe-online-services|48462001-231006', '/PD972839', 1, 'Palmolive Flüssigseife Aquarium Nachfüllbeutel 500ml', 'https://img.rewe-static.de/0972839/23188468_digital-image.png?resize=60px:60px', 249),
('razors', '8-24468220-rewe-online-services|48462001-231006', '/PD2299639', 1, 'Today Einwegrasierer 10 Stück', 'https://img.rewe-static.de/2299639/23952855_digital-image.png?resize=60px:60px', 169),
('q_tips', '8-23685567-rewe-online-services|48462001-231006', '/PD2138626', 1, 'Today Wattestäbchen Nachfüller 160 Stück', 'https://img.rewe-static.de/2138626/22931998_digital-image.png?resize=60px:60px', 26),
('depilation_creme', '13-3059944020640-rewe-online-services|48462001-231006', '/PD5599881', 1, 'Veet Silk&Fresh Dusch-Haarentfernungs-Creme trockene Haut 150ml', 'https://img.rewe-static.de/5599881/23185042_digital-image.png?resize=60px:60px', 779),
('tampons', '13-3574661322636-rewe-online-services|48462001-231006', '/PD2136115', 1, 'o.b. ProComfort Normal 56 Stück', 'https://img.rewe-static.de/2136115/22168389_digital-image.png?resize=60px:60px', 479),
('gloves', '13-4388833562565-rewe-online-services|48462001-231006', '/PD1068358', 1, 'Haushaltshandschuhe Größe M', 'https://img.rewe-static.de/1068358/13643330_digital-image.png?resize=60px:60px', 99),
('dish_soap', '13-4015000962056-rewe-online-services|48462001-231006', '/PD2740565', 1, 'Pril Sensitive Aloe Vera 500ml', 'https://img.rewe-static.de/2740565/24945519_digital-image.png?resize=60px:60px', 149),
('wc_soap', '13-4015000960953-rewe-online-services|48462001-231006', '/PD2446398', 1, 'WC Frisch Duo-Aktiv Lemon 2x50ml', 'https://img.rewe-static.de/2446398/24144056_digital-image.png?resize=60px:60px', 299),
('wc_cleaner', '13-5000204016529-rewe-online-services|48462001-231006', '/PD7192203', 1, 'WC-Ente 100% Anti-Kalk 750ml', 'https://img.rewe-static.de/7192203/27592180_digital-image.png?resize=60px:60px', 249),
--
('milk', '13-4040600011941-rewe-online-services|48462001-231006', '/PD471402', 1, 'Landliebe frische Landmilch 3,8% 1,5l', 'https://img.rewe-static.de/0471402/3882110_digital-image.png?resize=60px:60px', 185),
('camembert', '13-3153126826003-rewe-online-services|48462001-231006', '/PD7671989', 1, 'Le Rustique Camembert 250g', 'https://img.rewe-static.de/7671989/2827980_digital-image.png?resize=60px:60px', 299),
('kakao', '13-4388844007154-rewe-online-services|48462001-231006', '/PD196985', 1, 'REWE Bio Instant-Kakao 400g', 'https://img.rewe-static.de/0196985/3118140_digital-image.png?resize=60px:60px', 279),
('tea', '11-70177174729-rewe-online-services|48462001-231006', '/PD3025092', 1, 'Twinings Selection Schwarztee 40g, 20 Stück', 'https://img.rewe-static.de/3025092/26321315_digital-image.png?resize=60px:60px', 299),
('tea', '13-4012824400115-rewe-online-services|48462001-231006', '/PD1383242', 1, 'Yogi Tea Schoko Bio 37,4g, 17 Beutel', 'https://img.rewe-static.de/1383242/22182340_digital-image.png?resize=60px:60px', 299),
('corn_waffles', '13-4388844021617-rewe-online-services|48462001-231006', '/PD956397', 1, 'REWE Bio Maiswaffeln 100g', 'https://img.rewe-static.de/0956397/7754570_digital-image.png?resize=60px:60px', 79),
('canned_fish', '13-4250073450639-rewe-online-services|48462001-231006', '/PD1008534', 1, 'Followfish MSC Thunfisch-Filets Natur 130g', 'https://img.rewe-static.de/1008534/21817144_digital-image.png?resize=60px:60px', 299),
('canned_fish', '13-5701101220018-rewe-online-services|48462001-231006', '/PD5850525', 1, 'Saeby Makrelen-Filets in eigenem Saft & Aufguss 88g', 'https://img.rewe-static.de/5850525/647630_digital-image.png?resize=60px:60px', 129),
('canned_fish', '13-3165950559569-rewe-online-services|48462001-231006', '/PD559336', 1, 'Saupiquet Thunfisch Naturale 80g', 'https://img.rewe-static.de/0559336/3577340_digital-image.png?resize=60px:60px', 149),
('canned_fish', '13-3165957380012-rewe-online-services|48462001-231006', '/PD2071371', 1, 'Saupiquet Thunfisch Naturale ohne Öl 140g', 'https://img.rewe-static.de/2071371/2519210_digital-image.png?resize=60px:60px', 249),
('canned_fish', '13-3165955527013-rewe-online-services|48462001-231006', '/PD263567', 1, 'Saupiquet Thunfisch-Filets Naturale ohne Öl 130g', 'https://img.rewe-static.de/0263567/3884750_digital-image.png?resize=60px:60px', 289);


INSERT INTO leftovers (user_id, product_id, quantity) VALUES
--
(1, 'gum', 0),
(1, 'sun_protection', 1),
(1, 'lip_balsam', 1),
(1, 'toilet_paper', 1),
(1, 'paper_towels', 0),
(1, 'tooth_paste', 1),
(1, 'tooth_brush_header', 1),
(1, 'deodorant', 1),
(1, 'q_tips', 0),
(1, 'liners', 1),
(1, 'tampons', 1),
(1, 'dailies', 1),
(1, 'trash_bag_big', 1),
(1, 'trash_bag_small', 1),
(1, 'glass_wipes', 0),
(1, 'showergel', 1),
(1, 'shampoo', 1),
(1, 'conditioner', 1),
(1, 'liquid_soap', 0),
(1, 'shaving_cream', 1),
(1, 'razors', 1),
(1, 'depilation_creme', 1),
(1, 'hand_creme', 1),
(1, 'body_creme', 1),
(1, 'plaster', 1),
(1, 'dish_soap', 1),
(1, 'dish_sponges', 1),
(1, 'table_cloth', 1),
(1, 'floor_cloth', 1),
(1, 'gloves', 1),
(1, 'wc_soap', 0),
(1, 'wc_cleaner', 1),
--
(1, 'soy_sauce', 0),
(1, 'olive_oil', 1),
(1, 'black_pepper', 1),
(1, 'salz', 1),
(1, 'tea', 1),
(1, 'mustard', 0),
--
(1, 'onion', 100),
(1, 'garlic', 150)
--
;

INSERT INTO recipes (user_id, id, ingredients_per_portion) VALUES
(1, 'breakfast-blueberry', '[
    {"productID":"coconut_milk", "quantity":62},
    {"productID":"oatmeal", "quantity":71},
    {"productID":"blueberries", "quantity":50}
]'), 
(1, 'hygiene', '[
    {"productID":"gum", "quantity":1},
    {"productID":"sun_protection", "quantity":1},
    {"productID":"lip_balsam", "quantity":1},
    {"productID":"toilet_paper", "quantity":1},
    {"productID":"paper_towels", "quantity":1},
    {"productID":"tooth_paste", "quantity":1},
    {"productID":"tooth_brush_header", "quantity":1},
    {"productID":"deodorant", "quantity":1},
    {"productID":"q_tips", "quantity":1},
    {"productID":"liners", "quantity":1},
    {"productID":"tampons", "quantity":1},
    {"productID":"dailies", "quantity":1},
    {"productID":"trash_bag_big", "quantity":1},
    {"productID":"trash_bag_small", "quantity":1},
    {"productID":"glass_wipes", "quantity":1},
    {"productID":"shower_gel", "quantity":1},
    {"productID":"shampoo", "quantity":1},
    {"productID":"conditioner", "quantity":1},
    {"productID":"liquid_soap", "quantity":1},
    {"productID":"shaving_cream", "quantity":1},
    {"productID":"razors", "quantity":1},
    {"productID":"depilation_creme", "quantity":1},
    {"productID":"hand_creme", "quantity":1},
    {"productID":"body_creme", "quantity":1},
    {"productID":"plaster", "quantity":1},
    {"productID":"dish_soap", "quantity":1},
    {"productID":"dish_sponges", "quantity":1},
    {"productID":"table_cloth", "quantity":1},
    {"productID":"floor_cloth", "quantity":1},
    {"productID":"gloves", "quantity":1},
    {"productID":"wc_soap", "quantity":1},
    {"productID":"wc_cleaner", "quantity":1}
]'), 
(1, 'oil-spices', '[
    {"productID":"black_pepper", "quantity":1},
    {"productID":"salz", "quantity":1},
    {"productID":"olive_oil", "quantity":1},
    {"productID":"soy_sauce", "quantity":1},
    {"productID":"kakao", "quantity":1},
    {"productID":"tea", "quantity":1}
]'), 
(1, '1-mushrooms-potato-cheese', '[
    {"productID":"champinions", "quantity":50},
    {"productID":"potato", "quantity":125},
    {"productID":"white_cheese", "quantity":50},
    {"productID":"onion", "quantity":20},
    {"productID":"tomato", "quantity":10},
    {"productID":"pumpkin_seed", "quantity":4},
    {"productID":"parsley", "quantity":4}
]'), 
(1, '2-pan_cheese-sweet_potato-avocado', '[
    {"productID":"pan_cheese", "quantity":65},
    {"productID":"sweet_potato", "quantity":150},
    {"productID":"avocado", "quantity":40},
    {"productID":"lemon", "quantity":25},
    {"productID":"onion", "quantity":20},
    {"productID":"garlic", "quantity":4},
    {"productID":"parsley", "quantity":4},
    {"productID":"chili", "quantity":2}
]'), 
(1, '3-bulgur-chickpea-cheese','[
     {"productID":"bulgur", "quantity":50},
     {"productID":"canned_chickpea", "quantity":90},
     {"productID":"zucchini", "quantity":55},
     {"productID":"mozzarella", "quantity":60},
     {"productID":"garlic", "quantity":4},
     {"productID":"tomato", "quantity":10},
     {"productID":"green_onion", "quantity":10},
     {"productID":"lemon", "quantity":25}
]'),
(1, '4-rice-fennel-soy-coconut','[
     {"productID":"rice", "quantity":62},
     {"productID":"fennel", "quantity":62},
     {"productID":"zucchini", "quantity":55},
     {"productID":"onion", "quantity":20},
     {"productID":"garlic", "quantity":6},
     {"productID":"coconut_milk", "quantity":62},
     {"productID":"soy_sauce", "quantity":12},
     {"productID":"ginger", "quantity":5},
     {"productID":"cashew", "quantity":15},
     {"productID":"basil", "quantity":15},
     {"productID":"chili", "quantity":2}
]'),
(1, '5-turkey-leek-sour_cream','[
     {"productID":"turkey", "quantity":50},
     {"productID":"leek", "quantity":125},
     {"productID":"garlic", "quantity":4},
     {"productID":"sour_cream", "quantity":50},
     {"productID":"parmesan", "quantity":5}
]'),
(1, '6-pan_cheese-cauliflower','[
    {"productID":"pan_cheese", "quantity":50},
    {"productID":"cauliflower", "quantity":190},
    {"productID":"green_onion", "quantity":10},
    {"productID":"lemon", "quantity":25},
    {"productID":"yogurt", "quantity":38},
    {"productID":"mint", "quantity":4}
]'),
(1, '7-quinoa-beans-avocado-sour_cream','[
    {"productID":"canned_beans", "quantity":62},
    {"productID":"quinoa", "quantity":50},
    {"productID":"onion", "quantity":20},
    {"productID":"sour_cream", "quantity":50},
    {"productID":"lime", "quantity":20},
    {"productID":"avocado", "quantity":45},
    {"productID":"coriander", "quantity":4}
]'),
(1, '8-pork-sweet_potato-green_beans','[
     {"productID":"pork", "quantity":70},
     {"productID":"sweet_potato", "quantity":150},
     {"productID":"green_beans", "quantity":50},
     {"productID":"thyme", "quantity":2},
     {"productID":"onion", "quantity":20},
     {"productID":"garlic", "quantity":4}
]'),
(1, '9-pork-potato-salad','[
     {"productID":"pork", "quantity":70},
     {"productID":"potato", "quantity":125},
     {"productID":"lemon", "quantity":25},
     {"productID":"romano", "quantity":25},
     {"productID":"yogurt", "quantity":25},
     {"productID":"radish", "quantity":25},
     {"productID":"parsley", "quantity":4}
]'),
(1, '10-salmon-vegetables','[
     {"productID":"salmon", "quantity":70},
     {"productID":"potato", "quantity":125},
     {"productID":"zucchini", "quantity":55},
     {"productID":"mustard", "quantity":1},
     {"productID":"carrot", "quantity":4},
     {"productID":"parsley", "quantity":4},
     {"productID":"onion", "quantity":20},
     {"productID":"tomato", "quantity":62}
]'),
(1, '11-sweet_potato-coconut-curry','[
    {"productID":"sweet_potato", "quantity":150},
    {"productID":"spinach", "quantity":25},
    {"productID":"coconut_milk", "quantity":62},
    {"productID":"curry", "quantity":4},
    {"productID":"yogurt", "quantity":25},
    {"productID":"onion", "quantity":20},
    {"productID":"tomato", "quantity":62}
]'),
(1, '12-turkey-rice-coconut-soya','[
    {"productID":"turkey", "quantity":50},
    {"productID":"rice", "quantity":62},
    {"productID":"chinese_cabbage", "quantity":100},
    {"productID":"coconut_milk", "quantity":62},
    {"productID":"ginger", "quantity":5},
    {"productID":"cashew", "quantity":15},
    {"productID":"soy_sauce", "quantity":12},
    {"productID":"garlic", "quantity":4},
    {"productID":"green_onion", "quantity":10}
]'),
(1, '13-turkey-white_cheese','[
    {"productID":"turkey", "quantity":50},
    {"productID":"white_cheese", "quantity":50},
    {"productID":"garlic", "quantity":4},
    {"productID":"onion", "quantity":20},
    {"productID":"cucumber", "quantity":20},
    {"productID":"parsley", "quantity":4},
    {"productID":"mint", "quantity":4},
    {"productID":"lemon", "quantity":25}
]'),
(1, '14-mushrooms-vegetables-curry', '[
    {"productID":"champinions", "quantity":50},
    {"productID":"carrot", "quantity":4},
    {"productID":"green_beans", "quantity":50},
    {"productID":"yellow_pepper", "quantity":50},
    {"productID":"onion", "quantity":20},
    {"productID":"curry", "quantity":4},
    {"productID":"coconut_milk", "quantity":62},
    {"productID":"hazelnut", "quantity":4}
]'), 
(1, 'salad1', '[
    {"productID":"iceberg", "quantity":100},
    {"productID":"tomato", "quantity":62},
    {"productID":"cucumber", "quantity":20},
    {"productID":"parsley", "quantity":4}
]'),
(1, 'snack1', '[
    {"productID":"grape", "quantity":100},
    {"productID":"mango", "quantity":75},
    {"productID":"apple", "quantity":75},
    {"productID":"peach", "quantity":75}
]')
;

INSERT INTO schedules (user_id, week_id, menu) VALUES
(1, 1, '[
    {"recipeID":"breakfast-blueberry", "portion":7},
    {"recipeID":"10-salmon-vegetables", "portion":4},
    {"recipeID":"8-pork-sweet_potato-green_beans", "portion":4},
    {"recipeID":"5-turkey-leek-sour_cream", "portion":4},
    {"recipeID":"salad1", "portion":18},
    {"recipeID":"snack1", "portion":14},
    {"recipeID":"hygiene", "portion":1},
    {"recipeID":"oil-spices", "portion":1}
]')
;

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
DELETE FROM users;
DELETE FROM products;
DELETE FROM rewe_products;
DELETE FROM leftovers;
DELETE FROM recipes;
DELETE FROM schedules;