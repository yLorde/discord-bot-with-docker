const token = process.env.DISCORD_TOKEN;
const databaseUrl = process.env.DATABASE_URL;

(function () {
    console.log('Iniciando o bot...');

    console.log(`Token: ${token}`);
    console.log(`Database URL: ${databaseUrl}`);

    let i = 0;
    setInterval(() => {
        i = i + 1;
        console.log(`Segundos: ${i}`);
    }, 1000);
})()