import mysql.connector

# Configura le tue credenziali di accesso al database
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'magento',
    'database': 'test'
}

# La tua stringa di query
query_string = """
SELECT "test.admin_user.firstname" AS source, firstname FROM test.admin_user WHERE firstname LIKE '%@a%' UNION 
SELECT "test.admin_user.lastname" AS source, lastname FROM test.admin_user WHERE lastname LIKE '%@a%' UNION 
SELECT "test.admin_user.email" AS source, email FROM test.admin_user WHERE email LIKE '%@a%' UNION 
"""


# Inizializza la connessione e il cursore
connection = mysql.connector.connect(**db_config)
cursor = connection.cursor()

while True:
    try:
        # Rimuovi l'ultima occorrenza di "UNION" e inserisci ";"
        query_string = query_string.rsplit("UNION", 1)[0] + ';'
            
        # Esegui la query
        cursor.execute(query_string)

        # Ottieni i risultati
        results = cursor.fetchall()

        results_str = "\n".join(map(str, results))

        #Puoi salvare il risultato dalla query già qui (puoi creare un csv, salvarlo in un file, inviaro per email ecc...)
        #print(results)

        # Salva il risultato della query in un file
        with open('query_results.txt', 'w') as file:
            file.write(results_str)
            
        # Se la query ha successo, esci dal loop
        break

    except mysql.connector.Error as err:
        # Gestisci l'errore
        #print(f"Errore: {err}")

        # Controlla se l'errore contiene informazioni sulla linea
        if "line" in str(err):
            # Trova il numero della linea causante l'errore
            line_number = int(str(err).split("line")[1].split(",")[0].strip())

            # Rimuovi la linea causante l'errore dalla stringa query_string
            lines = query_string.split('\n')
            lines.pop(line_number - 1)
            query_string = '\n'.join(lines)
            #print(f"Linea {line_number} rimossa dalla query_string")



# Chiudi la connessione
cursor.close()
connection.close()

# Salva la query risultante in un file
with open('query_result.txt', 'w') as file:
    file.write(query_string)