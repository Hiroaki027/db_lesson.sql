Q1
create table departments (
    -> department_id int unsigned auto_increment primary key,
    -> name varchar(20) not null,
    -> created_at timestamp default current_timestamp,
    -> updated_at timestamp default current_timestamp on update current_timestamp
    -> );

Q2
alter table people add department_id int unsigned after email;
-- afterを使うことでemailカラムの後(次)にdepartment_idカラムをaddする

Q3
insert into departments (name)
    -> values
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');

insert into people (name, email, department_id, age, gender)
    -> values
    -> ('モンキー・D・ルフィ', 'lufy@gizumo.jp', 4, 19, 1),
    -> ('ロロノア・ゾロ', 'zoro@gizumo.jp', 1, 21, 1),
    -> ('ナミ', 'nami@gizumo.jp', 3, 20, 2),
    -> ('ウソップ', 'usopp@gizumo.jp', 2, 19, 1),
    -> ('ヴィンスモーク・サンジ', 'sanji@gizumo.jp', 2, 21, 1),
    -> ('トニートニー・チョッパー', 'chopper@gizumo.jp', 2, 17, 1),
    -> ('ニコ・ロビン', 'robin@gizumo.jp', 5, 30, 2),
    -> ('フランキー', 'franky@gizumo.jp', 2, 36, 1),
    -> ('ブルック', 'brook@gizumo.jp', 1, 90, 1),
    -> ('ジンベエ', 'jinbe@gizumo.jp', 1, 46, 1);

insert into reports ( person_id, content)
    -> values
    -> ( 7, '海賊王に俺はなる！！'),
    -> ( 8, '背中の傷は剣士の恥だ'),
    -> ( 9, 'この船の航海士は誰！！？'),
    -> ( 10, 'おれは狙撃手、援護が花道'),
    -> ( 11, '長い間、くそお世話になりました！！'),
    -> ( 12, 'おれが万能薬になるんだ！！'),
    -> ( 13, '人として、恥ずかしいわ'),
    -> ( 14, 'なんのその男は裸百貫の波に向かって立つ獅子であれ'),
    -> ( 15, 'パンツ、見せてもらってもよろしいですか？'),
    -> ( 16, '失った物ばかり数えるな！！！無いものは無い！！！');

Q4
update people set department_id = ceil(1 + rand() * 5)
    -> where department_id is null;
--ceil(rand() * 5)でdepartment_idにランダムな整数を振り分け
--ceil(数値)で小数点や負の数値を切り上げて整数にする
--(1 + rand() * 5)で1以上5未満の乱数を生成(1~4までの数字をランダムに生成)

select * from people;

Q5
select name, age from people
    -> where gender = 1
    -> order by age desc;

Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

-- SELECT後に表示したいカラムを指定し、FROM後にどのテーブルかを指定
--WHERE句で`department_id`カラムが1に完全一致しているレコードを絞り込み
--ORDER BYで`created_at`カラム(いわゆる作成日)順に昇順で並び替えている。

Q7
select name from people
    -> where age >= 20 and age < 30 or age >=40 and age < 50;

Q8
select * from people
    -> where department_id = 1 and age is not null
    -> order by age asc;

Q9
select avg(age) as average_age from people
    -> where gender = 2 and department_id = 4
    -> group by gender;

Q10
select p.name, d.name, r.content from people p
    -> join reports r using (person_id)
    -> join departments d using (department_id);

Q11
select p.name from people p left outer
    -> join reports r using (person_id)
    -> where content = '' or content is null;