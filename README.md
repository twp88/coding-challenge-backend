[![Waffle.io - Columns and their card count](https://badge.waffle.io/twp88/coding-challenge-backend.svg?columns=all)](https://waffle.io/twp88/coding-challenge-backend)

# Badi Coding Challenge - Backend (Ruby on Rails)
![Zombies at Badi](https://user-images.githubusercontent.com/4199523/33260366-e54216aa-d35f-11e7-8442-8d9e1cd67d88.jpg)

## The context
Welcome Doctor to the api laboratory of Zombie Corp! The world leaders in providing remote zombie api solutions.

## Explanation

Once you have been afforded an access token, our unique laboratory will enable you to spawn and unspawn the undead at a moments notice. Furthermore you will be able to browse the catalogue and furnish your new Zombie kin with weapons and armor from our unique collection.

## Further project ideas

Here at Zombie Corp, we are aware of your unique world domination needs. This is why we are working towards a more deadly future by planning to incorporate such unique ideas as a human feeding tank, town invasion and automatic zombie feeding dispensaries which detect when your precious ones are hungry.

## How to use

To use our service, simply follow the instructions below.

To use all of the functions of your Api please use curl.
Please note that your token api is as follows; 6040ece072888247222026399db59165
Do not lose it!

The following are the correct requests that can be made for your project. We recommend using curl, but you can use other stuff as well (*cough*Postman*cough*)!

* To list all zombies;
`curl https://zombie-code-challenge.herokuapp.com/zombies/?access_token=<insert_access_token>`

* To list specific zombie; `https://zombie-code-challenge.herokuapp.com/zombies/<zombie_id>/?access_token=<insert_access_token>

* To create a zombie;
`curl -X POST --data '<attr=value>&<attr2=value2>&access_token=<insert_access_token>' https://zombie-code-challenge.herokuapp.com/zombies`

Please note that when creating a zombie, as a minimum you must provide a name for that zombie. If you do not
wish to concern yourself with the other attributes, our service will spawn this zombie with our default settings.

* To update a specific zombie;
`curl -X PUT --data 'id=<zombie_id>&<attr=new_value>&access_token=<insert_access_token>' https://zombie-code-challenge.herokuapp.com/update_zombie/`

* To delete a zombie (sad times);
`curl -X DELETE --data 'id=<zombie_id>&access_token=<insert_access_token>' https://zombie-code-challenge.herokuapp.com/delete_zombie/`

* To search;
`curl https://zombie-code-challenge.herokuapp.com/search/?q=<'search_terms'>&access_token=<insert_access_token>`

### Armory
Within our armory we have five different weapons to choose from. Be aware that zombies can only carry up to
four weapons at a time, and can never carry more than one of the same weapon. Our weapons;
  * Shotgun
  * Knife
  * Grenade
  * Chainsaw
  * Indiana Jones Whip

 * To add a zombie weapon to a zombie;
 `curl --data "id=<zombie_id>&weapon_name=<weapon_name>&access_token=<insert_access_token>" https://zombie-code-challenge.herokuapp.com/add_zombie_weapon`

 * To remove a zombie weapon;
 `curl -X DELETE -d "id=<zombie_id>&weapon_name=<weapon_name>&access_token=<insert_access_token>" https://zombie-code-challenge.herokuapp.com/delete_zombie_weapon`

 * To see a list of all weapons;
 `curl https://zombie-code-challenge.herokuapp.com/weapons/?access_token=<insert_access_token>`

 ### Wardrobe
Our wardrobe contains a range of protective armor for the discerning zombie to model. As with our weapons, a zombie
may only wear up to four items and never the same item more than once.
  * Shield
  * Helmet
  * Torso Armor
  * Leg Armor

* To add zombie armor;
`curl --data "id=<zombie_id>&armor_name=<armor_name>&access_token=<insert_access_token>” https://zombie-code-challenge.herokuapp.com/add_zombie_armor`

* To remove zombie armor;
`curl -X DELETE -d 'id=<zombie_id>&armor_name=<armor_name&access_token=<insert_access_token>’ https://zombie-code-challenge.herokuapp.com/delete_zombie_armor`

## Further comments
I had great fun making this project! I felt a little frustrated that I ran out time to completely implement all of my ideas. I'm also aware that this project is by no means perfect. There are a couple of issues that had I had more time, I would have addressed. They are as follows;

  * Refactoring the ParseZombieSearchResultsService. This service needs a great deal of refactoring, as does it's test (note that the test is skipped).

  * Improve the search feature. I used elasticsearch for this project, and it was the first time that i had used it with docker. This meant that it took a lot longer that I had originally expected for the feature to be implemented, and there are still some parts of the search that I would like to improve.

  * Improve the test coverage.

  * Please be aware that the weapons are not searchable. This is because of the limits placed on the number of    indicies that could be hosted on heroku (2, currently used by zombies and armor). Instead, I have made the index action in the weapon controller available.

  * When searching for a zombie, all of the associated weapons and armor are listed with each result.

### Using the project locally
As requested, I have used docker for this project. Use  `docker-compose up -d && docker-compose logs -f` to run it. The indicies for elasticsearch will then be needed to be set up. From the rails console, run `ModelName.__elasticsearch__.create_index! force: true` for each model (zombie and armor). Following this you should then run `ModelName.import`.

### Ideas for the future
As mentioned, there were ideas that I would have like to have implemented. I had been working on the idea of adding people and towns, which would serve as a source of food for the zombies once their hunger increased (which would depend on the last time that had eaten).
To do this I was going to implement a cron job which would run a service, potentially using sidekiq to make the zombie hungrier for each day that passed.

Please feel free to ask me questions relating to my technical decisions.
