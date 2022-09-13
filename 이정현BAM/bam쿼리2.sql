--시퀀스
create sequence CAMP_SEQ increment by 1 minvalue 0 start with 0 nocache;
create sequence INQUIRY_SEQ increment by 1 minvalue 0 start with 0 nocache;
create sequence SORT_SEQ increment by 1 minvalue 0 start with 0 nocache;
create sequence REVIEW_SEQ increment by 1 minvalue 0 start with 0 nocache;
create sequence IMG_SEQ increment by 1 minvalue 0 start with 0 nocache;
create sequence HEART_SEQ increment by 1 minvalue 0 start with 0 NOCACHE;

--관리자
insert into ADMIN values('admin@gmail.com', 'qwer1234@');

insert into AUTHORITY values(1, '일반회원');
insert into AUTHORITY values(2, '사업자');

insert into B_STATE values(1, '결제완료');
insert into B_STATE values(2, '취소완료');

insert into I_STATE values(1, '문의대기');
insert into I_STATE values(2, '문의완료');

--<회원>
insert into MEMBER values('email301@gmail.com', 2, '이름301', '닉네임301', 'qwer1234@', 0, 'true', 00000301, 'SILVER');
insert into OWNER values('email301@gmail.com', null, '이름301', '123-45-67890', '회사명301', '회사주소301', '02-1234-1234');

insert into MEMBER values('email302@gmail.com', 2, '이름302', '닉네임302', 'qwer1234@', 0, 'true', 00000302, 'SILVER');
insert into OWNER values('email302@gmail.com', null, '이름302', '123-45-67890', '회사명302', '회사주소302', '02-1234-1234');

insert into MEMBER values('email303@gmail.com', 2, '이름303', '닉네임303', 'qwer1234@', 0, 'true', 00000303, 'SILVER');
insert into OWNER values('email303@gmail.com', null, '이름303', '123-45-67890', '회사명303', '회사주소303', '02-1234-1234');

insert into MEMBER values('email304@gmail.com', 2, '이름304', '닉네임304', 'qwer1234@', 0, 'true', 00000304, 'SILVER');
insert into OWNER values('email304@gmail.com', null, '이름304', '123-45-67890', '회사명304', '회사주소304', '02-1234-1234');

--<캠핑장>
ALTER SEQUENCE camp_seq RESTART 1;

ALTER SEQUENCE heart_seq RESTART 1;

ALTER SEQUENCE img_seq RESTART 1;

ALTER SEQUENCE inquiry_seq RESTART 1;

ALTER SEQUENCE review_seq RESTART 1;

ALTER SEQUENCE sort_seq RESTART 1;

insert into CAMP values(
    NEXTVAL(camp_seq),
    '청포대숲속야영장',
    '충청남도 태안군 남면 청포대길 32-8',
    '041-000-0000',
    9,
    36,
    0,
    '전기시설,하수도시설',
    '소화기,대피공간',
	null,
    '041-670-2766',
    '태안군청',
    0,
    null,
    10000
);

insert into CAMP values(
    NEXTVAL(camp_seq),
    '청포대휴야영장',
    '충청남도 태안군 남면 청포대길 63-6',
    '041-000-0000',
    10,
    40,
    0,
    '전기시설,하수도시설',
    '소화기,대피공간',
    null,
    '041-670-2766',
    '태안군청',
    0,
    null,
    10000
);

insert into CAMP values(
    NEXTVAL(camp_seq), 
    '몽산포오션캠핑장',
    '충청남도 태안군 남면 신장리 433-4',
    '041-000-0000',
    18,
    80,
    0,
    '전기시설,하수도시설',
    '소화기,대피공간',
    null,
    '041-670-2766',
    '태안군청',
    0,
    null,
    0
);

insert into CAMP values(
    NEXTVAL(camp_seq), 
    '솔향기캠핑장',
    '충청남도 태안군 소원면 모항리 442-3',
    '041-000-0000',
    31,
    124,
    0,
    '전기시설,하수도시설',
    '소화기,대피공간',
    null,
    '041-670-2766',
    '태안군청',
    0,
    null,
    10000
);

