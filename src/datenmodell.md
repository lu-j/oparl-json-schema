## System
Der Objekttyp `oparl:System` bildet grundlegende Informationen zum parlamentarischen Informationssystem ab. Das Objekt repräsentiert das technische System, unabhängig von der Frage, welche Körperschaften auf diesem System vertreten sind.

Auf jedem OParl-Server MUSS ein Objekt vom Typ `oparl:System` vorgehalten werden. Es DARF nur ein einziges solches Objekt je Server existieren.

Für Clients ist das `oparl:System` Objekt ein geeigneter Einstiegspunkt, um grundlegende Informationen über das System zu bekommen und die URLs zum Zugriff auf andere Informationen in Erfahrung zu bringen.

Die URL des `oparl:System`-Objekts MUSS per Definition identisch mit der URL des API-Endpunkts des Servers sein.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`oparlVersion`              string            Die URL der OParl-Spezifikation, die von diesem Server unterstützt wird. Aktuell kommt hier nur ein Wert in Frage. Mit zukünftigen OParl-Versionen kommen weitere mögliche URLs hinzu.

`bodies`                    array             Liste der Körperschaften (`oparl:Body`-Objekte), die auf dem System existieren.

`name`                      string            Nutzerfreundlicher Name für das System, mit dessen Hilfe Nutzerinnen und Nutzer das System erkennen und von anderen unterscheiden können.

`contactEmail`              string            E-Mail-Adresse für Anfragen zur OParl-API. Die Angabe einer E-Mail-Adresse dient sowohl NutzerInnen wie auch Entwicklerinnen von Clients zur Kontaktaufnahme mit dem Betreiber.

`contactName`               string            Name der Ansprechpartnerin bzw. des Ansprechpartners oder der Abteilung, die über die in `contactEmail` angegebene Adresse erreicht werden kann.

`website`                   string            URL der Website des parlamentarischen Informationssystems

`vendor`                    string            URL der Website des Software-Anbieters, von dem die OParl-Server-Software stammt.

`product`                   string            URL zu Informationen über die auf dem System genutzte OParl-Server-Software

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/", 
    "type": "http://oparl.org/schema/1.0/System", 
    "oparlVersion": "http://oparl.org/specs/1.0/", 
    "body": "https://oparl.example.org/bodies/", 
    "name": "Beispiel-System", 
    "contactEmail": "mailto:info@example.org", 
    "contactName": "Allgemeiner OParl Kontakt", 
    "newObjects": "https://oparl.example.org/new_objects/", 
    "updatedObjects": "https://oparl.example.org/updated_objects/", 
    "removedObjects": "https://oparl.example.org/removed_objects", 
    "website": "http://www.example.org/", 
    "vendor": "http://example-software.com/", 
    "product": "http://example-software.com/oparl-server/"
}
~~~~

\pagebreak


## Body
Der Objekttyp `oparl:Body` dient dazu, eine Körperschaft und damit ein Parlament zu repräsentieren, zu dem der Server Informationen bereithält. Eine Körperschaft kann beispielsweise eine Gemeinde, ein Landkreis oder  ein kommunaler Zweckverband sein.

 Hätte das System beispielsweise den Zweck, Informationen über das kommunale Parlament der Stadt Köln, namentlich den Rat der Stadt Köln, abzubilden, dann müsste dieses System dazu ein Objekt vom Typ `oparl:Body` führen, welches die Stadt Köln repräsentiert.

Vom OParl-Server wird erwartet, dass er mindestens ein Objekt vom Typ `oparl:Body` bereithält. Teilen sich mehrere Körperschaften dasselbe technische System, können auf demselben Server auch mehrere Objekte vom Typ `oparl:Body` beherbergt werden.

Über die Zuordnung zu einem bestimmten `oparl:Body`-Objekt zeigen andere Objekte, wie beispielsweise Gremien oder Drucksachen, ihre Zugehörigkeit zu einer bestimmten Körperschaft und damit implizit zu einem bestimmten Parlament an.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`system`                    string            System, zu dem dieses Objekt gehört.

`shortName`                 string            Kurzer Name der Körperschaft.

`name`                      string            Der offizielle lange Name der Körperschaft.

`website`                   string            Allgemeine Website der Körperschaft.

