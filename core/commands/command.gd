class_name LCCommand
extends Resource

## Data structure representing a command instance.
## Inspired by XTCE, it contains a name, target, and arguments.

@export var name: String
@export var target_path: NodePath
@export var arguments: Dictionary = {}
@export var source: String = "local" # e.g., "local", "http", "console"

func _init(_name: String = "", _target_path: NodePath = ^"", _arguments: Dictionary = {}, _source: String = "local"):
	name = _name
	target_path = _target_path
	arguments = _arguments
	source = _source

static func from_dict(dict: Dictionary) -> LCCommand:
	var cmd = LCCommand.new()
	cmd.name = dict.get("name", "")
	# Ensure target_path is converted to string to handle numeric IDs
	var target = dict.get("target_path", "")
	cmd.target_path = NodePath(str(target))
	cmd.arguments = dict.get("arguments", {})
	cmd.source = dict.get("source", "remote")
	return cmd

func to_dict() -> Dictionary:
	return {
		"name": name,
		"target_path": str(target_path),
		"arguments": arguments,
		"source": source
	}
