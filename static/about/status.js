async function getData(discord_id) {
  const api = `https://api.lanyard.rest/v1/users/${discord_id}`;

  try {
    const response = await fetch(api);
    if (!response.ok) {
      throw new Error(`Could not fetch Discord status from Lanyard: ${response.status}`);
    }

    const result = response.json();
    return result.data;
  }

  catch (error) {
    console.error(error.message);
  }
}

const data = getData('1192908168326549564');

async function getData(discord_id) {
  const api = `https://api.lanyard.rest/v1/users/${discord_id}`;

  try {
    const response = await fetch(api);

    if (!response.ok) {
      throw new Error(
        `Could not fetch Discord status from Lanyard: ${response.status}`
      );
    }

    const result = await response.json();
    return result.data;

  }
    catch (error) {
      console.error(error.message);
    return null;
  }
}

async function main() {
  const data = await getData("1192908168326549564");

  console.log(data);
  console.log(data.discord_status);
  console.log(data.discord_user.username);
  console.log(data.activities);
}

main();
