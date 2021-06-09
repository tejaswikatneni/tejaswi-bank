# README

To run the application follow the below steps

bundle install

rake db:seed

rails s

**To show the balance of account and last ten transactions**

HTTP Method: GET
URL: http://localhost:3000/api/v1/accounts/20/account_summary

Sample Response: {"status":"Success","account_summary":{"balance":"9871701835.0","last_ten_transactions":[{"id":5,"credit_account_id":59291066349745,"debit_account_id":null,"account_id":20,"transaction_type":"debit","amount":"10000.0","service_charge":"100.0","created_at":"2021-06-09T14:05:59.036Z","updated_at":"2021-06-09T14:05:59.036Z"},{"id":7,"credit_account_id":59291066349745,"debit_account_id":null,"account_id":20,"transaction_type":"debit","amount":"10000.0","service_charge":"100.0","created_at":"2021-06-09T14:15:25.309Z","updated_at":"2021-06-09T14:15:25.309Z"},{"id":9,"credit_account_id":59291066349745,"debit_account_id":null,"account_id":20,"transaction_type":"debit","amount":"10000.0","service_charge":"100.0","created_at":"2021-06-09T14:22:02.482Z","updated_at":"2021-06-09T14:22:02.482Z"},{"id":11,"credit_account_id":59291066349745,"debit_account_id":null,"account_id":20,"transaction_type":"debit","amount":"10000.0","service_charge":"100.0","created_at":"2021-06-09T14:22:14.095Z","updated_at":"2021-06-09T14:22:14.095Z"},{"id":13,"credit_account_id":59291066349745,"debit_account_id":null,"account_id":20,"transaction_type":"debit","amount":"10000.0","service_charge":"100.0","created_at":"2021-06-09T14:22:57.460Z","updated_at":"2021-06-09T14:22:57.460Z"},{"id":15,"credit_account_id":59291066349745,"debit_account_id":null,"account_id":20,"transaction_type":"debit","amount":"10000.0","service_charge":"100.0","created_at":"2021-06-09T14:23:27.886Z","updated_at":"2021-06-09T14:23:27.886Z"},{"id":17,"credit_account_id":59291066349745,"debit_account_id":null,"account_id":20,"transaction_type":"debit","amount":"10000.0","service_charge":"100.0","created_at":"2021-06-09T14:23:33.164Z","updated_at":"2021-06-09T14:23:33.164Z"},{"id":19,"credit_account_id":59291066349745,"debit_account_id":null,"account_id":20,"transaction_type":"debit","amount":"10000.0","service_charge":"100.0","created_at":"2021-06-09T14:23:35.282Z","updated_at":"2021-06-09T14:23:35.282Z"},{"id":22,"credit_account_id":null,"debit_account_id":59291066349745,"account_id":20,"transaction_type":"credit","amount":"10000.0","service_charge":"0.0","created_at":"2021-06-09T14:32:54.052Z","updated_at":"2021-06-09T14:32:54.052Z"}]}}


**To transfer funds between accounts**

HTTP Method: POST
URL: http://localhost:3000/api/v1/accounts/20/transfer
Params: { "account": { "credit_account_id": "19", "amount": "10000" } }

Sample Response: 

{"status":"Success","balance":"9871691735.0"}
