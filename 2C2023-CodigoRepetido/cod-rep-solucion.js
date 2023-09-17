const assert = require('assert'); // https://nodejs.org/api/assert.html

class Jugador {
    constructor(posicion) {
        // Modificamos el nombre del colaborador para que sea más expresivo en base a su rol
        this.posicion = posicion;
    }

    esDelantero() {
        return this.posicion === 'delantero';
    }

    esArquero() {
        return this.posicion === 'arquero';
    }

    // Eliminamos la romper encapsulamiento sacando el mensaje que expone el colaborador interno
}

class EquipoDeFutbol {

    filtrarJugadorPorPosicion(jugadores, posicionPara) {
        return jugadores.filter(jugador => posicionPara(jugador));
    }
}

const equipo = new EquipoDeFutbol();
const jugadores = [
    new Jugador('delantero'),
    new Jugador('arquero'),
    new Jugador('delantero'),
];

const esArquero = jugador => jugador.esArquero();
const esDelantero = jugador => jugador.esDelantero();

const jugadoresArqueros = equipo.filtrarJugadorPorPosicion(jugadores, esArquero);
const jugadoresDelanteros = equipo.filtrarJugadorPorPosicion(jugadores, esDelantero);

assert.strictEqual(jugadoresArqueros.length, 1, 'Debería haber un solo arquero');
assert.strictEqual(jugadoresDelanteros.length, 2, 'Debería haber solo dos delanteros');
