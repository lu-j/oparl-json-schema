# -*- encoding: utf-8 -*-

import json
import os
import sys
import codecs
import collections
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("schema_folder")
parser.add_argument("examples_folder")
args = parser.parse_args()

SCHEMA_FOLDER = args.schema_folder
EXAMPLES_FOLDER = args.examples_folder

objects = ["System", "Body", "Organization", "Person", "Meeting", "AgendaItem", "Paper", "File", "Consultation", "Location", "Membership", "LegislativeTerm"]

sys.stdout = codecs.getwriter('utf8')(sys.stdout)
sys.stderr = codecs.getwriter('utf8')(sys.stderr)

def dump_json_examples(name):
    pass

def generate_markdown_table(obj):
    name = obj["title"]

    returnval = "## " + name + "\n"
    propspace = 26
    typespace = 18
    descspace = 80

    if "description" in obj:
        returnval += obj["description"] + "\n"
    returnval += "\n"
    returnval += "-"*(propspace+typespace+descspace) + "\n"
    returnval += "Name" + " "*(propspace-4) + "Typ" + " "*(typespace-3) + "Beschreibung" +" "*(descspace-12) + "\n"

    returnval += "-"*(propspace-1) + " " + "-"*(typespace-1)+ " " + "-"*(descspace) + "\n"
    for prop in obj["properties"]:
        if prop in ["id", "type", "body", "created", "modified", "keyword"]:
            continue
        prop_whitespace = propspace - len(prop)
        type = (obj["properties"][prop]["type"])
        if isinstance(type,list):
            type = "/".join(type)
        type_whitespace = typespace - len(type)
        if "description" in obj["properties"][prop]:
            returnval += "`"+ prop + "`" + prop_whitespace* u" " + type + type_whitespace*u" " + obj["properties"][prop]["description"] + "\n"
            returnval += "\n"

    returnval += "-"*(propspace+typespace+descspace) + "\n"
    returnval += "\n"
    returnval += "**Beispiel**\n\n\n"
    filepath = os.path.join(EXAMPLES_FOLDER, name + ".json")
    example = (json.load(codecs.open(filepath, encoding='utf-8'),object_pairs_hook=collections.OrderedDict))
    returnval += "~~~~ {.json}\n"
    returnval += json.dumps(example, ensure_ascii=False, indent=4) + "\n"
    returnval += "~~~~\n\n"
    returnval += "\pagebreak\n"
    returnval += "\n"
    return returnval


for obj in objects:
    filepath = os.path.join(SCHEMA_FOLDER, obj + ".json")
    print generate_markdown_table((json.load(codecs.open(filepath, encoding='utf-8'),object_pairs_hook=collections.OrderedDict)))

