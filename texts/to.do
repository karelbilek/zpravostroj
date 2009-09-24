udělat co nejdřív
- zjistit, do kdy má být Bc zadána
- zadat si formální zadání bakalářky

- zajistit si automatické spouštění přes Cron (zatím jsem s panem Semerádem mluvil, nevypadá to úplně nadějně :()
- v návaznosti na to začít dlouhodobě archivovat
- k tomu bude potřeba nějak implementovat zip/gzip...

- nějak se blížit ke konkrétnímu html výstupu

potom
- zmenšít počet featur
- zmenšit je do aspoň nějak testovatelného zadání

- testování = testovací data + evaluace
- ohledně testovacích dat - měla by být množina článků, u kterých víme výsledek, a k němu se chceme přiblížit
- tj. program musí být schopen nějak běžet na testovacích datech
- evaluace - ohodnocení výsledků
- nezávisle na programu
- jedna z možností evaluace - precision / recall
- precision = #správných/odevzdaných
- recall = #správných/očekávaných

- do Bc se hodí i staré metody / verze algoritmů (baseline)
- do Bc se hodí i věci, co nejsou v systému úplně OK (např. ruční úprava některých špatně lemmatizovaných slov)

- testování by bylo dobré udělat jak po částech, tak v celku, tj. program by na to měl být připraven 