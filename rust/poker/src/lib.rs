use std::collections::HashMap;

/// Given a list of poker hands, return a list of those hands which win.
///
/// Note the type signature: this function should return _the same_ reference to
/// the winning hand(s) as were passed in, not reconstructed strings which happen to be equal.
pub fn winning_hands<'a>(hands: &[&'a str]) -> Vec<&'a str> {
    let mut winners = Vec::new();
    let mut max_rank = 0;
    for hand in hands.iter() {
        let rank = rank_hand(hand);
        if rank > max_rank {
            max_rank = rank;
            winners.clear();
            winners.push(*hand);
        } else if rank == max_rank {
            winners.push(*hand);
        }
    }
    winners
}
fn rank_hand(hand: &str) -> u32 {
    let mut cards = hand
        .split_whitespace()
        .map(|card| {
            let mut chars = card.chars();
            let rank = chars.next().unwrap();
            let suit = chars.next().unwrap();
            Card {
                rank: match rank {
                    '2'..='9' => rank.to_digit(10).unwrap(),
                    'T' => 10,
                    'J' => 11,
                    'Q' => 12,
                    'K' => 13,
                    'A' => 14,
                    _ => panic!("Invalid rank"),
                },
                suit: match suit {
                    'C' => Suit::Clubs,
                    'D' => Suit::Diamonds,
                    'H' => Suit::Hearts,
                    'S' => Suit::Spades,
                    _ => panic!("Invalid suit"),
                },
            }
        })
        .collect::<Vec<Card>>();
    cards.sort_by_key(|c| c.rank);
    let mut straight = true;
    let mut flush = true;
    let mut rank = 0;
    let mut prev = 0;
    let mut counts = HashMap::new();
    for card in cards.iter() {
        *counts.entry(card.rank).or_insert(0) += 1;
        if rank == 0 {
            rank = card.rank;
        } else if card.rank != prev + 1 {
            straight = false;
        }
        if card.suit != cards[0].suit {
            flush = false;
        }
        prev = card.rank;
    }
    match (straight, flush) {
        (true, true) => {
            if rank == 10 {
                9
            } else {
                8
            }
        }
        (true, false) => 4,
        (false, true) => 5,
        (false, false) => match counts.values().max() {
            Some(&4) => 7,
            Some(&3) => match counts.values().max() {
                Some(&2) => 6,
                _ => 3,
            },
            Some(&2) => match counts.values().max() {
                Some(&2) => 2,
                _ => 1,
            },
            _ => 0,
        },
    }
}

#[derive(PartialEq, Eq, PartialOrd, Ord, Debug)]
struct Card {
    rank: u32,
    suit: Suit,
}

#[derive(PartialEq, Eq, PartialOrd, Ord, Debug)]
enum Suit {
    Clubs,
    Diamonds,
    Hearts,
    Spades,
}