insert into SORT values(nextval(SORT_SEQ), 1, '오토캠핑', '데크', 6, 25000, '청포대숲속야영장-데크사이트_353935.jpg', '청포대숲속야영장-데크사이트.jpg');
insert into IMG values(nextval(IMG_SEQ), 1, '청포대숲속야영장-thumb_1242423.jpg', '청포대숲속야영장-thumb.jpg', 119359, 'thumb');
insert into IMG values(nextval(IMG_SEQ), 1, '청포대숲속야영장-1_243521.jpg', '청포대숲속야영장-1.jpg', 169572, 'detail');
insert into IMG values(nextval(IMG_SEQ), 1, '청포대숲속야영장-2_24352145551.jpg', '청포대숲속야영장-2.jpg', 35100, 'detail');
insert into IMG values(nextval(IMG_SEQ), 1, '청포대숲속야영장-3_2425211.jpg', '청포대숲속야영장-3.jpg', 138206, 'detail');
insert into IMG values(nextval(IMG_SEQ), 1, '청포대숲속야영장-4_4253235.jpg', '청포대숲속야영장-4.jpg', 201597, 'detail');
update OWNER set CAMP_IDX = 1 where EMAIL = 'email301@gmail.com';

insert into SORT values(nextval(SORT_SEQ), 2, '오토캠핑', '데크', 6, 40000, '청포대휴캠핑장-데크사이트_32583744.jpg', '청포대휴캠핑장-데크사이트.jpg');
insert into IMG values(nextval(IMG_SEQ), 2, '청포대휴캠핑장-thumb_23939583.png', '청포대휴캠핑장-thumb.png', 708730, 'thumb');
insert into IMG values(nextval(IMG_SEQ), 2, '청포대휴캠핑장-1_2343583.jpg', '청포대숲속야영장-1.jpg', 445319, 'detail');
insert into IMG values(nextval(IMG_SEQ), 2, '청포대휴캠핑장-2_234536.jpg', '청포대숲속야영장-2.jpg', 112477, 'detail');
insert into IMG values(nextval(IMG_SEQ), 2, '청포대휴캠핑장-3_353532.png', '청포대숲속야영장-3.jpg', 873733, 'detail');
insert into IMG values(nextval(IMG_SEQ), 2, '청포대휴캠핑장-4_596937.jpg', '청포대숲속야영장-4.jpg', 107108, 'detail');
update OWNER set CAMP_IDX = 2 where EMAIL = 'email302@gmail.com';

insert into SORT values(nextval(SORT_SEQ), 3, '오토캠핑', 'A구역', 4, 30000, '몽산포오션캠핑장-A구역_2242232.jpg', '몽산포오션캠핑장-A구역.jpg');
insert into SORT values(nextval(SORT_SEQ), 3, '오토캠핑', 'B구역', 4, 30000, '몽산포오션캠핑장-B구역_246566348.png', '몽산포오션캠핑장-B구역.png');
insert into SORT values(nextval(SORT_SEQ), 3, '오토캠핑', 'C구역', 4, 30000, '몽산포오션캠핑장-C구역_553232.jpg', '몽산포오션캠핑장-C구역.jpg');
insert into SORT values(nextval(SORT_SEQ), 3, '오토캠핑', 'D구역', 4, 30000, '몽산포오션캠핑장-D구역_24905348.png', '몽산포오션캠핑장-D구역.png');
insert into IMG values(nextval(IMG_SEQ), 3, '몽산포오션캠핑장-thumb_25462332.jpg', '몽산포오션캠핑장-thumb.jpg', 72881, 'thumb');
insert into IMG values(nextval(IMG_SEQ), 3, '몽산포오션캠핑장-1_9255542.jpg', '몽산포오션캠핑장-1.jpg', 56588, 'detail');
insert into IMG values(nextval(IMG_SEQ), 3, '몽산포오션캠핑장-2_536522.jpg', '몽산포오션캠핑장-2.jpg', 125453, 'detail');
insert into IMG values(nextval(IMG_SEQ), 3, '몽산포오션캠핑장-3_92211442.jpg', '몽산포오션캠핑장-3.jpg', 100937, 'detail');
update OWNER set CAMP_IDX = 3 where EMAIL = 'email303@gmail.com';

