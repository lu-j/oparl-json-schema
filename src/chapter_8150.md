oparl:LegislativeTerm (Wahlperiode) {#oparl_legislative_term}
-----------------------------------

Dieser Objekttyp dient der Beschreibung einer Wahlperiode.

**Beispiel**

~~~~~  {#legislative_term_ex1 .json}
{
    "id": "https://oparl.example.org/term/21",
    "type": "http://oparl.org/schema/1.0/LegislativeTerm",
    "body": "https://oparl.example.org/body/0",
    "name": "21. Wahlperiode",
    "startDate": "2010-12-03",
    "endDate":  "2013-12-03"
}
~~~~~

### Eigenschaften

`body`
:   Die Körperschaft, der diese Wahlperiode zugeordnet ist. 
    Typ: URL des `oparl:Body` Objekts.
    Kardinalität: 1.
    ZWINGEND.

`name`
:   Nutzerfreundliche Bezeichnung der Wahlperiode.
    Typ: `xsd:string`.
    Kardinalität: 1.
    ZWINGEND.

`startDate`
:   Der erste Tag der Wahlperiode.
    Typ: `xsd:date`.
    Kardinalität: 0 bis 1.
    EMPFOHLEN.

`endDate`
:   Der letzte Tag der Wahlperiode.
    Typ: `xsd:date`.
    Kardinalität: 0 bis 1.
    EMPFOHLEN.

