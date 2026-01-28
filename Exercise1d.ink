VAR health = 5
VAR pet_name = ""
VAR coin = 0
VAR money = 0
VAR time = -1 // 0 Morning, 1 Noon, 2 Night

 -> memory
 
== memory == 
You are about to get on a boat that will take you to god knows where. Its daunting, and honestly? You wish you had brought you friend with you. His name is...

* [Chris] 
    ~ pet_name = "Chris"
    -> Chris
* [Evan]
    ~ pet_name = "Evan"
     -> Evan
* [AJ]
    ~ pet_name = "AJ"
     -> AJ

== Chris ==
While on the boat, you think about your friend Chris. He was a silly guy, but he was always there when you needed him. Through the dark time all the way to the light ones, he's like a brother to you and as good as a friend can get. Why didn't you tell him about this?
*[You arrive at the island] -> Bar_Entrance

== Evan == 
While on the boat, you think about your friend Evan. You had known him practically your whole life, he's like a brother to you. Hell, you'd known him just about as long as your own brother. He probably would have enjoyed this too. You should have told him about this.
 *[You arrive at the island] -> Bar_Entrance
 
 == AJ ==
 While on the Boat, you think of your friend AJ. AJ was a strange fellow, not talking very much, but you knew you could rely on him for anything. Ask and he'd be there. Plus, you've known him forever, and you knew that he could have used an adventure. You probably should have told him about this.
 *[You arrive at the island] -> Bar_Entrance

== Bar_Entrance ==
You find yourself at the entrance to a bar, near the port of a town on a man made island made of wood, bamboo, and other materials making up the stilts and buildings here.

It is { advance_time() }

If only {pet_name} were there with you. He would have made you feel less nervous.

{not Coin_Pickup: You see a coin on the ground.}

+ [Open the door and walk into the bar] -> inside_The_Bar
+ [You turn around and walk away] -> Leave_Island
* [You pick up the coin] -> Coin_Pickup
+ [Wait] -> Bar_Entrance

== Leave_Island ==
You find yourself at the port of the rickety island, looking at an outgoing boat
* [Take the boat] -> Take_The_Boat
+ [Go back] -> Bar_Entrance

== inside_The_Bar ==
You see several men sitting at a table, playing what seems to be a gambling game. You Can sit down and join them. {not At_The_Table: Or you can leave.} If you leave they will not let you back at the table.

It is { advance_time() }

{ pet_name == "AJ": Strangely, you feel like you saw AJ somewhere in here. You pay no mind to thought. Although it would make some sense if he was, as AJ always had a way of showing up in strange places| }

+ [Leave] -> Bar_Entrance
* [Sit down at the Table] -> At_The_Table
 * { time == 1 } [Grab a beer at the bar] -> grab_a_beer
-> END

=== At_The_Table ===
You sit down at the table
* {inside_The_Bar} [Stand Up] -> inside_The_Bar
+ [Look to your left] -> Look_To_Left
+ [Look to your Right] -> Look_To_Right
* {coin > 0} [Pull out your coin] -> Table_Stares

=== Look_To_Right ===
~ money = money + 3
You see a kind man with an eyepatch that has the four suits of a card deck embroidered onto it. He smiles at you and asks if you could take over for him as he was just about to leave. You do, and he leaves you with several chips worth thousands of dollars, and a winning hand. That night you go on to win every round and bankrupt several unruly figures. You walk away from that night richer than any man has ever been.

you now have ${money},141,592,653,589,793,238,462,643,383,279,502,884,197.69
-> END

=== Look_To_Left
You look to your left and see a man constantly flipping a coin. He doesn't like the way you look at him so he kills you with is coin.
-> END

=== Take_The_Boat ===
You took the boat and left the island behind
-> Took_The_Boat

=== Table_Stares ===
Everyone turns and looks at you, or rather the coin. Light is bouncing off of it from all directions, and it almost looks like its glowing. This is definately your "Lucky Coin".
-> END

=== Coin_Pickup ===
~ coin = coin + 1
You crouch down and pick up the coin. Maybe it'll be lucky.
+ [Stand Up] -> Bar_Entrance

== lay_down_on_bed ==
You lay down on the bed, and fall asleep.
+ [You begin  to dream that...] -> Bar_Entrance

== Call_Friend == 
You call your friend {pet_name} and tell them about where you had gone.
* [You tell them that...] -> Bar_Entrance

== grab_a_beer ==
You order an ice cold beer from the bartender, and he obliges. He polishes off a fresh glass, fills it to the brim with a beverage you've never heard of, and hands it to you.
-> inside_The_Bar

=== Took_The_Boat ===
You took the boat away from the island, and its along journey but you finally make it back. As you arrive back at your apartment, you look around at the familar sight of your TV, your small kitchen, and your bed in the corner, and begin to feel a sense that you had missed out on something incredible.
+ [Lay down on the bed] -> lay_down_on_bed
+ [Call your friend] -> Call_Friend
-> END

== function advance_time ==

    ~ time = time + 1

    {
        - time > 2:
            ~ time = 0
    }
    
    {
        - time == 0:
            ~ return "Morning"
        
        - time == 1:
            ~ return "Noon"
        
        - time == 2:
            ~ return "Evening"
    
    }
    
    
        
    ~ return time
    
    
