oparl:AgendaItem (Tagesordnungspunkt)  {#oparl_agendaitem}
-------------------------------------

Tagesordnungspunkte sind die Bestandteile von Sitzungen (`oparl:Meeting`).
Jeder Tagesordnungspunkt widmet sich inhaltlich einem bestimmten Thema,
wozu in der Regel auch die Beratung bestimmter Drucksachen gehört.

Die Beziehung zwischen einem Tagesordnungspunkt und einer Drucksache wird
über ein Objekt vom Typ `oparl:Consultation` hergestellt, das über die 
Eigenschaft `consultation` referenziert werden kann.

**Beispiel**

~~~~~  {#agendaitem_ex1 .json}
{
    "id": "https://oparl.example.org/agendaitem/3271",
    "type": "http://oparl.org/schema/1.0/AgendaItem",
    "meeting": "https://oparl.example.org/meeting/281",
    "number": "10.1",
    "name": "Satzungsänderung für Ausschreibungen",
    "public": true,
    "consultation": "https://oparl.example.org/consultation/1034",
    "result": "Geändert beschlossen",
    "resolution": "Der Beschluss weicht wie folgt vom Antrag ab: ...",
    "modified": "2012-08-16T14:05:27+02:00"
}
~~~~~

### Eigenschaften ###

`meeting`
Sitzung, der der Tagesordnungspunkt zugeordnet ist.

`number`
Gliederungs-"Nummer" des Tagesordnungspunktes. Eine beliebige Zeichenkette, wie z. B. "10.", "10.1", "C", "c)" o. ä. Die Reihenfolge wird nicht dadurch, sondern durch die Reihenfolge der TOPs im `agendaItem`-Attribut von `oparl:Meeting` festgelegt. 
`name`
Das Thema des Tagesordnungspunktes.

`public`
Kennzeichnet, ob der Tagesordnungspunkt zur Behandlung in öffentlicher Sitzung vorgesehen ist/war. Es wird ein Wahrheitswert (`true` oder `false`) erwartet. 
`consultation`
Beratung, die diesem Tagesordnungspunkt zugewiesen ist.

`result`
Kategorische Information darüber, welches Ergebnis die Beratung des Tagesordnungspunktes erbracht hat, in der Bedeutung etwa "Unverändert beschlossen" oder "Geändert beschlossen". Diese Eigenschaft  funktioniert wie in [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung) beschrieben entweder als URL zu einem `skos:Concept` oder als String. 

Falls in diesem Tagesordnungspunkt ein Beschluss gefasst wurde, kann hier ein Text oder eine Datei angegeben werden. Das ist besonders dann in der Praxis relevant, wenn der gefasste Beschluss (z. B. durch Änderungsantrag) von der Beschlussvorlage abweicht. 
`auxiliaryFile`
Dateianhänge zum Tagesordnungspunkt.

`keyword`
:   Schlagworte.
    Typ: Array von Strings oder URLs zu `skos:Concept` Objekten
    (vgl. [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung)).
    Kardinalität: 0 bis *.
    OPTIONAL.

`created`
:   Erzeugungsdatum und -zeit des Objekts.
    Typ: `xsd:dateTime`.
    Kardinalität: 0 bis 1.
    EMPFOHLEN.

`modified`
:   Datum und Uhrzeit der letzten Änderung.
    Typ: `xsd:dateTime`.
    Kardinalität: 0 bis 1.
    EMPFOHLEN.
