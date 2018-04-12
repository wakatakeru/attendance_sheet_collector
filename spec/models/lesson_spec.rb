require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let(:lesson) { FactoryBot.create(:lesson) }

  describe 'リレーションの確認' do
    context '科目が' do
      it '登録されていれば保存成功' do
        l = FactoryBot.build(:lesson)
        expect(l).to be_valid
      end

      it '登録されていなければ保存失敗' do
        l = FactoryBot.build(:lesson, week: lesson.week + 1, subject: nil)
        expect(l).not_to be_valid
      end
    end
  end
  
  describe 'バリデーション確認' do
    context '年度が' do
      it '重複していなければ保存成功' do
        l = FactoryBot.build(:lesson)
        l.week += 1
        expect(l).to be_valid
      end

      it '重複していれば保存失敗' do
        FactoryBot.build(:lesson, week: 2000, subject_id: 1)
        l = FactoryBot.build(:lesson, week: 2000, subject_id: 1)
        expect(l).not_to be_valid
      end
    end
  end
end
