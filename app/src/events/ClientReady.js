const { Events, Client } = require('discord.js');

/**
 * @param {Client} client
 */
module.exports = {
    name: Events.ClientReady,
    once: true,
    execute(client) {
        console.log(`Bot está pronto! Logado como ${client.user.tag}`);
    },
};