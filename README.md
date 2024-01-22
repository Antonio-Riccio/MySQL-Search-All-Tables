# MySQL-Search-All-Tables

## English

## Step 1: Run the Query to Generate Search SELECT Statements

The first step in performing a search for a value across the entire database is to retrieve the columns present in tables with the data type to be found.

1. Copy the query based on the data type to be found (String - Numeric - Blob) and change the value to search for (LIKE '%someText%').
2. Open your MySQL client or working environment and paste the query.
3. Execute the chosen query.
4. Analyze the result. You will obtain a series of concatenated SELECT statements.

Reference link: [Stack Overflow - Search text in fields in every table of a MySQL database](https://stackoverflow.com/questions/639531/search-text-in-fields-in-every-table-of-a-mysql-database)

## Step 2: Remove Queries that Produce Errors

Executing the concatenated SELECT statements might result in an error like:

```sql
# SQL Error [1064] [42000]: (conn=13) You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SELECT * FROM ..... WHERE ..... LIKE '.....';¶SELECT * FROM ...' at line 2.
```

This could happen due to the MariaDB version. To circumvent this, run the Python script (`step2.py`) that removes all queries producing this error.

1. Open the `step2.py` file in the "Python Scripts" folder.
2. Copy all the SELECT statements returned in step 1 and paste them into the `query_string` variable.
3. Run the script.

## Step 3: Result

1. After the execution, you will have 2 files.
    - `query_result.txt` -> containing the executed query
    - `query_results.txt` -> containing the result of the query
2. If needed, you can modify the code to send/save the query data/the query itself to a file, email it, or perform any other operation. Simply edit the Python code as necessary.

---

# MySQL-Search-All-Tables

## Italiano

## Step 1: Esegui la Query per Generare le SELECT di Ricerca

La prima operazione da eseguire per effettuare una ricerca di un valore in tutto il database è recuperare le colonne presenti nelle tabelle con il tipo di dato da cercare.

1. Copia la query in base al tipo di dato da trovare (Stringa - Numerico - Blob) e cambia il valore da cercare (- `LIKE \'%someText%\'`).
2. Apri il tuo client MySQL o l'ambiente di lavoro e incolla la query.
3. Esegui la query da te scelta.
4. Analizza il risultato. Otterrai una serie di istruzioni SELECT concatenate.

Link di riferimento: [Stack Overflow - Ricerca di testo in campi in ogni tabella di un database MySQL](https://stackoverflow.com/questions/639531/search-text-in-fields-in-every-table-of-a-mysql-database)

## Step 2: Rimuovere le Query che Danno Errore

Eseguire le SELECT concatenate potrebbe restituire un errore del tipo:

```sql
# Errore SQL [1064] [42000]: (conn=13) You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SELECT * FROM ..... WHERE ..... LIKE '.....';¶SELECT * FROM ...' at line 2.
```

Ciò potrebbe accadere a causa della versione di MariaDB. Per aggirare ciò, basta eseguire lo script Python (`step2.py`) che rimuoverà tutte le query che restituiscono questo errore.

1. Aprire il file `step2.py` nella cartella "Script Python".
2. Copiare tutte le SELECT che sono state restituite nello step 1 e incollarle nella variabile `query_string`.
3. Eseguire lo script.

## Step 3: Risultato

1. Alla fine dell'esecuzione avrai 2 file.
    - `query_result.txt` -> che contiene la query eseguita
    - `query_results.txt` -> che contiene il risultato della query
2. Nel caso occorra, puoi modificare il codice in modo tale da inviare/salvare i dati della query/la query in un file o inviarlo per email o qualunque altra operazione, basterà modificare il codice Python.
