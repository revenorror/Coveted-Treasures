Scriptname rev_CTnotebottle_SC extends ObjectReference  
 
Actor Property PlayerREF Auto
Message Property OptionsMESG Auto
 
MiscObject property bottleFull auto
FormList  property recorkLST  auto

Event OnEquipped(Actor akActor)
	If akActor == PlayerREF ; Only the player can open the menu
		; Debug.Notification("We were equipped by the player!")
		Menu()
	EndIf
EndEvent
 
Function Menu() ; The menu will exit on its own after a selection is made.
	Int aiButton = OptionsMESG.Show() ; Shows your menu.
	If aiButton == 0  ; Uncork bottle
		PlayerREf.RemoveItem(bottleFull, 1, true)
		PlayerREF.Additem(recorkLST, 1)
	ElseIf aiButton == 1 ; Recork bottle
		PlayerREF.RemoveItem(recorkLST, 1)
		PlayerREF.AddItem(bottleFull, 1)
	ElseIf aiButton == 2 ; Do nothing
		Debug.Notification("You do nothing with the bottle")
	EndIf
EndFunction
