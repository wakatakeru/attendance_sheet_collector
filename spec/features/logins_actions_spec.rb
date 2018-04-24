require 'rails_helper'

RSpec.describe 'Logins', type: :feature do
  let(:student) { FactoryBot.create(:user) }
  let(:teacher) { FactoryBot.create(:user, :teacher) }

  context '存在しないユーザでログインを試行したとき' do
    it 'ログインページに遷移する' do
      visit new_user_session_path
      within '#new_user' do
        fill_in :user_st_num, with: 'hogehoge'
        fill_in :user_password, with: 'hogehoge'
      end
      click_button 'ログイン'
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  context '学生でログインしたとき' do
    before do
      visit new_user_session_path
      within '#new_user' do
        fill_in :user_st_num, with: student.st_num
        fill_in :user_password, with: student.password
      end
      click_button 'ログイン'
    end
    
    it '学生用トップページが表示される' do
      expect(page).to have_current_path(dashboard_student_index_path)
    end

    it '管理者用トップページには遷移できない' do
      visit dashboard_admin_index_path
      expect(page).to have_current_path(dashboard_student_index_path)
    end
  end

  context '教員でログインしたとき' do
    before do
      visit new_user_session_path
      within '#new_user' do
        fill_in :user_st_num, with: teacher.st_num
        fill_in :user_password, with: teacher.password
      end
      click_button 'ログイン'
    end

    it '管理者用トップページに遷移する' do
      expect(page).to have_current_path(dashboard_admin_index_path)
    end

    it '学生用トップページも表示できる' do
      visit dashboard_student_index_path
      expect(page).to have_current_path(dashboard_student_index_path)
    end
  end
end
