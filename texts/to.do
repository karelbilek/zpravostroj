udělat co nejdřív
- zjistit, do kdy má být Bc zadána
- zadat si formální zadání bakalářky (je to potřeba?)

- implementovat IO::Compress::GZip
- trvalý proces (včetně klogu, problém s uloženým heslem)



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