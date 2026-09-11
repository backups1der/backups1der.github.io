var splashPool = [
  'Written fresh from Neovim!',
  'Contents written by a 16-years-old Turkish random, and not sleeping until 3 AM',
  'Ananas duck!',
  '— ⇐ This is a human\'s em-dash',
  'Put ananas in Your Gananas and Janana [imagine a line break here] Wananas',
  'What a lame nickname, "anins1der". You like Microslop Insider that much?',
  'Uses Penguin OS',
  '[[Insert a quote here]]',
  'As seen on #websites!',
  'oooh, randomly picked quotes',
  'May contain JavaScript!',
  'Powered by StackOverfow, StackOverflow and more StackOverflow',
  'Also visit daudix.one',
  '/give reader website:content_to_read 64',
  'Ametrine-powered!',
  '...mei mei mei mei mei mei mei mei mei mei mei mei mei mei mei mei mei mei...',
  '...barabbuh... the rabbuh...',
  'GitHub (Pages) is up!',
  'Snug Nook!',
  '* participating in a glass eating party!',
  'https://localhost:1111',
  'Funny text goes here... wait a minute, I remember writing that to the footer-',
  'Add my 88x31 too!',
  'Çınar Çiftçi\'nin amk.',
  'Profesyonel Teremyağ boykotçusu',
  '...ok i kind of ran out of ideas. New quotes coming soon tho, wubba lubba dub duuuuubb!!',
];

// const splash = Math.floor(Math.random() * splashPool.length)      // picks an index number
const splash  = splashPool[~~(Math.random() * splashPool.length) | 0];      // picks an item from the array
document.getElementById("splash-text").textContent=splash;
