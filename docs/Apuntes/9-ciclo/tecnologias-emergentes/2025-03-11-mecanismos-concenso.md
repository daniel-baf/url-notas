Son mecanismos que regulan la forma en que los nodos dentro de una blockchain llegan a un acuerdo en la red.

| ventajas  | desventajas  |
| --------- | ------------ |
| seguridad | altos costos |
Estos algoritmos garantizan que todas las transacciones sean válidas y que todas las copias del registro estén sincronizadas, pues al haber muchos nodos conectados, se requiere que todos los nodos lleguen a un acuerdo de los cambios que hace cada uno.

Garantizan la seguridad, integridad y confianza de los registros de transacción.

**¿Cómo funciona?**

- Los nodos de una red blockchain reciben transacciones
- Cada nodo verifica la transacción para asegurarse de que sea válida
- Los nodos transmiten la transacción a otros nodos en la red
- Los nodos trabajan para llegar a un acuerdo sobre si la transacción es válida y si es así, la agregan al registro.

---

## Tipos de Algoritmos de Consenso

Los algoritmos de consenso son fundamentales en los sistemas distribuidos, especialmente en blockchain, ya que permiten que múltiples nodos se pongan de acuerdo sobre el estado de una red sin necesidad de una autoridad central. A continuación, se presentan los principales algoritmos de consenso:

### **Proof of Work (PoW)**

El **Proof of Work** (Prueba de Trabajo) fue el primer mecanismo de consenso implementado en blockchain y es utilizado por Bitcoin. Se basa en la resolución de problemas matemáticos complejos a través de minería computacional.

- **Ventajas:** Alta seguridad y resistencia a ataques del 51%.
- **Desventajas:** Alto consumo energético y costos operativos elevados.

Ejemplo: Bitcoin, Ethereum (antes de la actualización a PoS).

---

### **Proof of Stake (PoS)**

El **Proof of Stake** (Prueba de Participación) sustituye la minería por un sistema donde los participantes bloquean (o "apuestan") sus criptomonedas como garantía para validar transacciones.

- **Ventajas:** Menor consumo energético y mayor escalabilidad.
- **Desventajas:** Puede favorecer la centralización, ya que quienes tienen más monedas tienen mayor poder en la red.

Ejemplo: Ethereum (tras The Merge), Cardano, Solana.

---

### **Proof of Authority (PoA)**

En el **Proof of Authority** (Prueba de Autoridad), los validadores son seleccionados por su reputación y confianza en lugar de su poder computacional o cantidad de monedas apostadas.

- **Ventajas:** Rápido y eficiente en términos energéticos.
- **Desventajas:** Centralizado, ya que depende de validadores preseleccionados.

Ejemplo: VeChain, redes privadas de blockchain.

---

### **Proof of Space (PoS o PoSpace)**

El **Proof of Space** (Prueba de Espacio) permite a los participantes utilizar espacio en disco como recurso para validar transacciones, en lugar de poder computacional o monedas apostadas.

- **Ventajas:** Menor consumo energético que PoW.
- **Desventajas:** Puede incentivar el almacenamiento ineficiente de datos sin valor real.

Ejemplo: Chia Network.

---

### **Proof of Space and Time (PoST)**

El **Proof of Space and Time** (Prueba de Espacio y Tiempo) es una variante del PoS que introduce un componente temporal para asegurar que el espacio en disco se mantiene reservado durante un período de tiempo.

- **Ventajas:** Reduce la posibilidad de ataques por almacenamiento temporal falso.
- **Desventajas:** Aún en desarrollo y no probado a gran escala.

Ejemplo: Chia Network.

---

### **Delegated Proof of Stake (DPoS)**

El **Delegated Proof of Stake** (Prueba de Participación Delegada) introduce un sistema de votación donde los poseedores de monedas eligen un grupo reducido de validadores que gestionan la red.

- **Ventajas:** Alta escalabilidad y eficiencia.
- **Desventajas:** Favorece la centralización, ya que unos pocos nodos tienen el control.

Ejemplo: EOS, TRON.

---

### **Delegated Proof of Space (DPoSpace)**

El **Delegated Proof of Space** es una variante de PoS en la que los participantes pueden delegar su almacenamiento a otros nodos en la red.

- **Ventajas:** Permite una mayor descentralización y participación de usuarios con menos recursos.
- **Desventajas:** Puede ser vulnerable a manipulaciones si la delegación no se gestiona correctamente.

Ejemplo: Aún en fase experimental.

---

### **Proof of Burn (PoB)**

El **Proof of Burn** (Prueba de Quema) requiere que los participantes "quemen" monedas enviándolas a una dirección inaccesible, lo que demuestra su compromiso con la red.

- **Ventajas:** Reduce la inflación en la red.
- **Desventajas:** No es eficiente en términos de uso de recursos.

Ejemplo: Counterparty.

---

### **Proof of Elapsed Time (PoET)**

El **Proof of Elapsed Time** (Prueba de Tiempo Transcurrido) selecciona validadores de forma aleatoria basándose en el tiempo que han esperado antes de proponer un bloque.

- **Ventajas:** Energéticamente eficiente y justo.
- **Desventajas:** Requiere hardware confiable y puede depender de terceros.

Ejemplo: Hyperledger Sawtooth.

---

### **Proof of Activity (PoA)**

El **Proof of Activity** combina PoW y PoS, donde los mineros comienzan resolviendo acertijos computacionales y luego los validadores finales son elegidos en función de su participación en la red.

- **Ventajas:** Seguridad elevada.
- **Desventajas:** Puede ser ineficiente en términos de consumo energético.

Ejemplo: Híbridos como Decred.

---

### **Proof of Reputation (PoR)**

