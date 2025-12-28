const Dnevnik = require('dnevnik-mos-ru-api'); // Подключаем библиотеку Dnevnik

(async () => {
    try {
        // Создаем экземпляр аутентификатора с логином и паролем
        let auth = new Dnevnik.PuppeteerAuthenticator("", "", { headless: false });

        // Инициализируем аутентификатор
        await auth.init();

        // Проводим аутентификацию
        await auth.authenticate();

        // Создаем экземпляр клиента с аутентификатором
        let client = new Dnevnik.DnevnikClient(auth);

        // Пример работы с клиентом
        // Например, получение информации о пользователе
        let userInfo = await client.getUserInfo();
        console.log('User Info:', userInfo);

        // Закрываем аутентификатор


    } catch (error) {
        console.error('Error:', error);
    }
})();
