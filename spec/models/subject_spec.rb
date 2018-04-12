require 'rails_helper'

RSpec.describe Subject, type: :model do
  let(:subject) { FactoryBot.create(:subject) }

  describe 'バリデーション確認' do
    context '登録を試行したとき' do
      it '授業と年度が重複していなければ登録成功' do
        s = FactoryBot.build(:subject, name: 'TestExpr2', term: '2000')
        expect(s).to be_valid
      end
      
      it '年度が重複していれば登録失敗' do
        s = FactoryBot.build(:subject, term: subject.term)
        expect(s).not_to be_valid
      end

      it '授業名が重複していれば登録失敗' do
        s = FactoryBot.build(:subject, name: subject.name)
        expect(s).not_to be_valid
      end

      it '授業名が空なら登録失敗' do
        s = FactoryBot.build(:subject, name: '')
        expect(s).not_to be_valid
      end

      it '年度が空なら登録失敗' do
        s = FactoryBot.build(:subject, term: '')
        expect(s).not_to be_valid
      end
    end
  end
end
