/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import enums.Suit;
import enums.Rank;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author Anthony Lannoote
 */
public class Deck {

    private List<Card> cards;

    public Deck() {
        this.cards = new ArrayList<Card>();
    }

    public List<Card> getCards() {
        return cards;
    }

    /**
     * Deck word opgevuldt met alle 52 kaarten
     */
    public void fillDeck() {

        String suit;
        String value;
        String image;

        for (Suit s : Suit.values()) {

            for (Rank v : Rank.values()) {
                this.cards.add(new Card(s, v));
            }
        }
    }

    /**
     * Het Deck wordt door elkaar geschudt
     */
    public void shuffleDeck() {
        Collections.shuffle(this.cards);
    }

    /**
     * Geeft de eerste kaart terug van het Deck(cards) en verwijderd deze
     *
     * @return
     */
    public Card drawCard() {
        Card card = this.cards.get(0);
        removeCard(card);
        return card;
    }

    private void removeCard(Card card) {
        this.cards.remove(card);
    }
}