El **Proof of Reputation** otorga poder a los validadores en función de su reputación en la red, basada en su historial de buenas prácticas y confiabilidad.

- **Ventajas:** Reduce la posibilidad de ataques maliciosos.
- **Desventajas:** Puede volverse centralizado si pocos actores tienen reputación suficiente.

Ejemplo: Utilizado en redes empresariales privadas.

---

### **Proof of History (PoH)**

El **Proof of History** utiliza un registro cronológico inmutable de eventos para validar transacciones sin necesidad de una verificación intensiva en recursos.

- **Ventajas:** Alta velocidad y eficiencia en el procesamiento de transacciones.
- **Desventajas:** Difícil de implementar en redes ya establecidas.

Ejemplo: Solana.

---

### **Proof of Transfer (PoX)**

El **Proof of Transfer** permite que los mineros bloqueen una criptomoneda en una cadena establecida para asegurar otra red blockchain.

- **Ventajas:** Aprovecha la seguridad de cadenas existentes.
- **Desventajas:** Depende de otra criptomoneda para su seguridad.

Ejemplo: Stacks (STX), que usa Bitcoin como base de seguridad.

---

Cada algoritmo de consenso tiene sus ventajas y desventajas dependiendo del caso de uso. Mientras que PoW sigue siendo el más seguro, PoS y sus variantes han ganado popularidad por su eficiencia. Otros mecanismos, como PoA y PoH, buscan soluciones más innovadoras para mejorar escalabilidad y sostenibilidad.


## QUÉ PASA SI INTENTAN HACER ALGO ILÍSITO

Si un validador hace algo ilegítimo en una blockchain, las consecuencias dependen del algoritmo de consenso que se esté utilizando. A continuación, te explico qué puede ocurrir en distintos sistemas de consenso cuando un validador actúa de forma maliciosa:

---

### **1. Proof of Work (PoW)**

En PoW, los mineros validan bloques mediante el poder computacional. Si un minero intenta hacer algo ilegítimo, como modificar transacciones o realizar un ataque del 51%, las consecuencias son:

- **Bloques rechazados:** Si un minero crea un bloque inválido (con transacciones ilegales o incorrectas), los nodos honestos de la red lo rechazan.
- **Pérdida de recursos:** El minero gasta electricidad y potencia de cómputo en vano.
- **Ataque del 51%:** Si un grupo de mineros obtiene más del 50% del poder de cómputo, podría reescribir la blockchain, pero esto requiere un costo enorme y podría afectar la confianza en la red, disminuyendo el valor de la criptomoneda.

---

### **2. Proof of Stake (PoS) y Delegated Proof of Stake (DPoS)**

En estos sistemas, los validadores deben "apostar" (bloquear) criptomonedas para participar en la validación de bloques. Si actúan maliciosamente:

- **Slashing (reducción de participación):** Se les castiga eliminando una parte o la totalidad de su stake (las monedas que bloquearon como garantía).
- **Expulsión de la red:** En muchos sistemas PoS, si un validador intenta validar transacciones fraudulentas o no cumple con sus deberes (como estar desconectado por largos períodos), puede ser eliminado del grupo de validadores.
- **Pérdida de reputación:** En DPoS, los validadores son elegidos por votación. Si un validador actúa de manera maliciosa, los delegadores pueden dejar de votar por él, lo que lo excluye de la validación futura.

Ejemplo: En Ethereum 2.0, los validadores pueden perder hasta el 100% de su stake si intentan hacer doble gasto o firmar bloques contradictorios.

---

### **3. Proof of Authority (PoA)**

En PoA, los validadores son entidades confiables y verificadas (como empresas o instituciones). Si actúan de manera ilegítima:

- **Expulsión de la red:** Los otros validadores pueden votar para eliminar al validador corrupto.
- **Daño a la reputación:** Dado que los validadores en PoA suelen ser entidades conocidas públicamente, el daño a su reputación puede afectar su credibilidad en otros negocios.
- **Posibles acciones legales:** Como PoA es más común en blockchains privadas o empresariales, la mala conducta de un validador puede tener implicaciones legales.

Ejemplo: VeChain usa PoA, donde los nodos validadores deben seguir reglas estrictas y pueden ser eliminados si incumplen normas.

---

### **4. Proof of Space (PoS o PoSpace) y Proof of Space and Time (PoST)**

En estos sistemas, los validadores usan almacenamiento en disco en lugar de poder computacional o stake de monedas.

- **Reducción de recompensas:** Si un validador intenta hacer trampa (por ejemplo, simulando almacenamiento falso), sus recompensas pueden disminuir o ser excluido de la red.
- **Pérdida de acceso a la red:** Si un nodo no sigue las reglas, puede ser rechazado por los demás nodos de la red.

Ejemplo: Chia Network penaliza a los mineros que no cumplen con los requisitos de espacio y tiempo.

---

### **5. Proof of Burn (PoB)**

En PoB, los mineros "queman" monedas para obtener el derecho a minar. Si actúan maliciosamente:

- **Pierden las monedas quemadas:** No hay forma de recuperar las criptomonedas destruidas. Si intentan hacer trampa, simplemente han desperdiciado su inversión.

---

### **6. Proof of History (PoH) y Proof of Elapsed Time (PoET)**

Estos sistemas dependen del tiempo y del orden de las transacciones. Si un validador intenta manipular el sistema:

- **PoH (Solana):** La red rechazará validaciones incorrectas, y los validadores deshonestos pueden ser expulsados o perder recompensas.
- **PoET (Hyperledger):** Se usa hardware especializado para garantizar tiempos de espera justos. Un nodo malicioso puede ser expulsado si intenta alterar los tiempos de validación.

---

