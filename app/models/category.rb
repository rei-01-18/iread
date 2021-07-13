class Category < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },
   { id: 2, name: 'バトル' },
   { id: 3, name: 'ホラー' },
   { id: 4, name: 'SF・推理' },
   { id: 5, name: '恋愛' },
   { id: 6, name: 'ビジネス' },
   { id: 7, name: 'コメディ' },
   { id: 8, name: '参考書' },
   { id: 9, name: '自伝' },
   { id: 10, name: 'その他' }
 ]

  include ActiveHash::Associations
  has_many :books
 end