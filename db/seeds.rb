# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create(:login => "hao", :email => "hao@foobar.com", :password => "foobar", :password_confirmation => "foobar", :role => "admin")

Page.create(:title => "公司简介", 
            :body => "<p>青岛双星名人实业有限公司星海精细化工是双星集团的骨干企业，除为集团公司内部生产配套外，还生产适合于建筑用的内外墙涂料、乳胶漆;轮胎用各种高、中、低档脱模剂，半钢内、外喷涂剂、全钢胶片隔离剂等高档助剂。并以高起点、高质量、精诚的合作荣誉，赢得了广大用户的好评。尤其是各种鞋用胶水，复合材料用胶水，都获得过国家及创新产品荣誉称号。公司本着环保、无污染的原则，在2007年成功地研发了多种鞋用水性胶，公司在近几年的不断发展中，形成了较大的生产及雄厚的技术支持。</p>\r\n<p>&nbsp;</p>\r\n<p>我公司占地35000㎡,拥有固定资产3000余万元，职工人数1200余人，科技研发人员50多人，具有雄厚的产品设计开发能力，一流的技术、一流的设备、严格的&ldquo;双星模式&rdquo;生产管理方式及IS09000的资格认证以及国家级技术检测中心，搭建了满足用户使用要求的可靠平台。</p>\r\n<p>&nbsp;</p>\r\n<p>我公司全体同仁真诚欢迎广大用户的光临指导与合作。</p>")

Page.create(:title => "公司荣誉", :body => "暂无内容")
Page.create(:title => "营销网络", :body => "暂无内容")

Page.create(:title => "联系方式",
            :body => "<p><span style=\"font-family: 宋体; font-size: 12px; color: #2f2f2f; line-height: 20px;\"> </span></p>\r\n<p style=\"text-align: left; padding-left: 30px;\">青岛星海精细化工有限公司</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<ul>\r\n<li>&nbsp;电&nbsp;&nbsp;&nbsp;&nbsp;话： 86 0532 82538699 </li>\r\n</ul>\r\n<ul>\r\n<li>&nbsp;传&nbsp;&nbsp;&nbsp;&nbsp;真： 86 0532 82538626 </li>\r\n</ul>\r\n<ul>\r\n<li>&nbsp;地&nbsp;&nbsp;&nbsp;&nbsp;址： 中国 山东 即墨市 青岛即墨市大新镇新胜庄村 </li>\r\n</ul>\r\n<p>&nbsp;</p>")

news_center = Category.create(:name => "新闻中心", :model => "broadcast")
Category.create(:name => "企业新闻", :model => "broadcast", :parent_id => news_center.id)
Category.create(:name => "行业新闻", :model => "broadcast", :parent_id => news_center.id)

Broadcast.create(:title => "网站开通", :body => "网站开通", :category_ids => [news_center.id], :highlighted => true)

p = Category.create(:name => "产品中心", :model => "product")
Category.create(:name => "鞋用胶粘剂", :model => "product", :parent_id => p.id)
Category.create(:name => "轮胎行业助剂", :model => "product", :parent_id => p.id)
Category.create(:name => "硫化橡胶多色底", :model => "product", :parent_id => p.id)
Category.create(:name => "混炼料", :model => "product", :parent_id => p.id)
pp = Category.create(:name => "乳胶漆", :model => "product", :parent_id => p.id)
Category.create(:name => "双星乳胶漆", :model => "product", :parent_id => pp.id)

p = Category.create(:name => "下载中心", :model => "asset")
Category.create(:name => "产品相关", :model => "asset", :parent_id => p.id)
Category.create(:name => "资源文件", :model => "asset", :parent_id => p.id)
