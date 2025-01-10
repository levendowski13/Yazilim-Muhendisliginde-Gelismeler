--------------------------------------------------------------------------------------------------------------------------------------------
* Bu proje, Dart ile yazılmış bir REST API uygulamasıdır. Docker kullanarak aşağıdaki adımlarla imaj oluşturup çalıştırabilirsiniz.

--------------------------------------------------------------------------------------------------------------------------------------------

* 1- Docker imajını oluşturmak için şu komutu çalıştırın:

docker build -t rest-api-odev .

--------------------------------------------------------------------------------------------------------------------------------------------

* 2- Docker imajını container haline getirmek için şu komutu çalıştırın:

docker run -d -p 13:13 --name rest_api_container rest-api-odev
-- 13:13 portu üzerinden imajımızı Container haline getirir.

--------------------------------------------------------------------------------------------------------------------------------------------

* 3- Container halindeki uygulamanın ayakta olduğunu anlamak için şu komutu çalıştırın:

docker ps
-- Eğer rest-api-odev görüyorsanız Container'ınız çalışıyordur.
-- Container'ın ayakta olduğunu anlamanın diğer bir yolu da ona sorgular atmaktır. Diğer maddede bunu yapabilirsiniz.

docker start rest_api_odev-api-1
-- Bu komut ile de Container'e verdiğiniz adı kullanarak daha sonradan Container'ınız kapalı olduğunda ve çalıştırmak istediğinizde ayağa kaldırabilirsiniz.

--------------------------------------------------------------------------------------------------------------------------------------------

* 4- Aşşağıdaki komutlar ile çalışan Container'ı test edebiliriz: 

curl "http://localhost:13/api/add-two?num1=5&num2=7"    
-- Bu işlem iki sayıyı toplar ve sonuç olarak 12 dönderir.

curl -X POST -H "Content-Type: application/json" -d "{\"numbers\":[2,9,5]}" http://localhost:13/api/multiply    
-- Bu işlem gönderilen sayı dizisindeki bütün sayıları çarpar ve sonuç olarak 90 dönderir

--------------------------------------------------------------------------------------------------------------------------------------------

* 5- Docker Compose

docker-compose build 
-- Bu şekilde image'yi oluşturabiliriz.
!!-- Bu komutu çalıştırırken bazen hata veriyor. Birkaç kez tekrar çalıştırdıktan sonra çalışıyor.

docker-compose up
-- Bu komut ile de image'in Container'ını oluşturabiliriz.
!-- Eğer herhangi bir kütüphane hatası alınıyorsa dart pub get çalıştırılmalıdır. Normal şartlarda bunu kendisi zaten yapacaktır.

--------------------------------------------------------------------------------------------------------------------------------------------