#== TestStudentUser
student = User.create(
  name: 'hoge',
  st_num: 's00t200',
  email: 's00t200@stu.kagawa-u.ac.jp',
  role: :student,
  password: 'hogehoge',
  password_confirmation: 'hogehoge'
)

#== TestTeacherUser
User.create(
  name: 'teacher',
  st_num: 'teacher',
  email: 'teacher@stu.kagawa-u.ac.jp',
  role: :teacher, 
  password: 'hogehoge',
  password_confirmation: 'hogehoge'
)

#== TestSubject
s = Subject.create(
  name: 'InfoExprTest',
  display_name: '情報環境実験テスト',
  term: 2099,
)

#== TestLesson
l = Lesson.create(
  week: 1,
  subject_id: s.id
)

#== TestAS
AttendanceSheet.create(
  user_id: student.id,
  lesson_id: l.id,
  comment: 'hogehoge'
)
