+++
title = "About this idiot"
description = "How does this idiot cant stop being an stupid ass? We don't have the answer, though we do have a way to send notifications directly to him."
generate_feeds = true

[extra]
no_header = true
+++

# Hi, my name's <span class="rainbow">anins1der</span>
I am a 16 years old idiot who "codes", draws and writes 24/7 {{ sticker(path="/emoji/trolley.png", name="trolley") }}

## Huge thanks to
→ [Daudix](https://daudix.one) for [this theme](https://ametrine.daudix.one).
Seriously, check out his blog, it's awesome! <small>(and --uh-- he has stuff to
read that doesn't suck, unlike mine :D)</small>

→ [Mambuco](https://mambuco.dev#down) for being a cool guy and (indirectly)
helping me with this blog (by his repository being on github, and _uh_ also for
being a cool guy in general lol)

→
[(...and other) <span class="snug">Snug Nook</span> (members)](https://snugnook.org)
for being a such big mental help that I could stand on. I know, I didnt really
talk about my mental wellbeing being shit there but hey, THESE PEOPLE ARE
<span class="rainbow">**COOL**</span> XD

→ [Sparrow99tr_](https://sparrow99.me/) for being a nice guy and approving
everything in place of my nonexistent brain. _And (uhh)_ he's one of the
"_medium content creators_", I'd like to one-up this and making him one of the
"_XL-sized content creators_" by
[subscribing to his YouTube channel](https://youtube.com/@sparrow99_?sub_confirmation=1)
<small>([no, I did not get paid for this](silahzoru.png). Cmon, now sub to
him-)</small>

→ My friend who suggested the name for this blog (you don't exist actually, it
was me all along. Guess _multi-person disorder_ really is a thing, huh?)

## Send me a message:
Oh if you wanna say anything about me then you can just <abbr title="Script stolen from https://azumanga.gay btw">type it below</abbr>

> ~~Oooh my bad, I forgot to mention that my Dokploy installation (*somehow*) *nuked* itself a few months ago; so these will be disabled until I get `ntfy` back up and running. Sorry not sorry {{ sticker(path="/emoji/dowg.png", name=":dowg:") }}~~  
> Guess what, I got this thingy up again (lol)

<!-- <input disabled class="ntfy-msg" id="ntfy-msg" placeholder="Ananas yo' ducks so that I will be free to eat glass."> -->

<div class="ntfy-er">
  <div class="msgbar">
    <input class="ntfy-msg" id="ntfy-msg" placeholder="Send a notification that directly comes to my laptop!">
    <button class="submit" onclick="javascript:sendNotification()">funny bnuuy</button>
  </div>
</div>

<script>
  // stolen from azumanga.gay lel

  // stolen ntfy script
  function send(message) {
    let r = new XMLHttpRequest()
    r.open("POST", "https://ntfy.anins1der.com/website", true)
    r.setRequestHeader("Content-Type", "text/plain")
    r.send(message)
  }
  // send notification
  let ntfyInput = document.getElementById("ntfy-msg")
  function sendNotification() {
    if (ntfyInput.value.length <= 0) return
    send(ntfyInput.value)
    ntfyInput.value = ""
  }
</script>

<figcaption>Psst hey, you can check what others have sent to me <a href="https://ntfy.anins1der.com/website">right here</a>!</figcaption>
<span class=spoiler><figcaption>...oh and also, <a href="https://daudix.one/home/g.mp4">g</a>-</figcaption></span>