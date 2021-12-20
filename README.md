# Books Application
In this mobile app  users can authenticate, can see / review  a lot of books and they can customize their profile. Furthermore they can share their ideas in form page to discuss about any book they choose.

# Screenshots
 
 ## Login Page
 
 <img src="https://i.ibb.co/KLCtqsx/Screenshot-1639999722.png" width="180" height="380" />

 <br />

 ## Home Page
 <img src="https://i.ibb.co/wz2Xn5s/Screenshot-1639999700.png" width="180" height="380" />

# Used Technologies
- Used <b>flutter</b> dart framework for mobile app.
- Used <b>nodejs</b> to implement rest api.
- Used <b>MongoDB</b> as database.
- <b>Docker</b>.

# Setup MongoDB via Docker
- If you don't have docker you can install it from [here](https://docs.docker.com/get-docker/).
- Firstly, run this command to create and start your db  ```docker run --name some-mongo -p 27017:27017 -d mongo ```.
- Check your container via ```docker ps``` this will return a container ID (the first 12 characters from the hash), the image name (in this case, mongo), command, created, status, ports and the name of the container (some-mongo).
- If you want you can also install [MongoDB Compass](https://www.mongodb.com/products/compass)
- If you using <b>MongoDB Compass</b> you can connect your virtual db with this url. ``` mongodb://0.0.0.0:27017/?readPreference=primary&appname=MongoDB%20Compass&ssl=false ```.
- If you can't connect check your ip adress via this command. ``` docker inspect some-mongo```
- It will return a dict. Then you should find key which name is ```IPAddress``` just copy and paste the value into connection url. In this case replace with ``` 0.0.0.0 ```.


### Contributors
<a href="https://github.com/Vitaee/Flutter-Nodejs-Auth/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Vitaee/Flutter-Nodejs-Auth" />
</a>