`license`                   string            Lizenz, die für die Daten, die über diese API abgerufen werden können, gilt, sofern nicht am einzelnen Objekt anders angegeben. Siehe dazu auch die übergreifende Beschreibung zur Eigenschaft [`license`](#eigenschaft_license).

`licenseValidSince`         string            Zeitpunkt, seit dem die unter `license` angegebene Lizenz gilt. Vorsicht bei Änderungen der Lizenz die zu restriktiveren Bedingungen führen.

`rgs`                       string            Regionalschlüssel der Körperschaft als zwölfstellige Zeichenkette^[Regionalschlüssel können im [Gemeindeverzeichnis (GV-ISys) des Statistischen Bundesamtes](https://www.destatis.de/DE/ZahlenFakten/LaenderRegionen/Regionales/Gemeindeverzeichnis/Gemeindeverzeichnis.html) eingesehen werden].

`equivalentBody`            array             Dient der Angabe beliebig vieler zusätzlicher URLs, die dieselbe Körperschaft repräsentieren. Hier können beispielsweise, sofern vorhanden, der entsprechende Eintrag der Gemeinsamen Normdatei der Deutschen Nationalbibliothek^[Gemeinsame Normdatei <http://www.dnb.de/gnd>] oder der DBPedia^[DBPedia <http://www.dbpedia.org/>] oder der Wikipedia^[Wikipedia <http://de.wikipedia.org/>] angegeben werden.

`contactEmail`              string            Dient der Angabe einer Kontakt-E-Mail-Adresse mit "mailto:"-Schema. Die Adresse soll die Kontaktaufnahme zu einer für die Körperschaft und idealerweise das parlamentarische Informationssystem zuständigen Stelle ermöglichen. 

`contactName`               string            Name oder Bezeichnung der mit `contactEmail` erreichbaren Stelle.

`paper`                     array             Drucksachen unter dieser Körperschaft. Vgl. [Objektlisten](#objektlisten).

`member`                    array             Personen in dieser Körperschaft. Vgl. [Objektlisten](#objektlisten).

`meeting`                   array             Sitzungen dieser Körperschaft. Vgl. [Objektlisten](#objektlisten).

`organization`              array             Gruppierungen in dieser Körperschaft. Vgl. [Objektlisten](#objektlisten).

`legislativeTerm`           array             Wahlperioden in dieser Körperschaft. Vgl. [Objektlisten](#objektlisten).

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/body/0", 
    "type": "http://oparl.org/schema/1.0/Body", 
    "system": "https://oparl.example.org/", 
    "contactEmail": "mailto:ris@beispielstadt.de", 
    "contactName": "RIS-Betreuung", 
    "rgs": "053150000000", 
    "equivalentBody": [
        "http://d-nb.info/gnd/2015732-0", 
        "http://dbpedia.org/resource/Cologne"
    ], 
    "shortName": "Köln", 
    "name": "Stadt Köln, kreisfreie Stadt", 
    "website": "http://www.beispielstadt.de/", 
    "license": "http://creativecommons.org/licenses/by/4.0/", 
    "licenseValidSince": "2014-01-01", 
    "organization": "https://oparl.example.org/body/0/organizations/", 
    "meeting": "https://oparl.example.org/body/0/meetings/", 
    "paper": "https://oparl.example.org/body/0/papers/", 
    "member": "https://oparl.example.org/body/0/people/", 
    "legislativeTerm": [
        "https://oparl.example.org/body/0/terms/1", 
        "https://oparl.example.org/body/0/terms/2"
    ], 
    "classification": "Kreisfreie Stadt", 
    "created": "2014-01-08T14:28:31.568+0100", 
    "modified": "2014-01-08T14:28:31.568+0100"
}
~~~~

\pagebreak


## Organization
Dieser Objekttyp dient dazu, Gruppierungen von Personen abzubilden, die in der parlamentarischen Arbeit eine Rolle spielen. Dazu zählen in der Praxis insbesondere Fraktionen und Gremien.^[Ein Teil der Eigenschaften ist der "Organization" Ontologie (kurz: `org:Organization`) des W3C entnommen. Quelle: The Organization Ontology, W3C Recommendation 16 January 2014, <http://www.w3.org/TR/vocab-org/>. Deren Bezeichnungen wurden deshalb beibehalten. Das betrifft z.B. die Verwendung von `classification`.]

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`name`                      string            Offizielle (lange) Form des Namens der Gruppierung.

`membership`                array             Mitgliedschaften dieser Gruppierung.

`meeting`                   array             Sitzungen dieser Gruppierung. Invers zur Eigenschaft `organization` der Klasse `oparl:Meeting`. Da die Anzahl der Sitzungen stetig wachsen kann, wird EMPFOHLEN, die Liste über eine eigene URL verfügbar zu machen und damit Paginierung sowie die Filterung mittels startDate und endDate Parametern zu ermöglichen. Siehe dazu auch [Objektlisten](#objektlisten).

`shortName`                 string            Der Name der Gruppierung als Kurzform.

`post`                      array             Positionen, die für diese Gruppierung vorgesehen sind. Die Werte dieser Eigenschaft funktioniert wie in [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung) beschrieben entweder als URL zu einem `skos:Concept` oder als String. Die Strings bzw. `prefLabel`-Eigenschaften der Objekte SOLLEN sowohl die männliche als auch die weibliche Form enthalten, und zwar in dem Muster "männliche Form | weibliche Form" (genau in der Reihenfolge mit einem Leerzeichen vor und nach dem "|"). Wenn sich beide Formen nicht unterscheiden, dann DARF die Form nur einmal verwendet werden: "Mitglied" und nicht "Mitglied | Mitglied". Weitere Beispiele: "Vorsitzender | Vorsitzende", "1. Stellvertreter | 1. Stellvertreterin", "2. Stellvertreter | 2. Stellvertreterin", "Schriftführer | Schriftführerin", "Stellvertretender Schriftführer | Stellvertretende Schriftführerin

`subOrganizationOf`         string            Ggf. URL der übergeordneten Gruppierung.

`classification`            string            Die Art der Gruppierung. In Frage kommen z.B. "Rat", "Hauptausschuss", "Ausschuss", "Beirat", "Projektbeirat", "Kommission", "AG", "Verwaltungsrat". Die Angabe soll möglichst präzise erfolgen. Vgl. [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung).

`startDate`                 string            Gründungsdatum der Gruppierung. Kann z. B. das Datum der konstituierenden Sitzung sein.

`endDate`                   string            Datum des letzten Tages der Existenz der Gruppierung.

`website`                   string            Allgemeine Website der Gruppierung.

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/organization/34", 
    "type": "http://oparl.org/schema/1.0/Organization", 
    "body": "https://oparl.example.org/bodies/1", 
    "name": "Ausschuss für Haushalt und Finanzen", 
    "shortName": "Finanzausschuss", 
    "post": [
        "Vorsitzender | Vorsitzende", 
        "1. Stellvertreter | 1. Stellvertreterin", 
        "Mitglied"
    ], 
    "meeting": "https://oparl.example.org/meetings_for_org/34", 
    "membership": [
        "https://oparl.example.org/memberships/27", 
        "https://oparl.example.org/memberships/48", 
        "https://oparl.example.org/memberships/57"
    ], 
    "classification": "Ausschuss", 
    "keyword": [
        "finanzen", 
        "haushalt"
    ], 
    "created": "2012-07-16T16:01:44+02:00", 
    "startDate": "2012-07-17T00:00:00+02:00", 
    "modified": "2012-08-16T14:05:27+02:00"
}
~~~~

\pagebreak


## Person
Jede natürliche Person, die in der parlamentarischen Arbeit tätig und insbesondere Mitglied in einer Gruppierung ([oparl:Organization](#oparl_organization)) ist, wird mit einem Objekt vom Typ `oparl:Person` abgebildet.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`name`                      string            Der vollständige Name der Person mit akademischem Grad und dem gebräuchlichen Vornamen, wie er zur Anzeige durch den Client genutzt werden kann.

`familyName`                string            Familienname bzw. Nachname.

`givenName`                 string            Vorname bzw. Taufname.

`formOfAddress`             string            Anrede. Diese Eigenschaft funktioniert wie in [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung) beschrieben entweder als URL zu einem `skos:Concept` oder als String. Der String bzw. `prefLabel` SOLL sowohl die männliche als auch die weibliche Bezeichnung enthalten. Beispiele: "Herr | Frau", "Ratsherr | Ratsfrau".

`title`                     array             Akademische(r) Titel. Vgl. [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung).

`gender`                    string            Geschlecht. Empfohlene Werte sind `female`, `male`, `none` und `other`. Für den Fall, dass das Geschlecht der Person unbekannt ist, SOLL die Eigenschaft nicht ausgegeben werden. Vgl. [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung).

`phone`                     string            Telefonnummer der Person mit `tel:` Schema, ohne Leerzeichen.

`email`                     string            E-Mail-Adresse mit `mailto:` Schema.

`streetAddress`             string            Straße und Hausnummer der Kontakt-Anschrift der Person.

`postalCode`                string            Postleitzahl der Kontakt-Anschrift der Person.

`locality`                  string            Ortsangabe der Kontakt-Anschrift der Person.

`status`                    array             Status. Diese Eigenschaft funktioniert wie in [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung) beschrieben entweder als URL zu einem `skos:Concept` oder als String. Die Strings bzw. `prefLabel` SOLLEN sowohl die männliche als auch die weibliche Form enthalten, und zwar in dem Muster "männliche Form | weibliche Form" (genau in der Reihenfolge mit einem Leerzeichen vor und nach dem "|"). Wenn sich beide Formen nicht unterscheiden, dann DARF die Form nur einmal verwendet werden: "Ratsmitglied" und nicht "Ratsmitglied | Ratsmitglied". Dadurch kann auch solche Software einen sinnvollen Text anzeigen, die keine Fall-Unterscheidung nach Geschlecht der Personen vornimmt. Weitere Beispiele: "Bürgermeister | Bürgermeisterin", "Bezirksbürgermeister | Bezirksbürgermeisterin", "Stadtverordneter | Stadtverordnete", "Bezirksverordneter | Bezirksverordnete", "Sachkundiger Bürger | Sachkundige Bürgerin", "Einzelstadtverordneter | Einzelstadtverordnete" (Mitglieder des Rates die keiner Fraktion/Organisation angehören). Vgl. [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung).

`membership`                array             Mitgliedschaften der Person in Gruppierungen, z. B. Gremien und Fraktionen.

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/person/29", 
    "type": "http://oparl.org/schema/1.0/Person", 
    "body": "https://oparl.example.org/body/0", 
    "name": "Prof. Dr. Max Mustermann", 
    "familyName": "Mustermann", 
    "givenName": "Max", 
    "title": [
        "Prof.", 
        "Dr."
    ], 
    "formOfAddress": "Ratsherr | Ratsfrau", 
    "gender": "male", 
    "email": "mailto:max@mustermann.de", 
    "phone": "tel:+493012345678", 
    "streetAddress": "Musterstraße 5", 
    "postalCode": "11111", 
    "locality": "Musterort", 
    "status": "Bezirksbürgermeister | Bezirksbürgermeisterin", 
    "membership": [
        "https://oparl.example.org/membership/11", 
        "https://oparl.example.org/membership/34"
    ], 
    "created": "2011-11-11T11:11:00+01:00", 
    "modified": "2012-08-16T14:05:27+02:00"
}
~~~~

\pagebreak


## Meeting
Eine Sitzung ist die Versammlung einer oder mehrerer Gruppierungen (oparl:Organization) zu einem bestimmten Zeitpunkt an einem bestimmten Ort.

Die geladenen Teilnehmer der Sitzung sind jeweils als Objekte vom Typ oparl:Person in entsprechender Form referenziert. Verschiedene Dateien (Einladung, Ergebnis- und Wortprotokoll, sonstige Anlagen) können referenziert werden.

Die Inhalte einer Sitzung werden durch Tagesordnungspunkte (oparl:AgendaItem) abgebildet.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`name`                      string            

`start`                     string            Datum und Uhrzeit des Anfangszeitpunkts der Sitzung. Bei einer zukünftigen Sitzung ist dies der geplante Zeitpunkt, bei einer stattgefundenen KANN es der tatsächliche Startzeitpunkt sein.

`end`                       string            Endzeitpunkt der Sitzung als Datum/Uhrzeit. Bei einer zukünftigen Sitzung ist dies der geplante Zeitpunkt, bei einer stattgefundenen KANN es der tatsächliche Endzeitpunkt sein.

`streetAddress`             string            Straße und Hausnummer des Sitzungsortes.

`postalCode`                string            Postleitzahl des Sitzungsortes.

`locality`                  string            Ortsangabe des Sitzungsortes.

`location`                  string            Sitzungsort in Form von Geodaten.

`organization`              array             Gruppierungen, denen die Sitzung zugeordnet ist. Im Regelfall wird hier eine Gruppierung verknüpft sein, es kann jedoch auch gemeinsame Sitzungen mehrerer Gruppierungen geben. Das erste Element ist dann das federführende Gremium. TODO: Eigenschaft für federführendes Gremium ergänzen und dann Ordnung entfernen. invers zur Eigenschaft `meeting` der Klasse `oparl:Organization`.

`chairPerson`               string            Vorsitz der Sitzung

`scribe`                    string            Schriftführer, Protokollant.

`participant`               array             Teilnehmer der Sitzung. Bei einer Sitzung in der Zukunft sind dies die geladenen Teilnehmer, bei einer stattgefundenen Sitzung SOLL die Liste nur diejenigen Teilnehmer umfassen, die tatsächlich an der Sitzung teilgenommen haben.

`invitation`                string            Einladungsdokument zur Sitzung.

`resultsProtocol`           string            Ergebnisprotokoll zur Sitzung. Diese Eigenschaft kann selbstverständlich erst nachdem Stattfinden der Sitzung vorkommen.

`verbatimProtocol`          string            Wortprotokoll zur Sitzung. Diese Eigenschaft kann selbstverständlich erst nach dem Stattfinden der Sitzung vorkommen.

`auxiliaryFile`             array             Dateianhang zur Sitzung. Hiermit sind Dateien gemeint, die üblicherweise mit der Einladung zu einer Sitzung verteilt werden, und die nicht bereits über einzelne Tagesordnungspunkte referenziert sind.

`agendaItem`                array             Tagesordnungspunkte der Sitzung.Die Reihenfolge ist relevant.Es kann Sitzungen ohne TOPs geben.

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/meeting/281", 
    "type": "http://oparl.org/schema/1.0/Meeting", 
    "name": "4. Sitzung des Finanzausschusses", 
    "start": "2013-01-04T08:00:00+01:00", 
    "end": "2013-01-04T12:00:00+01:00", 
    "streetAddress": "Musterstraße 5, Raum 136", 
    "postalCode": "11111", 
    "locality": "Musterort", 
    "organization": [
        "https://oparl.example.org/organization/34"
    ], 
    "invitation": [
        "https://oparl.example.org/files/586"
    ], 
    "resultsProtocol": "https://oparl.example.org/files/628", 
    "verbatimProtocol": "https://oparl.example.org/files/691", 
    "auxiliaryFile": [
        "https://oparl.example.org/files/588", 
        "https://oparl.example.org/files/589"
    ], 
    "agendaItem": [
        "https://oparl.example.org/agendaitem/1045", 
        "https://oparl.example.org/agendaitem/1046", 
        "https://oparl.example.org/agendaitem/1047", 
        "https://oparl.example.org/agendaitem/1048"
    ], 
    "created": "2012-01-06T12:01:00+01:00", 
    "modified": "2012-01-08T14:05:27+01:00"
}
~~~~

\pagebreak


## AgendaItem
Tagesordnungspunkte sind die Bestandteile von Sitzungen (`oparl:Meeting`). Jeder Tagesordnungspunkt widmet sich inhaltlich einem bestimmten Thema, wozu in der Regel auch die Beratung bestimmter Drucksachen gehört.

Die Beziehung zwischen einem Tagesordnungspunkt und einer Drucksache wird über ein Objekt vom Typ `oparl:Consultation` hergestellt, das über die  Eigenschaft `consultation` referenziert werden kann.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`meeting`                   string            Sitzung, der der Tagesordnungspunkt zugeordnet ist.

`number`                    string            Gliederungs-"Nummer" des Tagesordnungspunktes. Eine beliebige Zeichenkette, wie z. B. "10.", "10.1", "C", "c)" o. ä. Die Reihenfolge wird nicht dadurch, sondern durch die Reihenfolge der TOPs im `agendaItem`-Attribut von `oparl:Meeting` festgelegt.

`name`                      string            Das Thema des Tagesordnungspunktes.

`public`                    boolean           Kennzeichnet, ob der Tagesordnungspunkt zur Behandlung in öffentlicher Sitzung vorgesehen ist/war. Es wird ein Wahrheitswert (`true` oder `false`) erwartet.

`consultation`              array             Beratung, die diesem Tagesordnungspunkt zugewiesen ist.

`result`                    string            Kategorische Information darüber, welches Ergebnis die Beratung des Tagesordnungspunktes erbracht hat, in der Bedeutung etwa "Unverändert beschlossen" oder "Geändert beschlossen". Diese Eigenschaft  funktioniert wie in [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung) beschrieben entweder als URL zu einem `skos:Concept` oder als String.

`resolution`                string            Falls in diesem Tagesordnungspunkt ein Beschluss gefasst wurde, kann hier ein Text oder eine Datei angegeben werden. Das ist besonders dann in der Praxis relevant, wenn der gefasste Beschluss (z. B. durch Änderungsantrag) von der Beschlussvorlage abweicht.

`auxiliaryFile`             array             Dateianhänge zum Tagesordnungspunkt.

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
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
~~~~

\pagebreak


## Paper
Dieser Objekttyp dient der Abbildung von Drucksachen in der parlamentarischen Arbeit, wie zum Beispiel Anfragen, Anträgen und Beschlussvorlagen.

Drucksachen werden in Form einer Beratung (oparl:Consultation) im Rahmen eines Tagesordnungspunkts (oparl:AgendaItem) einer Sitzung (oparl:Meeting) behandelt.

Drucksachen spielen in der schriftlichen wie mündlichen Kommunikation eine besondere Rolle, da in vielen Texten auf bestimmte Drucksachen Bezug genommen wird. Hierbei kommen in parlamentarischen Informationssystemen unveränderliche Kennungen der Drucksachen zum Einsatz.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`name`                      string            Titel der Drucksache.

`reference`                 string            Kennung bzw. Aktenzeichen der Drucksache, mit der sie in der parlamentarischen Arbeit eindeutig referenziert werden kann.

`publishedDate`             string            Veröffentlichungsdatum der Drucksache.

`paperType`                 string            Art der Drucksache, z. B. Beantwortung einer Anfrage. Diese Eigenschaft funktioniert wie in [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung) beschrieben entweder als URL zu einem `skos:Concept` oder als String.

`relatedPaper`              string            Inhaltlich verwandte Drucksachen.

`mainFile`                  string            Die Haupt-Datei zu dieser Drucksache. Beispiel: Die Drucksache repräsentiert eine Beschlussvorlage und die Haupt-Datei enthält den Text der Beschlussvorlage.

`auxiliaryFile`             array             Anhänge zur Drucksache. Diese sind, in Abgrenzung zur Haupt-Datei (`mainFile`), untergeordnet und es kann beliebig viele davon geben. Typ: Liste von Objekten des Typs `oparl:File`. Vgl. [Objektlisten](#objektlisten).

`location`                  array             Sofern die Drucksache einen inhaltlichen Ortsbezug hat, beschreibt diese Eigenschaft den Ort in Textform und/oder in Form von Geodaten.

`originator`                array             Urheber der Drucksache, kann eine oder mehrere Person(en) bzw. Gruppierung(en) sein.

`consultation`              array             Beratungen der Drucksache.

`underDirectionof`          array             Federführung. Amt oder Abteilung, für die Inhalte oder Beantwortung der Drucksache verantwortlich.

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/paper/749", 
    "type": "http://oparl.org/schema/1.0/Paper", 
    "body": "https://oparl.example.org/bodies/1", 
    "name": "Antwort auf Anfrage 1200/2014", 
    "reference": "1234/2014", 
    "publishedDate": "2014-04-04T16:42:02+02:00", 
    "paperType": "Beantwortung einer Anfrage", 
    "relatedPaper": [
        "https://oparl.example.org/paper/699"
    ], 
    "mainFile": "https://oparl.example.org/files/925", 
    "auxiliaryFile": [
        "https://oparl.example.org/files/926"
    ], 
    "location": [
        "https://oparl.example.org/locations/4472"
    ], 
    "originator": [
        "https://oparl.example.org/organization/2000", 
        "https://oparl.example.org/people/1000"
    ], 
    "consultation": [
        "https://oparl.example.org/consultation/5676", 
        "https://oparl.example.org/consultation/5689"
    ], 
    "underDirectionOf": [
        "https://oparl.example.org/organization/2000"
    ], 
    "modified": "2013-01-08T12:05:27+01:00"
}
~~~~

\pagebreak


## File
Ein Objekt vom Typ `oparl:File` repräsentiert eine Datei, beispielsweise eine PDF-Datei, ein RTF- oder ODF-Dokument, und hält Metadaten zu der Datei sowie URLs zum Zugriff auf  die Datei bereit.

Objekte vom Typ `oparl:File` können mit Drucksachen (`oparl:Paper`) oder Sitzungen (`oparl:Meeting`) in Beziehung stehen. Dies wird durch  die Eigenschaft `paper` bzw. `meeting` angezeigt.

Mehrere Objekte vom Typ `oparl:File` können mit einander in direkter Beziehung stehen, wenn sie den selben Inhalt in unterschiedlichen technischen Formaten wiedergeben. Hierfür werden die Eigenschaften `masterFile` bzw. `derivativeFile` eingesetzt. Das oben angezeigte Beispiel-Objekt repräsentiert eine PDF-Datei (zu erkennen an der Eigenschaft `mimeType`) und zeigt außerdem über die Eigenschaft  `masterFile` an, von welcher anderen Datei es abgeleitet wurde. Umgekehrt KANN über die Eigenschaft `derivativeFile` angezeigt werden, welche Ableitungen einer Datei existieren.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`fileName`                  string            Dateiname, unter dem die Datei in einem Dateisystem gespeichert werden kann. Beispiel: "einedatei.pdf". Da der Name den kompletten Unicode-Zeichenumang nutzen kann, SOLLEN Clients ggf. selbst dafür sorgen, diesen beim Speichern in ein Dateisystem den lokalen Erfordernissen anzupassen.

`name`                      string            Ein zur Anzeige für Endnutzer bestimmter Name für dieses Objekt. Leerzeichen DÜRFEN enthalten sein, Datei-Endungen wie ".pdf" SOLLEN NICHT enthalten sein. Der Wert SOLL NICHT mit dem Wert der Eigenschaft `fileName` identisch sein.

`mimeType`                  string            MIME-Type des Inhalts ^[vgl. RFC2046: <http://tools.ietf.org/html/rfc2046>]. Sollte das System einer Datei keinen spezifischen Typ zuweisen können, wird EMPFOHLEN, hier `application/octet-stream` zu verwenden.

`date`                      string            Datum und Zeit der Erstellung der Datei. Wahlweise, falls dies nicht vom System kommuniziert werden kann oder soll, KANN alternativ der Zeitpunkt der Veröffentlichung ausgegeben werden.

`size`                      integer           Größe der Datei in Bytes.

`sha1Checksum`              string            SHA1-Prüfsumme des Dateiinhalts in Hexadezimal-Schreibweise.

`text`                      string            Reine Text-Wiedergabe des Dateiinhalts, sofern dieser in Textform wiedergegeben werden kann.

`accessUrl`                 string            URL zum allgemeinen Zugriff auf die Datei. Näheres unter [Dateizugriffe](#dateizugriff).

`downloadUrl`               string            URL zum Download der Datei. Näheres unter [Dateizugriffe](#dateizugriff).

`paper`                     array             Falls die Datei zu einer oder mehreren Drucksachen (`oparl:Paper`) gehört, MÜSSEN diese Drucksachen über diese Eigenschaft angegeben werden.

`meeting`                   array             Falls die Datei zu einer oder mehreren Sitzungen (`oparl:Meeting`) gehört, MÜSSEN diese Sitzungen über diese Eigenschaft angegeben werden.

`masterFile`                string            Datei, von der das aktuelle Objekt abgeleitet wurde. Details dazu in der allgemeinen Beschreibung weiter oben.

`derivativeFile`            array             Datei, die von dem aktuellen Objekt abgeleitet wurde. Details dazu in der allgemeinen Beschreibung weiter oben.

`license`                   string            Lizenz, unter der die Datei angeboten wird. Wenn diese Eigenschaft verwendet wird, dann ist sie anstelle einer globalen Angabe im übergeordneten `oparl:Body`- bzw. `oparl:System`-Objekt maßgeblich.^[vgl. [license](#eigenschaft_license)]

`FileRole`                  string            Rolle, Funktion der Datei in Bezug auf eine Sitzung. Die Eigenschaft SOLL entsprechend nur in Verbindung mit der Eigenschaft `meeting` gesetzt sein. Siehe dazu [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung).

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/files/57739", 
    "type": "http://oparl.org/schema/1.0/File", 
    "name": "Anlage 1 zur Anfrage", 
    "fileName": "57739.pdf", 
    "paper": [
        "https://oparl.example.org/paper/2396"
    ], 
    "mimeType": "application/pdf", 
    "date": "2013-01-04T07:54:13+01:00", 
    "modified": "2013-01-04T07:54:13+01:00", 
    "sha1Checksum": "da39a3ee5e6b4b0d3255bfef95601890afd80709", 
    "size": 82930, 
    "accessUrl": "https://oparl.example.org/files/57739.pdf", 
    "downloadUrl": "https://oparl.example.org/files/download/57739.pdf", 
    "text": "Der Übersichtsplan zeigt alle Ebenen des ...", 
    "masterFile": "https://oparl.example.org/files/57738", 
    "license": "http://www.opendefinition.org/licenses/cc-by"
}
~~~~

\pagebreak


## Consultation
Der Objekttyp `oparl:Consultation` dient dazu, die Beratung einer Drucksache ([`oparl:Paper`](#oparl_paper)) in einer Sitzung abzubilden. Dabei ist es nicht entscheidend, ob diese Beratung in der Vergangenheit stattgefunden hat oder diese für die Zukunft geplant ist.

Die Gesamtheit aller Objekte des Typs `oparl:Consultation` zu einer bestimmten Drucksache bildet das ab, was in der Praxis als "Beratungsfolge" der Drucksache bezeichnet wird.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`paper`                     string            Drucksache, die beraten wird.

`agendaItem`                string            Tagesordnungspunkt, unter dem die Drucksache beraten wird.

`organization`              array             Gremium, dem die Sitzung zugewiesen ist, zu welcher der zuvor genannte Tagesordnungspunkt gehört. Hier kann auch eine mit Liste von Gremien angegeben werden (die verschiedenen `oparl:Body` und `oparl:System` angehören können). Die Liste ist dann geordnet. Das erste Gremium der Liste ist federführend.

`authoritative`             boolean           Drückt aus, ob bei dieser Beratung ein Beschluss zu der Drucksache gefasst wird (`true`) wird oder nicht (`false`).

`role`                      string            Rolle oder Funktion der Beratung. Zum Beispiel Anhörung, Entscheidung, Kenntnisnahme, Vorberatung usw. Diese Eigenschaft funktioniert wie in  [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung) beschrieben  entweder als String oder als URL zu einem `skos:Concept` Objekt.

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/consultation/47594", 
    "type": "http://oparl.org/schema/1.0/Consultation", 
    "paper": "https://oparl.example.org/paper/2396", 
    "agendaItem": "https://oparl.example.org/agendaitem/15569", 
    "organization": "https://oparl.example.org/organization/96", 
    "authoritative": false, 
    "role": "Beschlussfassung"
}
~~~~

\pagebreak


## Location
Dieser Objekttyp dient dazu, den Ortsbezug einer Drucksache formal  abzubilden. Ortsangaben können sowohl aus Textinformationen bestehen  (beispielsweise dem Namen einer Straße/eines Platzes oder eine genaue  Adresse) als auch aus Geodaten. Ortsangaben sind auch nicht auf einzelne Positionen beschränkt, sondern können eine Vielzahl von Positionen, Flächen, Strecken etc. abdecken.

In der Praxis soll dies dazu dienen, den geografischen Bezug eines politischen Vorgangs, wie zum Beispiel eines Bauvorhabens oder der  Änderung eines Flächennutzungsplanes, maschinenlesbar nachvollziehbar zu machen.

Dieser Objekttyp kann für Objekte im Kontext des Objekttyps `oparl:Paper` verwendet werden.

OParl sieht bei Angabe von Geodaten ZWINGEND die Verwendung des   Well-Known-Text-Formats (WKT) der Simple Feature Access Spezifikation^[Simple Feature Access Spezifikation: <http://www.opengeospatial.org/standards/sfa>] vor. WKT erlaubt die Beschreibung von unterschiedlichen Geometrien wie Punkten (`Point`), Pfaden (`LineString`), Polygonen (`Polygon`) und viele andere mehr.

Zum Zeitpunkt der Erstellung der vorliegenden Spezifikation ist Version 1.2.1 der Simple-Feature-Access-Spezifikation aktuell. OParl stellt keine Anforderungen daran, welche Version von Simple-Feature-Access bei der Ausgabe von WKT zu unterstützen ist.

Für die Ausgabe über eine OParl-API MÜSSEN sämtliche Koordinatenangaben solcher Geodaten im System WGS84^[WGS84 steht für "World Geodetic System 1984", es wird unter anderem auch vom Global Positioning System (GPS) verwendet. In geografischen Informationssystemen ist für das System der EPSG-Code 4326  geläufig.] angegeben werden, und zwar in Form von Zahlenwerten (Fließkommazahlen) für Längen- und Breitengrad.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`description`               string            Textliche Beschreibung eines Orts, z. B. in Form einer Adresse.

`geometry`                  string            Geodaten-Repräsentation des Orts. Ist diese Eigenschaft gesetzt, MUSS ihr Wert der Spezifikation von Well-Known Text (WKT) entsprechen.

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/locations/29856", 
    "type": "http://oparl.org/schema/1.0/Location", 
    "description": "Honschaftsstraße 312, Köln", 
    "geometry": "POINT (7.03291 50.98249)"
}
~~~~

\pagebreak


## Membership
Über Objekte diesen Typs wird die Mitgliedschaft von Personen in Gruppierungen dargestellt. Diese Mitgliedschaften können zeitlich begrenzt sein. Zudem kann abgebildet werden, dass eine Person eine bestimmte Rolle bzw. Position innerhalb der Gruppierung inne hat, beispielsweise den Vorsitz einer Fraktion.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`person`                    string            Die betreffende Person, die Mitglied einer Gruppierung ist oder war.

`organization`              string            Die Gruppierung, in der die Person Mitglied ist oder war.

`role`                      string            Rolle der Person für die Gruppierung. Kann genutzt werden, um verschiedene Arten von Mitgliedschaften zum Beispiel in Gremien zu unterscheiden. Diese Eigenschaft funktioniert wie in [Vokabulare zur Klassifizierung](#vokabulare_klassifizierung) beschrieben entweder als URL zu einem skos:Concept oder als String. Der String (oder entsprechend das prefLabel des verlinkten Objekts) SOLL in dieser Form sowohl die männliche als auch die weibliche Rollenbezeichnung enthalten: `"Vorsitzender | Vorsitzende"`.

`post`                      string            The post held by the person in the organization.

`onBehalfOf`                string            Entsendende Gruppierung, Fraktion, fraktionsloses oder externes Gremium. Es kann auch Mitglieder geben, die von keiner anderen Gruppierung entsendet wurden (z. B. fraktionslose Abgeordnete). Da eine solche Person sich gewissermaßen selbst "entsendet" hat, SOLL in dem Fall hier der selbe Wert angegeben werden wie bei der Eigenschaft `person`.^[ Dies entspricht `opengov:onBehalfOf` in Popolo. <http://popoloproject.com/specs/membership.html>]

`votingRight`               boolean           Gibt an, ob die Person in der Gruppierung stimmberechtigtes Mitglied ist.

`startDate`                 string            Anfangszeitpunkt der Mitgliedschaft.^[Abgeleitet von: `schema:validFrom` in Popolo. <http://popoloproject.com/specs/membership.html>]

`endDate`                   string            Der Endzeitpunkt der Mitgliedschaft.^[Abgeleitet von: `schema:validThrough` in Popolo. <http://popoloproject.com/specs/membership.html>]

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/memberships/385", 
    "type": "http://oparl.org/schema/1.0/Membership", 
    "person": "https://oparl.example.org/people/862", 
    "organization": "https://oparl.example.org/organizations/5", 
    "role": "Vorsitzender | Vorsitzende", 
    "votingRight": true, 
    "startDate": "2013-12-03T16:30:00+01:00"
}
~~~~

\pagebreak


## LegislativeTerm
Dieser Objekttyp dient der Beschreibung einer Wahlperiode.

----------------------------------------------------------------------------------------------------------------------------
Name                      Typ               Beschreibung                                                                    
------------------------- ----------------- --------------------------------------------------------------------------------
`name`                      string            Nutzerfreundliche Bezeichnung der Wahlperiode.

`startDate`                 string            Der erste Tag der Wahlperiode.

`endDate`                   string            Der letzte Tag der Wahlperiode.

----------------------------------------------------------------------------------------------------------------------------

**Beispiel**


~~~~ {.json}
{
    "id": "https://oparl.example.org/term/21", 
    "type": "http://oparl.org/schema/1.0/LegislativeTerm", 
    "body": "https://oparl.example.org/body/0", 
    "name": "21. Wahlperiode", 
    "startDate": "2010-12-03", 
    "endDate": "2013-12-03"
}
~~~~

\pagebreak


