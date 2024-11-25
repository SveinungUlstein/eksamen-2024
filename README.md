Oppgave 1B: https://github.com/SveinungUlstein/eksamen-2024/actions/runs/11953160394/job/33320443419

Oppgave 2B - Master branch: https://github.com/SveinungUlstein/eksamen-2024/actions/runs/12008429201/job/33471046689
Oppgave 2B - test branch:   https://github.com/SveinungUlstein/eksamen-2024/actions/runs/12009931573/job/33475701320
Oppgave 2B - SQS kø URL:    https://eu-west-1.console.aws.amazon.com/sqs/v3/home?region=eu-west-1#/queues/https%3A%2F%2Fsqs.eu-west-1.amazonaws.com%2F244530008913%2Flambda_queue_27

Oppgave 3: Ikke gjort

Oppgave 4: Jeg har satt threshold for alarmen til 0 bare for å teste om det fungerer og om jeg fikk emailen, som jeg gjorde.

Oppgave 5.1: En serverless arkitektur gir ofte en raskere produksjons syklus med tanke på CI/CD. Continuous Delivery er ofte vanskelig å automatisere 100%, men man kan automatisere
    deler av oppgavene noe som vil være vanskeligere med en mikrotjeneste. På den andre siden har du mikrotjenester som må testes og deployes mer manuellt, noe som tar lengre tid og er mer komplisert
    og krever mer kunskap av utviklerene, men gir mer kontroll til utviklerene.

Oppgave 5.2: Overvåking med mikrotjenester vil for det meste bli gjort gjennom tredjepartsprogrammer. Med en serverless arkitektur, hvis vi tar AWS som et eksempel
    så har vi mange tjenester på samme platform som alle kan snakke enkelt med hverandre. Igjen vil vi se at serverless arkitektur simplifiserer og automatiserer arbeidsoppgaver som
    venligvis ville vært mer kompliserte.

Oppgave 5.3: En serverless arkitektur vil være enkelere skalerbar i forhold til en arkitektur med mikrotjenester. Du vil kunne skalere til akkurt så mye ressurser du trenger
    og derreter vil også kosnadene skaleres så du slipper å betale for ressurser du ikke bruker. Du trenger ikke tenke på å skalere infrastruktur eller vedlikehold og eventuelle ansatte som kreves for dette
    For en serverless arkitektur kan dette automatiseres ganske enkelt etter hvor mye trafikk du har. 
    Vanligvis vil mikrotjenester gi en mer forutsigbar kostnad selv om de ofte vil være litt høyere.  
    
Oppgave 5.4: Med en serverless arkitektur vil du ha mindre kontroll over infrastrukturen systemet ditt kjører på. Det vil si at hvis noe skulle skje, feil med servere eller brudd ved datasenteret
    så er du helt avhengig av at levrandøren din fikser det. Dette kan på en annen side være en bra ting ettersom du ikke trenger personer eller noen ganger et helt team til servere og vedlikehold.
    