using Godot;
using System;

// Reminder: to use this script I need it attached, then build in the editor

public partial class input : Node
{
	int x;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		/*switch (x){
			case Input.GetJoyName(0):
				GD.Print(Input.GetJoyGuid(0));
				break;
		}*/
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{

	}
}
