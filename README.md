# 任天堂 amiibo 專賣（Demo）

以 Ruby on Rails 8 實作的全端電商網站，涵蓋完整購物流程、訂單狀態機管理與後台管理系統。
以 amiibo 商品為題材，練習從需求拆解到部署上線的完整開發流程。

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/db7393b2-1b56-4282-8883-7b5091d0412c" />

---

## 🔗 Links

| | |
|---|---|
| 🌐 Live Demo | [jdstore20260510.onrender.com](https://jdstore20260510.onrender.com/) |
| 📁 GitHub | [github.com/a892842486/jdstore20260510](https://github.com/a892842486/jdstore20260510) |

> ⚠️ 部署於 Render 免費方案，首次開啟可能需要等待約 30 秒啟動。

## 🔑 Demo Account

| 角色 | Email | Password |
|------|-------|----------|
| Admin | admin@test.com | 123456 |

---

## Features

### Storefront（前台）
- 商品列表、詳情瀏覽
- 購物車管理（新增、修改數量、刪除）
- 結帳與訂單建立流程
- 訂單狀態追蹤與歷史查詢
- 使用者註冊 / 登入（Devise）
- Email 訂單通知（下單、出貨、取消）
- 中英文 i18n 多語系切換

### Admin Dashboard（後台）
- 商品 CRUD（含圖片上傳至 AWS S3）
- 訂單列表管理
- 訂單狀態流轉操作（付款確認、出貨、取消）

### Email Notifications（寄信通知）
使用 Action Mailer 實作：
- 下單通知信
- 出貨通知信
- 訂單取消通知
- 管理員取消申請通知
支援訂單資訊與 i18n 多語系信件標題。

### Order State Machine（AASM）

使用 AASM 實作訂單狀態管理，確保狀態流轉的合法性與業務邏輯一致性。

```mermaid
stateDiagram-v2
    [*] --> order_placed : 建立訂單
    order_placed --> paid : 付款確認
    paid --> shipping : 開始出貨
    shipping --> shipped : 出貨完成
    order_placed --> order_cancelled : 取消
    paid --> order_cancelled : 取消
    shipped --> good_returned : 退貨
```

---

## Tech Stack
| 分類 | 技術 |
|------|------|
| Backend | Ruby on Rails 8、PostgreSQL |
| 認證 | Devise |
| 狀態機 | AASM |
| 信件 | Action Mailer |
| 檔案儲存 | Active Storage + AWS S3 |
| Frontend | Tailwind CSS |
| 部署 | Render |

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

## ⚙️ Installation

### 環境需求

- Ruby 3.x（建議 3.2+）
- PostgreSQL
- Node.js（Tailwind CSS 編譯用）

### 步驟

```bash
git clone git@github.com:a892842486/jdstore20260510.git
cd jdstore20260510/jdstore
bundle install
```

### 啟動

```bash
rails db:create db:migrate db:seed
rails server
```

開啟 [http://localhost:3000](http://localhost:3000)
