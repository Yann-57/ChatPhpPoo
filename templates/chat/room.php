<?php $this->title = $currentRoom->name()?>
<div class="chat">
    <div class="chat__rooms">
        <h2>Salons</h2>
        <?php foreach($rooms as $_ => $room) : ?>
            <div class="chat__rooms--card"><a href="/room/<?= $room->id() ?>"><?= $room->name()?></a></div>
        <?php endforeach ; ?>
        <button class="button btn--createRoom">Créer un salon</button> 
        <div class="overlay d-none"></div>
        <form class="d-none modal--createRoom" method="post" action="/chat/newRoom">
            <button class="closeCreateRoom" type="button">&times;</button>
            <h2 class="form__title">Créer un salon</h2>
            <input class='form__input' type="text" placeholder="Nom du Salon" required name="roomName">
            <button class="button btn--newRoom" type="submit" value="newRoom">Créer</button>
        </form>
        
    </div>
    <div class="chat__wall">
    <?php if(!empty($messages)){
        foreach($messages as $key => $message): ?>
            <div class="message">
                <img class="avatar" src="<?= $message->avatar()?>" alt="avatar de <?= $message->username()?>">
                <h2 class="username"><?= ucfirst($message->username())?></h2>
                <span class='date'><?= $message->date_posted()?></span>
                <p class="content"><?= $message->content()?></p>
            </div>
    <?php endforeach; } ?>
    </div>
    <div class="chat__form">
        <form action="/chat/send/<?= $currentRoom->id() ?>" method="post">
            <h3>Ecrivez votre message</h3>
            <textarea class="chat--input" type="text" name="send[content]"></textarea>
            <button class="button send--btn "type="submit">Envoyer</button>
        </form>
        <a class="button refresh--btn" href="/chat/room/<?= $currentRoom->id()  ?>">Actualiser</a>
    </div>  
</div>
