# 任天堂 amiibo 專賣（Demo）

Rails 8 電商網站作品，
支援商品瀏覽、購物車、訂單流程、
AASM 訂單狀態管理與中英文切換。
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/db7393b2-1b56-4282-8883-7b5091d0412c" />

## Demo Account
Admin:
- Email: admin@test.com
- Password: 123456

---

## Live Demo

網站：
[https://jdstore20260510.onrender.com](https://jdstore20260510.onrender.com/)

GitHub：
[https://github.com/a892842486/jdstore20260510](https://github.com/a892842486/jdstore20260510)

---

## Features

### Storefront（前台功能）

- 首頁（Landing Page）
- 商品列表頁（Product Listing）
- 商品詳情頁（Product Detail）
- 購物車功能
- 結帳流程
- 訂單建立與查看
- 使用者註冊 / 登入（Devise）
- Email 訂單通知
- 中英文 i18n 多語系切換

### Admin Dashboard（後台功能）

- 商品管理（新增 / 編輯 / 刪除）
- 商品圖片上傳（AWS S3）
- 後台商品列表
- 後台訂單列表
- 訂單狀態管理（AASM）

### Email Notifications（寄信通知）

使用 Action Mailer 實作：

- 下單通知信
- 出貨通知信
- 訂單取消通知
- 管理員取消申請通知

支援訂單資訊與 i18n 多語系信件標題。

### Order Workflow（AASM）

使用 AASM 管理訂單狀態流轉：

order_placed → paid → shipping → shipped

Additional flows:
cancel → order_cancelled
return → good_returned

支援訂單付款、出貨、取消與退貨流程。

使用 AASM 管理訂單狀態流轉與商業邏輯。

---

## Tech Stack

### Backend
- Ruby on Rails 8
- PostgreSQL
- Devise
- AASM
- Action Mailer
- Active Storage

### Frontend
- Tailwind CSS

### Cloud / Deployment
- AWS S3
- Render

---

## Screenshots

### Storefront

Homepage
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/db7393b2-1b56-4282-8883-7b5091d0412c" />


Product Page
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e361614c-b053-4bb2-939f-48081d0d2c02" />


Shopping Cart
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/13dfc00e-a3d5-4ed5-83f2-efd80b2b8ac8" />

Checkout Page
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/a1443cef-56ad-480e-a235-2739c0583047" />

Order Detail
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4943769a-29f3-47a9-8672-9a88f0e8a4db" />

Order History
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/a09edd2e-4c56-4c43-a483-527e62b8fdfc" />

### Admin Dashboard

Admin Dashboard
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4d316ff3-30f7-42e0-822a-1359e81abe0d" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ae0561e1-7a7c-405d-84b5-8717b575e725" />

### Authentication

Login/Register
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0c20d6b4-4798-4379-a1b3-775f4089c73e" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/58c9843a-a640-4e94-81ee-854957c7f8d8" />

### Additional Features

Email Preview
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/6586af2a-c2ca-4680-9caf-7046a7895727" />

i18n Preview
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f998db8c-a36b-4fe3-9693-d314a7b7a93d" />


---

## Installation

```bash
git clone git@github.com:a892842486/jdstore20260510.git

cd jdstore20260510
cd jdstore

bundle install

rails db:create
rails db:migrate
rails db:seed
```
