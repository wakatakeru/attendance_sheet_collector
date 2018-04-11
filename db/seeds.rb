#== TestStudentUser
User.create(
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
