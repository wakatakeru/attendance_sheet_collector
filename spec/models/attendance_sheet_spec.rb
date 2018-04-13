require 'rails_helper'

RSpec.describe AttendanceSheet, type: :model do
  let(:attendance_sheet) { FactoryBot.create(:attendance_sheet) }

  describe 'バリデーション確認' do
    context '授業概要と授業コメントが' do
      it '空でないとき登録成功' do
        s = FactoryBot.build(:attendance_sheet)
        expect(s).to be_valid
      end
    end

    context '授業概要が' do
      it '空のとき登録失敗' do
        s = FactoryBot.build(:attendance_sheet, summary: '')
        expect(s).not_to be_valid
      end
    end
    
    context '授業コメントが' do
      it '空のとき登録失敗' do
        s = FactoryBot.build(:attendance_sheet, comment: '')
        expect(s).not_to be_valid
      end
    end
  end
end