insert into SORT values(nextval(SORT_SEQ), 4, '오토캠핑', '대형데크 A존', 6, 40000, '솔향기캠핑장-A존_4788912.jpg', '솔향기캠핑장-A존.jpg');
insert into SORT values(nextval(SORT_SEQ), 4, '오토캠핑', '일반형데크 B존', 4, 32000, '솔향기캠핑장-B존_4242218912.jpg', '솔향기캠핑장-B존.jpg');
insert into SORT values(nextval(SORT_SEQ), 4, '오토캠핑', '자연형,노지 C존', 6, 25000, '솔향기캠핑장-C존_424221912.jpg', '솔향기캠핑장-C존.jpg');
insert into SORT values(nextval(SORT_SEQ), 4, '카라반', '카라반(정박형, 카라반 제공) D존', 4, 160000, '솔향기캠핑장-D존_4431112.jpg', '솔향기캠핑장-D존.jpg');
insert into SORT values(nextval(SORT_SEQ), 4, '오토캠핑', '자동차캠핑장 E존', 6, 50000, '솔향기캠핑장-E존_1331112.jpg', '솔향기캠핑장-E존.jpg');
insert into IMG values(nextval(IMG_SEQ), 4, '솔향기캠핑장-thumb_4242992.jpg', '솔향기캠핑장-thumb.jpg', 86927, 'thumb');
insert into IMG values(nextval(IMG_SEQ), 4, '솔향기캠핑장-1_19942.jpg', '솔향기캠핑장-1.jpg', 124265, 'detail');
insert into IMG values(nextval(IMG_SEQ), 4, '솔향기캠핑장-2_319942.jpg', '솔향기캠핑장-2.jpg', 102800, 'detail');
insert into IMG values(nextval(IMG_SEQ), 4, '솔향기캠핑장-3_342112.jpg', '솔향기캠핑장-3.jpg', 58618, 'detail');
insert into IMG values(nextval(IMG_SEQ), 4, '솔향기캠핑장-4_342113.jpg', '솔향기캠핑장-4.jpg', 72712, 'detail');
insert into IMG values(nextval(IMG_SEQ), 4, '솔향기캠핑장-5_329942.jpg', '솔향기캠핑장-5.jpg', 125655, 'detail');
insert into IMG values(nextval(IMG_SEQ), 4, '솔향기캠핑장-6_4429942.jpg', '솔향기캠핑장-6.jpg', 125655, 'detail');
update OWNER set CAMP_IDX = 4 where EMAIL = 'email304@gmail.com';

--<예약>
Insert into BOOKING (
    IMP_UID,EMAIL,CAMP_IDX,SORT_IDX,S_NO,TOTAL_FEE,BDATE,CHECK_IN,CHECK_OUT,TEL,MEMO,P_NUM,REVIEW_STATE,NAME,SERVICE_FEE,USING_STATE
    ) values (
    'imp_100',
    'email301@gmail.com',
    4,
    7,
    1,
    40000,
    str_to_date('18/09/14','%y/%m/%d'),
    str_to_date('18/09/15','%y/%m/%d'),
    str_to_date('18/09/17','%y/%m/%d'),
    '010-1234-1234',
    null,
    6,
    'F',
    '이두일',
    400,
    'T'
);

Insert into BOOKING (
    IMP_UID,EMAIL,CAMP_IDX,SORT_IDX,S_NO,TOTAL_FEE,BDATE,CHECK_IN,CHECK_OUT,TEL,MEMO,P_NUM,REVIEW_STATE,NAME,SERVICE_FEE,USING_STATE
    ) values (
    'imp_101',
    'email301@gmail.com',
    4,
    8,
    1,
    32000,
    str_to_date('18/09/14','%y/%m/%d'),
    str_to_date('18/09/15','%y/%m/%d'),
    str_to_date('18/09/17','%y/%m/%d'),
    '010-1234-1234',
    null,
    4,
    'F',
    '오서준',
    320,
    'T'
);

Insert into BOOKING (
    IMP_UID,EMAIL,CAMP_IDX,SORT_IDX,S_NO,TOTAL_FEE,BDATE,CHECK_IN,CHECK_OUT,TEL,MEMO,P_NUM,REVIEW_STATE,NAME,SERVICE_FEE,USING_STATE
    ) values (
    'imp_102',
    'email301@gmail.com',
    4,
    9,
    1,
    25000,
    str_to_date('18/09/14','%y/%m/%d'),
    str_to_date('18/09/15','%y/%m/%d'),
    str_to_date('18/09/17','%y/%m/%d'),
    '010-1234-1234',
    null,
    6,
    'F',
    '양현성',
    250,
    'T'
);

Insert into BOOKING (
    IMP_UID,EMAIL,CAMP_IDX,SORT_IDX,S_NO,TOTAL_FEE,BDATE,CHECK_IN,CHECK_OUT,TEL,MEMO,P_NUM,REVIEW_STATE,NAME,SERVICE_FEE,USING_STATE
    ) values (
    'imp_103',
    'email302@gmail.com',
    4,
    9,
    1,
    25000,
    str_to_date('18/09/15','%y/%m/%d'),
    str_to_date('18/09/16','%y/%m/%d'),
    str_to_date('18/09/18','%y/%m/%d'),
    '010-1234-1234',
    null,
    6,
    'F',
    '이두일',
    250,
    'T'
);
