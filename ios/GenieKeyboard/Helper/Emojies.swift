//
//  Emojies.swift
//  GenieKeyboard
//
//  Created by Nidhi's Macbook Pro on 29/03/23.
//

import Foundation

struct Emojie {
    
    
    
     static let arrEmojiesValue =  ["😀", "😃", "😄", "😁", "😆", "😅", "🤣", "😂", "🙂", "🙃", "🫠", "😉", "😊", "😇", "🥰", "😍", "🤩", "😘", "😗", "☺️", "😚", "😙", "🥲", "😋", "😛", "😜", "🤪", "😝", "🤑", "🤗", "🤭", "🫢", "🫣", "🤫", "🤔", "🫡", "🤐", "🤨", "😐", "😑", "😶", "🫥", "😶‍🌫️", "😏", "😒", "🙄", "😬", "😮‍💨", "🤥", "😌", "😔", "😪", "🤤", "😴", "😷", "🤒", "🤕", "🤢", "🤮", "🤧", "🥵", "🥶", "🥴", "😵", "😵‍💫", "🤯", "🤠", "🥳", "🥸", "😎", "🤓", "🧐", "😕", "🫤", "😟", "🙁", "☹️", "😮", "😯", "😲", "😳", "🥺", "🥹", "😦", "😧", "😨", "😰", "😥", "😢", "😭", "😱", "😖", "😣", "😞", "😓", "😩", "😫", "🥱", "😤", "😡", "😠", "🤬", "😈", "👿", "💀", "☠️", "💩", "🤡", "👹", "👺", "👻", "👽", "👾", "🤖", "😺", "😸", "😹", "😻", "😼", "😽", "🙀", "😿", "😾", "🙈", "🙉", "🙊", "💋", "💌", "💘", "💝", "💖", "💗", "💓", "💞", "💕", "💟", "❣️", "💔", "❤️‍🔥", "❤️‍🩹", "❤️", "🧡", "💛", "💚", "💙", "💜", "🤎", "🖤", "🤍", "💯", "💢", "💥", "💫", "💦", "💨", "🕳️", "💣", "💬", "👁️‍🗨️", "🗨️", "🗯️", "💭", "💤", "👋", "👋🏻", "👋🏼", "👋🏽", "👋🏾", "👋🏿", "🤚", "🤚🏻", "🤚🏼", "🤚🏽", "🤚🏾", "🤚🏿", "🖐️", "🖐🏻", "🖐🏼", "🖐🏽", "🖐🏾", "🖐🏿", "✋", "✋🏻", "✋🏼", "✋🏽", "✋🏾", "✋🏿", "🖖", "🖖🏻", "🖖🏼", "🖖🏽", "🖖🏾", "🖖🏿", "🫱", "🫱🏻", "🫱🏼", "🫱🏽", "🫱🏾", "🫱🏿", "🫲", "🫲🏻", "🫲🏼", "🫲🏽", "🫲🏾", "🫲🏿", "🫳", "🫳🏻", "🫳🏼", "🫳🏽", "🫳🏾", "🫳🏿", "🫴", "🫴🏻", "🫴🏼", "🫴🏽", "🫴🏾", "🫴🏿", "👌", "👌🏻", "👌🏼", "👌🏽", "👌🏾", "👌🏿", "🤌", "🤌🏻", "🤌🏼", "🤌🏽", "🤌🏾", "🤌🏿", "🤏", "🤏🏻", "🤏🏼", "🤏🏽", "🤏🏾", "🤏🏿", "✌️", "✌🏻", "✌🏼", "✌🏽", "✌🏾", "✌🏿", "🤞", "🤞🏻", "🤞🏼", "🤞🏽", "🤞🏾", "🤞🏿", "🫰", "🫰🏻", "🫰🏼", "🫰🏽", "🫰🏾", "🫰🏿", "🤟", "🤟🏻", "🤟🏼", "🤟🏽", "🤟🏾", "🤟🏿", "🤘", "🤘🏻", "🤘🏼", "🤘🏽", "🤘🏾", "🤘🏿", "🤙", "🤙🏻", "🤙🏼", "🤙🏽", "🤙🏾", "🤙🏿", "👈", "👈🏻", "👈🏼", "👈🏽", "👈🏾", "👈🏿", "👉", "👉🏻", "👉🏼", "👉🏽", "👉🏾", "👉🏿", "👆", "👆🏻", "👆🏼", "👆🏽", "👆🏾", "👆🏿", "🖕", "🖕🏻", "🖕🏼", "🖕🏽", "🖕🏾", "🖕🏿", "👇", "👇🏻", "👇🏼", "👇🏽", "👇🏾", "👇🏿", "☝️", "☝🏻", "☝🏼", "☝🏽", "☝🏾", "☝🏿", "🫵", "🫵🏻", "🫵🏼", "🫵🏽", "🫵🏾", "🫵🏿", "👍", "👍🏻", "👍🏼", "👍🏽", "👍🏾", "👍🏿", "👎", "👎🏻", "👎🏼", "👎🏽", "👎🏾", "👎🏿", "✊", "✊🏻", "✊🏼", "✊🏽", "✊🏾", "✊🏿", "👊", "👊🏻", "👊🏼", "👊🏽", "👊🏾", "👊🏿", "🤛", "🤛🏻", "🤛🏼", "🤛🏽", "🤛🏾", "🤛🏿", "🤜", "🤜🏻", "🤜🏼", "🤜🏽", "🤜🏾", "🤜🏿", "👏", "👏🏻", "👏🏼", "👏🏽", "👏🏾", "👏🏿", "🙌", "🙌🏻", "🙌🏼", "🙌🏽", "🙌🏾", "🙌🏿", "🫶", "🫶🏻", "🫶🏼", "🫶🏽", "🫶🏾", "🫶🏿", "👐", "👐🏻", "👐🏼", "👐🏽", "👐🏾", "👐🏿", "🤲", "🤲🏻", "🤲🏼", "🤲🏽", "🤲🏾", "🤲🏿", "🤝", "🤝🏻", "🤝🏼", "🤝🏽", "🤝🏾", "🤝🏿", "🫱🏻‍🫲🏼", "🫱🏻‍🫲🏽", "🫱🏻‍🫲🏾", "🫱🏻‍🫲🏿", "🫱🏼‍🫲🏻", "🫱🏼‍🫲🏽", "🫱🏼‍🫲🏾", "🫱🏼‍🫲🏿", "🫱🏽‍🫲🏻", "🫱🏽‍🫲🏼", "🫱🏽‍🫲🏾", "🫱🏽‍🫲🏿", "🫱🏾‍🫲🏻", "🫱🏾‍🫲🏼", "🫱🏾‍🫲🏽", "🫱🏾‍🫲🏿", "🫱🏿‍🫲🏻", "🫱🏿‍🫲🏼", "🫱🏿‍🫲🏽", "🫱🏿‍🫲🏾", "🙏", "🙏🏻", "🙏🏼", "🙏🏽", "🙏🏾", "🙏🏿", "✍️", "✍🏻", "✍🏼", "✍🏽", "✍🏾", "✍🏿", "💅", "💅🏻", "💅🏼", "💅🏽", "💅🏾", "💅🏿", "🤳", "🤳🏻", "🤳🏼", "🤳🏽", "🤳🏾", "🤳🏿", "💪", "💪🏻", "💪🏼", "💪🏽", "💪🏾", "💪🏿", "🦾", "🦿", "🦵", "🦵🏻", "🦵🏼", "🦵🏽", "🦵🏾", "🦵🏿", "🦶", "🦶🏻", "🦶🏼", "🦶🏽", "🦶🏾", "🦶🏿", "👂", "👂🏻", "👂🏼", "👂🏽", "👂🏾", "👂🏿", "🦻", "🦻🏻", "🦻🏼", "🦻🏽", "🦻🏾", "🦻🏿", "👃", "👃🏻", "👃🏼", "👃🏽", "👃🏾", "👃🏿", "🧠", "🫀", "🫁", "🦷", "🦴", "👀", "👁️", "👅", "👄", "🫦", "👶", "👶🏻", "👶🏼", "👶🏽", "👶🏾", "👶🏿", "🧒", "🧒🏻", "🧒🏼", "🧒🏽", "🧒🏾", "🧒🏿", "👦", "👦🏻", "👦🏼", "👦🏽", "👦🏾", "👦🏿", "👧", "👧🏻", "👧🏼", "👧🏽", "👧🏾", "👧🏿", "🧑", "🧑🏻", "🧑🏼", "🧑🏽", "🧑🏾", "🧑🏿", "👱", "👱🏻", "👱🏼", "👱🏽", "👱🏾", "👱🏿", "👨", "👨🏻", "👨🏼", "👨🏽", "👨🏾", "👨🏿", "🧔", "🧔🏻", "🧔🏼", "🧔🏽", "🧔🏾", "🧔🏿", "🧔‍♂️", "🧔🏻‍♂️", "🧔🏼‍♂️", "🧔🏽‍♂️", "🧔🏾‍♂️", "🧔🏿‍♂️", "🧔‍♀️", "🧔🏻‍♀️", "🧔🏼‍♀️", "🧔🏽‍♀️", "🧔🏾‍♀️", "🧔🏿‍♀️", "👨‍🦰", "👨🏻‍🦰", "👨🏼‍🦰", "👨🏽‍🦰", "👨🏾‍🦰", "👨🏿‍🦰", "👨‍🦱", "👨🏻‍🦱", "👨🏼‍🦱", "👨🏽‍🦱", "👨🏾‍🦱", "👨🏿‍🦱", "👨‍🦳", "👨🏻‍🦳", "👨🏼‍🦳", "👨🏽‍🦳", "👨🏾‍🦳", "👨🏿‍🦳", "👨‍🦲", "👨🏻‍🦲", "👨🏼‍🦲", "👨🏽‍🦲", "👨🏾‍🦲", "👨🏿‍🦲", "👩", "👩🏻", "👩🏼", "👩🏽", "👩🏾", "👩🏿", "👩‍🦰", "👩🏻‍🦰", "👩🏼‍🦰", "👩🏽‍🦰", "👩🏾‍🦰", "👩🏿‍🦰", "🧑‍🦰", "🧑🏻‍🦰", "🧑🏼‍🦰", "🧑🏽‍🦰", "🧑🏾‍🦰", "🧑🏿‍🦰", "👩‍🦱", "👩🏻‍🦱", "👩🏼‍🦱", "👩🏽‍🦱", "👩🏾‍🦱", "👩🏿‍🦱", "🧑‍🦱", "🧑🏻‍🦱", "🧑🏼‍🦱", "🧑🏽‍🦱", "🧑🏾‍🦱", "🧑🏿‍🦱", "👩‍🦳", "👩🏻‍🦳", "👩🏼‍🦳", "👩🏽‍🦳", "👩🏾‍🦳", "👩🏿‍🦳", "🧑‍🦳", "🧑🏻‍🦳", "🧑🏼‍🦳", "🧑🏽‍🦳", "🧑🏾‍🦳", "🧑🏿‍🦳", "👩‍🦲", "👩🏻‍🦲", "👩🏼‍🦲", "👩🏽‍🦲", "👩🏾‍🦲", "👩🏿‍🦲", "🧑‍🦲", "🧑🏻‍🦲", "🧑🏼‍🦲", "🧑🏽‍🦲", "🧑🏾‍🦲", "🧑🏿‍🦲", "👱‍♀️", "👱🏻‍♀️", "👱🏼‍♀️", "👱🏽‍♀️", "👱🏾‍♀️", "👱🏿‍♀️", "👱‍♂️", "👱🏻‍♂️", "👱🏼‍♂️", "👱🏽‍♂️", "👱🏾‍♂️", "👱🏿‍♂️", "🧓", "🧓🏻", "🧓🏼", "🧓🏽", "🧓🏾", "🧓🏿", "👴", "👴🏻", "👴🏼", "👴🏽", "👴🏾", "👴🏿", "👵", "👵🏻", "👵🏼", "👵🏽", "👵🏾", "👵🏿", "🙍", "🙍🏻", "🙍🏼", "🙍🏽", "🙍🏾", "🙍🏿", "🙍‍♂️", "🙍🏻‍♂️", "🙍🏼‍♂️", "🙍🏽‍♂️", "🙍🏾‍♂️", "🙍🏿‍♂️", "🙍‍♀️", "🙍🏻‍♀️", "🙍🏼‍♀️", "🙍🏽‍♀️", "🙍🏾‍♀️", "🙍🏿‍♀️", "🙎", "🙎🏻", "🙎🏼", "🙎🏽", "🙎🏾", "🙎🏿", "🙎‍♂️", "🙎🏻‍♂️", "🙎🏼‍♂️", "🙎🏽‍♂️", "🙎🏾‍♂️", "🙎🏿‍♂️", "🙎‍♀️", "🙎🏻‍♀️", "🙎🏼‍♀️", "🙎🏽‍♀️", "🙎🏾‍♀️", "🙎🏿‍♀️", "🙅", "🙅🏻", "🙅🏼", "🙅🏽", "🙅🏾", "🙅🏿", "🙅‍♂️", "🙅🏻‍♂️", "🙅🏼‍♂️", "🙅🏽‍♂️", "🙅🏾‍♂️", "🙅🏿‍♂️", "🙅‍♀️", "🙅🏻‍♀️", "🙅🏼‍♀️", "🙅🏽‍♀️", "🙅🏾‍♀️", "🙅🏿‍♀️", "🙆", "🙆🏻", "🙆🏼", "🙆🏽", "🙆🏾", "🙆🏿", "🙆‍♂️", "🙆🏻‍♂️", "🙆🏼‍♂️", "🙆🏽‍♂️", "🙆🏾‍♂️", "🙆🏿‍♂️", "🙆‍♀️", "🙆🏻‍♀️", "🙆🏼‍♀️", "🙆🏽‍♀️", "🙆🏾‍♀️", "🙆🏿‍♀️", "💁", "💁🏻", "💁🏼", "💁🏽", "💁🏾", "💁🏿", "💁‍♂️", "💁🏻‍♂️", "💁🏼‍♂️", "💁🏽‍♂️", "💁🏾‍♂️", "💁🏿‍♂️", "💁‍♀️", "💁🏻‍♀️", "💁🏼‍♀️", "💁🏽‍♀️", "💁🏾‍♀️", "💁🏿‍♀️", "🙋", "🙋🏻", "🙋🏼", "🙋🏽", "🙋🏾", "🙋🏿", "🙋‍♂️", "🙋🏻‍♂️", "🙋🏼‍♂️", "🙋🏽‍♂️", "🙋🏾‍♂️", "🙋🏿‍♂️", "🙋‍♀️", "🙋🏻‍♀️", "🙋🏼‍♀️", "🙋🏽‍♀️", "🙋🏾‍♀️", "🙋🏿‍♀️", "🧏", "🧏🏻", "🧏🏼", "🧏🏽", "🧏🏾", "🧏🏿", "🧏‍♂️", "🧏🏻‍♂️", "🧏🏼‍♂️", "🧏🏽‍♂️", "🧏🏾‍♂️", "🧏🏿‍♂️", "🧏‍♀️", "🧏🏻‍♀️", "🧏🏼‍♀️", "🧏🏽‍♀️", "🧏🏾‍♀️", "🧏🏿‍♀️", "🙇", "🙇🏻", "🙇🏼", "🙇🏽", "🙇🏾", "🙇🏿", "🙇‍♂️", "🙇🏻‍♂️", "🙇🏼‍♂️", "🙇🏽‍♂️", "🙇🏾‍♂️", "🙇🏿‍♂️", "🙇‍♀️", "🙇🏻‍♀️", "🙇🏼‍♀️", "🙇🏽‍♀️", "🙇🏾‍♀️", "🙇🏿‍♀️", "🤦", "🤦🏻", "🤦🏼", "🤦🏽", "🤦🏾", "🤦🏿", "🤦‍♂️", "🤦🏻‍♂️", "🤦🏼‍♂️", "🤦🏽‍♂️", "🤦🏾‍♂️", "🤦🏿‍♂️", "🤦‍♀️", "🤦🏻‍♀️", "🤦🏼‍♀️", "🤦🏽‍♀️", "🤦🏾‍♀️", "🤦🏿‍♀️", "🤷", "🤷🏻", "🤷🏼", "🤷🏽", "🤷🏾", "🤷🏿", "🤷‍♂️", "🤷🏻‍♂️", "🤷🏼‍♂️", "🤷🏽‍♂️", "🤷🏾‍♂️", "🤷🏿‍♂️", "🤷‍♀️", "🤷🏻‍♀️", "🤷🏼‍♀️", "🤷🏽‍♀️", "🤷🏾‍♀️", "🤷🏿‍♀️", "🧑‍⚕️", "🧑🏻‍⚕️", "🧑🏼‍⚕️", "🧑🏽‍⚕️", "🧑🏾‍⚕️", "🧑🏿‍⚕️", "👨‍⚕️", "👨🏻‍⚕️", "👨🏼‍⚕️", "👨🏽‍⚕️", "👨🏾‍⚕️", "👨🏿‍⚕️", "👩‍⚕️", "👩🏻‍⚕️", "👩🏼‍⚕️", "👩🏽‍⚕️", "👩🏾‍⚕️", "👩🏿‍⚕️", "🧑‍🎓", "🧑🏻‍🎓", "🧑🏼‍🎓", "🧑🏽‍🎓", "🧑🏾‍🎓", "🧑🏿‍🎓", "👨‍🎓", "👨🏻‍🎓", "👨🏼‍🎓", "👨🏽‍🎓", "👨🏾‍🎓", "👨🏿‍🎓", "👩‍🎓", "👩🏻‍🎓", "👩🏼‍🎓", "👩🏽‍🎓", "👩🏾‍🎓", "👩🏿‍🎓", "🧑‍🏫", "🧑🏻‍🏫", "🧑🏼‍🏫", "🧑🏽‍🏫", "🧑🏾‍🏫", "🧑🏿‍🏫", "👨‍🏫", "👨🏻‍🏫", "👨🏼‍🏫", "👨🏽‍🏫", "👨🏾‍🏫", "👨🏿‍🏫", "👩‍🏫", "👩🏻‍🏫", "👩🏼‍🏫", "👩🏽‍🏫", "👩🏾‍🏫", "👩🏿‍🏫", "🧑‍⚖️", "🧑🏻‍⚖️", "🧑🏼‍⚖️", "🧑🏽‍⚖️", "🧑🏾‍⚖️", "🧑🏿‍⚖️", "👨‍⚖️", "👨🏻‍⚖️", "👨🏼‍⚖️", "👨🏽‍⚖️", "👨🏾‍⚖️", "👨🏿‍⚖️", "👩‍⚖️", "👩🏻‍⚖️", "👩🏼‍⚖️", "👩🏽‍⚖️", "👩🏾‍⚖️", "👩🏿‍⚖️", "🧑‍🌾", "🧑🏻‍🌾", "🧑🏼‍🌾", "🧑🏽‍🌾", "🧑🏾‍🌾", "🧑🏿‍🌾", "👨‍🌾", "👨🏻‍🌾", "👨🏼‍🌾", "👨🏽‍🌾", "👨🏾‍🌾", "👨🏿‍🌾", "👩‍🌾", "👩🏻‍🌾", "👩🏼‍🌾", "👩🏽‍🌾", "👩🏾‍🌾", "👩🏿‍🌾", "🧑‍🍳", "🧑🏻‍🍳", "🧑🏼‍🍳", "🧑🏽‍🍳", "🧑🏾‍🍳", "🧑🏿‍🍳", "👨‍🍳", "👨🏻‍🍳", "👨🏼‍🍳", "👨🏽‍🍳", "👨🏾‍🍳", "👨🏿‍🍳", "👩‍🍳", "👩🏻‍🍳", "👩🏼‍🍳", "👩🏽‍🍳", "👩🏾‍🍳", "👩🏿‍🍳", "🧑‍🔧", "🧑🏻‍🔧", "🧑🏼‍🔧", "🧑🏽‍🔧", "🧑🏾‍🔧", "🧑🏿‍🔧", "👨‍🔧", "👨🏻‍🔧", "👨🏼‍🔧", "👨🏽‍🔧", "👨🏾‍🔧", "👨🏿‍🔧", "👩‍🔧", "👩🏻‍🔧", "👩🏼‍🔧", "👩🏽‍🔧", "👩🏾‍🔧", "👩🏿‍🔧", "🧑‍🏭", "🧑🏻‍🏭", "🧑🏼‍🏭", "🧑🏽‍🏭", "🧑🏾‍🏭", "🧑🏿‍🏭", "👨‍🏭", "👨🏻‍🏭", "👨🏼‍🏭", "👨🏽‍🏭", "👨🏾‍🏭", "👨🏿‍🏭", "👩‍🏭", "👩🏻‍🏭", "👩🏼‍🏭", "👩🏽‍🏭", "👩🏾‍🏭", "👩🏿‍🏭", "🧑‍💼", "🧑🏻‍💼", "🧑🏼‍💼", "🧑🏽‍💼", "🧑🏾‍💼", "🧑🏿‍💼", "👨‍💼", "👨🏻‍💼", "👨🏼‍💼", "👨🏽‍💼", "👨🏾‍💼", "👨🏿‍💼", "👩‍💼", "👩🏻‍💼", "👩🏼‍💼", "👩🏽‍💼", "👩🏾‍💼", "👩🏿‍💼", "🧑‍🔬", "🧑🏻‍🔬", "🧑🏼‍🔬", "🧑🏽‍🔬", "🧑🏾‍🔬", "🧑🏿‍🔬", "👨‍🔬", "👨🏻‍🔬", "👨🏼‍🔬", "👨🏽‍🔬", "👨🏾‍🔬", "👨🏿‍🔬", "👩‍🔬", "👩🏻‍🔬", "👩🏼‍🔬", "👩🏽‍🔬", "👩🏾‍🔬", "👩🏿‍🔬", "🧑‍💻", "🧑🏻‍💻", "🧑🏼‍💻", "🧑🏽‍💻", "🧑🏾‍💻", "🧑🏿‍💻", "👨‍💻", "👨🏻‍💻", "👨🏼‍💻", "👨🏽‍💻", "👨🏾‍💻", "👨🏿‍💻", "👩‍💻", "👩🏻‍💻", "👩🏼‍💻", "👩🏽‍💻", "👩🏾‍💻", "👩🏿‍💻", "🧑‍🎤", "🧑🏻‍🎤", "🧑🏼‍🎤", "🧑🏽‍🎤", "🧑🏾‍🎤", "🧑🏿‍🎤", "👨‍🎤", "👨🏻‍🎤", "👨🏼‍🎤", "👨🏽‍🎤", "👨🏾‍🎤", "👨🏿‍🎤", "👩‍🎤", "👩🏻‍🎤", "👩🏼‍🎤", "👩🏽‍🎤", "👩🏾‍🎤", "👩🏿‍🎤", "🧑‍🎨", "🧑🏻‍🎨", "🧑🏼‍🎨", "🧑🏽‍🎨", "🧑🏾‍🎨", "🧑🏿‍🎨", "👨‍🎨", "👨🏻‍🎨", "👨🏼‍🎨", "👨🏽‍🎨", "👨🏾‍🎨", "👨🏿‍🎨", "👩‍🎨", "👩🏻‍🎨", "👩🏼‍🎨", "👩🏽‍🎨", "👩🏾‍🎨", "👩🏿‍🎨", "🧑‍✈️", "🧑🏻‍✈️", "🧑🏼‍✈️", "🧑🏽‍✈️", "🧑🏾‍✈️", "🧑🏿‍✈️", "👨‍✈️", "👨🏻‍✈️", "👨🏼‍✈️", "👨🏽‍✈️", "👨🏾‍✈️", "👨🏿‍✈️", "👩‍✈️", "👩🏻‍✈️", "👩🏼‍✈️", "👩🏽‍✈️", "👩🏾‍✈️", "👩🏿‍✈️", "🧑‍🚀", "🧑🏻‍🚀", "🧑🏼‍🚀", "🧑🏽‍🚀", "🧑🏾‍🚀", "🧑🏿‍🚀", "👨‍🚀", "👨🏻‍🚀", "👨🏼‍🚀", "👨🏽‍🚀", "👨🏾‍🚀", "👨🏿‍🚀", "👩‍🚀", "👩🏻‍🚀", "👩🏼‍🚀", "👩🏽‍🚀", "👩🏾‍🚀", "👩🏿‍🚀", "🧑‍🚒", "🧑🏻‍🚒", "🧑🏼‍🚒", "🧑🏽‍🚒", "🧑🏾‍🚒", "🧑🏿‍🚒", "👨‍🚒", "👨🏻‍🚒", "👨🏼‍🚒", "👨🏽‍🚒", "👨🏾‍🚒", "👨🏿‍🚒", "👩‍🚒", "👩🏻‍🚒", "👩🏼‍🚒", "👩🏽‍🚒", "👩🏾‍🚒", "👩🏿‍🚒", "👮", "👮🏻", "👮🏼", "👮🏽", "👮🏾", "👮🏿", "👮‍♂️", "👮🏻‍♂️", "👮🏼‍♂️", "👮🏽‍♂️", "👮🏾‍♂️", "👮🏿‍♂️", "👮‍♀️", "👮🏻‍♀️", "👮🏼‍♀️", "👮🏽‍♀️", "👮🏾‍♀️", "👮🏿‍♀️", "🕵️", "🕵🏻", "🕵🏼", "🕵🏽", "🕵🏾", "🕵🏿", "🕵️‍♂️", "🕵🏻‍♂️", "🕵🏼‍♂️", "🕵🏽‍♂️", "🕵🏾‍♂️", "🕵🏿‍♂️", "🕵️‍♀️", "🕵🏻‍♀️", "🕵🏼‍♀️", "🕵🏽‍♀️", "🕵🏾‍♀️", "🕵🏿‍♀️", "💂", "💂🏻", "💂🏼", "💂🏽", "💂🏾", "💂🏿", "💂‍♂️", "💂🏻‍♂️", "💂🏼‍♂️", "💂🏽‍♂️", "💂🏾‍♂️", "💂🏿‍♂️", "💂‍♀️", "💂🏻‍♀️", "💂🏼‍♀️", "💂🏽‍♀️", "💂🏾‍♀️", "💂🏿‍♀️", "🥷", "🥷🏻", "🥷🏼", "🥷🏽", "🥷🏾", "🥷🏿", "👷", "👷🏻", "👷🏼", "👷🏽", "👷🏾", "👷🏿", "👷‍♂️", "👷🏻‍♂️", "👷🏼‍♂️", "👷🏽‍♂️", "👷🏾‍♂️", "👷🏿‍♂️", "👷‍♀️", "👷🏻‍♀️", "👷🏼‍♀️", "👷🏽‍♀️", "👷🏾‍♀️", "👷🏿‍♀️", "🫅", "🫅🏻", "🫅🏼", "🫅🏽", "🫅🏾", "🫅🏿", "🤴", "🤴🏻", "🤴🏼", "🤴🏽", "🤴🏾", "🤴🏿", "👸", "👸🏻", "👸🏼", "👸🏽", "👸🏾", "👸🏿", "👳", "👳🏻", "👳🏼", "👳🏽", "👳🏾", "👳🏿", "👳‍♂️", "👳🏻‍♂️", "👳🏼‍♂️", "👳🏽‍♂️", "👳🏾‍♂️", "👳🏿‍♂️", "👳‍♀️", "👳🏻‍♀️", "👳🏼‍♀️", "👳🏽‍♀️", "👳🏾‍♀️", "👳🏿‍♀️", "👲", "👲🏻", "👲🏼", "👲🏽", "👲🏾", "👲🏿", "🧕", "🧕🏻", "🧕🏼", "🧕🏽", "🧕🏾", "🧕🏿", "🤵", "🤵🏻", "🤵🏼", "🤵🏽", "🤵🏾", "🤵🏿", "🤵‍♂️", "🤵🏻‍♂️", "🤵🏼‍♂️", "🤵🏽‍♂️", "🤵🏾‍♂️", "🤵🏿‍♂️", "🤵‍♀️", "🤵🏻‍♀️", "🤵🏼‍♀️", "🤵🏽‍♀️", "🤵🏾‍♀️", "🤵🏿‍♀️", "👰", "👰🏻", "👰🏼", "👰🏽", "👰🏾", "👰🏿", "👰‍♂️", "👰🏻‍♂️", "👰🏼‍♂️", "👰🏽‍♂️", "👰🏾‍♂️", "👰🏿‍♂️", "👰‍♀️", "👰🏻‍♀️", "👰🏼‍♀️", "👰🏽‍♀️", "👰🏾‍♀️", "👰🏿‍♀️", "🤰", "🤰🏻", "🤰🏼", "🤰🏽", "🤰🏾", "🤰🏿", "🫃", "🫃🏻", "🫃🏼", "🫃🏽", "🫃🏾", "🫃🏿", "🫄", "🫄🏻", "🫄🏼", "🫄🏽", "🫄🏾", "🫄🏿", "🤱", "🤱🏻", "🤱🏼", "🤱🏽", "🤱🏾", "🤱🏿", "👩‍🍼", "👩🏻‍🍼", "👩🏼‍🍼", "👩🏽‍🍼", "👩🏾‍🍼", "👩🏿‍🍼", "👨‍🍼", "👨🏻‍🍼", "👨🏼‍🍼", "👨🏽‍🍼", "👨🏾‍🍼", "👨🏿‍🍼", "🧑‍🍼", "🧑🏻‍🍼", "🧑🏼‍🍼", "🧑🏽‍🍼", "🧑🏾‍🍼", "🧑🏿‍🍼", "👼", "👼🏻", "👼🏼", "👼🏽", "👼🏾", "👼🏿", "🎅", "🎅🏻", "🎅🏼", "🎅🏽", "🎅🏾", "🎅🏿", "🤶", "🤶🏻", "🤶🏼", "🤶🏽", "🤶🏾", "🤶🏿", "🧑‍🎄", "🧑🏻‍🎄", "🧑🏼‍🎄", "🧑🏽‍🎄", "🧑🏾‍🎄", "🧑🏿‍🎄", "🦸", "🦸🏻", "🦸🏼", "🦸🏽", "🦸🏾", "🦸🏿", "🦸‍♂️", "🦸🏻‍♂️", "🦸🏼‍♂️", "🦸🏽‍♂️", "🦸🏾‍♂️", "🦸🏿‍♂️", "🦸‍♀️", "🦸🏻‍♀️", "🦸🏼‍♀️", "🦸🏽‍♀️", "🦸🏾‍♀️", "🦸🏿‍♀️", "🦹", "🦹🏻", "🦹🏼", "🦹🏽", "🦹🏾", "🦹🏿", "🦹‍♂️", "🦹🏻‍♂️", "🦹🏼‍♂️", "🦹🏽‍♂️", "🦹🏾‍♂️", "🦹🏿‍♂️", "🦹‍♀️", "🦹🏻‍♀️", "🦹🏼‍♀️", "🦹🏽‍♀️", "🦹🏾‍♀️", "🦹🏿‍♀️", "🧙", "🧙🏻", "🧙🏼", "🧙🏽", "🧙🏾", "🧙🏿", "🧙‍♂️", "🧙🏻‍♂️", "🧙🏼‍♂️", "🧙🏽‍♂️", "🧙🏾‍♂️", "🧙🏿‍♂️", "🧙‍♀️", "🧙🏻‍♀️", "🧙🏼‍♀️", "🧙🏽‍♀️", "🧙🏾‍♀️", "🧙🏿‍♀️", "🧚", "🧚🏻", "🧚🏼", "🧚🏽", "🧚🏾", "🧚🏿", "🧚‍♂️", "🧚🏻‍♂️", "🧚🏼‍♂️", "🧚🏽‍♂️", "🧚🏾‍♂️", "🧚🏿‍♂️", "🧚‍♀️", "🧚🏻‍♀️", "🧚🏼‍♀️", "🧚🏽‍♀️", "🧚🏾‍♀️", "🧚🏿‍♀️", "🧛", "🧛🏻", "🧛🏼", "🧛🏽", "🧛🏾", "🧛🏿", "🧛‍♂️", "🧛🏻‍♂️", "🧛🏼‍♂️", "🧛🏽‍♂️", "🧛🏾‍♂️", "🧛🏿‍♂️", "🧛‍♀️", "🧛🏻‍♀️", "🧛🏼‍♀️", "🧛🏽‍♀️", "🧛🏾‍♀️", "🧛🏿‍♀️", "🧜", "🧜🏻", "🧜🏼", "🧜🏽", "🧜🏾", "🧜🏿", "🧜‍♂️", "🧜🏻‍♂️", "🧜🏼‍♂️", "🧜🏽‍♂️", "🧜🏾‍♂️", "🧜🏿‍♂️", "🧜‍♀️", "🧜🏻‍♀️", "🧜🏼‍♀️", "🧜🏽‍♀️", "🧜🏾‍♀️", "🧜🏿‍♀️", "🧝", "🧝🏻", "🧝🏼", "🧝🏽", "🧝🏾", "🧝🏿", "🧝‍♂️", "🧝🏻‍♂️", "🧝🏼‍♂️", "🧝🏽‍♂️", "🧝🏾‍♂️", "🧝🏿‍♂️", "🧝‍♀️", "🧝🏻‍♀️", "🧝🏼‍♀️", "🧝🏽‍♀️", "🧝🏾‍♀️", "🧝🏿‍♀️", "🧞", "🧞‍♂️", "🧞‍♀️", "🧟", "🧟‍♂️", "🧟‍♀️", "🧌", "💆", "💆🏻", "💆🏼", "💆🏽", "💆🏾", "💆🏿", "💆‍♂️", "💆🏻‍♂️", "💆🏼‍♂️", "💆🏽‍♂️", "💆🏾‍♂️", "💆🏿‍♂️", "💆‍♀️", "💆🏻‍♀️", "💆🏼‍♀️", "💆🏽‍♀️", "💆🏾‍♀️", "💆🏿‍♀️", "💇", "💇🏻", "💇🏼", "💇🏽", "💇🏾", "💇🏿", "💇‍♂️", "💇🏻‍♂️", "💇🏼‍♂️", "💇🏽‍♂️", "💇🏾‍♂️", "💇🏿‍♂️", "💇‍♀️", "💇🏻‍♀️", "💇🏼‍♀️", "💇🏽‍♀️", "💇🏾‍♀️", "💇🏿‍♀️", "🚶", "🚶🏻", "🚶🏼", "🚶🏽", "🚶🏾", "🚶🏿", "🚶‍♂️", "🚶🏻‍♂️", "🚶🏼‍♂️", "🚶🏽‍♂️", "🚶🏾‍♂️", "🚶🏿‍♂️", "🚶‍♀️", "🚶🏻‍♀️", "🚶🏼‍♀️", "🚶🏽‍♀️", "🚶🏾‍♀️", "🚶🏿‍♀️", "🧍", "🧍🏻", "🧍🏼", "🧍🏽", "🧍🏾", "🧍🏿", "🧍‍♂️", "🧍🏻‍♂️", "🧍🏼‍♂️", "🧍🏽‍♂️", "🧍🏾‍♂️", "🧍🏿‍♂️", "🧍‍♀️", "🧍🏻‍♀️", "🧍🏼‍♀️", "🧍🏽‍♀️", "🧍🏾‍♀️", "🧍🏿‍♀️", "🧎", "🧎🏻", "🧎🏼", "🧎🏽", "🧎🏾", "🧎🏿", "🧎‍♂️", "🧎🏻‍♂️", "🧎🏼‍♂️", "🧎🏽‍♂️", "🧎🏾‍♂️", "🧎🏿‍♂️", "🧎‍♀️", "🧎🏻‍♀️", "🧎🏼‍♀️", "🧎🏽‍♀️", "🧎🏾‍♀️", "🧎🏿‍♀️", "🧑‍🦯", "🧑🏻‍🦯", "🧑🏼‍🦯", "🧑🏽‍🦯", "🧑🏾‍🦯", "🧑🏿‍🦯", "👨‍🦯", "👨🏻‍🦯", "👨🏼‍🦯", "👨🏽‍🦯", "👨🏾‍🦯", "👨🏿‍🦯", "👩‍🦯", "👩🏻‍🦯", "👩🏼‍🦯", "👩🏽‍🦯", "👩🏾‍🦯", "👩🏿‍🦯", "🧑‍🦼", "🧑🏻‍🦼", "🧑🏼‍🦼", "🧑🏽‍🦼", "🧑🏾‍🦼", "🧑🏿‍🦼", "👨‍🦼", "👨🏻‍🦼", "👨🏼‍🦼", "👨🏽‍🦼", "👨🏾‍🦼", "👨🏿‍🦼", "👩‍🦼", "👩🏻‍🦼", "👩🏼‍🦼", "👩🏽‍🦼", "👩🏾‍🦼", "👩🏿‍🦼", "🧑‍🦽", "🧑🏻‍🦽", "🧑🏼‍🦽", "🧑🏽‍🦽", "🧑🏾‍🦽", "🧑🏿‍🦽", "👨‍🦽", "👨🏻‍🦽", "👨🏼‍🦽", "👨🏽‍🦽", "👨🏾‍🦽", "👨🏿‍🦽", "👩‍🦽", "👩🏻‍🦽", "👩🏼‍🦽", "👩🏽‍🦽", "👩🏾‍🦽", "👩🏿‍🦽", "🏃", "🏃🏻", "🏃🏼", "🏃🏽", "🏃🏾", "🏃🏿", "🏃‍♂️", "🏃🏻‍♂️", "🏃🏼‍♂️", "🏃🏽‍♂️", "🏃🏾‍♂️", "🏃🏿‍♂️", "🏃‍♀️", "🏃🏻‍♀️", "🏃🏼‍♀️", "🏃🏽‍♀️", "🏃🏾‍♀️", "🏃🏿‍♀️", "💃", "💃🏻", "💃🏼", "💃🏽", "💃🏾", "💃🏿", "🕺", "🕺🏻", "🕺🏼", "🕺🏽", "🕺🏾", "🕺🏿", "🕴️", "🕴🏻", "🕴🏼", "🕴🏽", "🕴🏾", "🕴🏿", "👯", "👯‍♂️", "👯‍♀️", "🧖", "🧖🏻", "🧖🏼", "🧖🏽", "🧖🏾", "🧖🏿", "🧖‍♂️", "🧖🏻‍♂️", "🧖🏼‍♂️", "🧖🏽‍♂️", "🧖🏾‍♂️", "🧖🏿‍♂️", "🧖‍♀️", "🧖🏻‍♀️", "🧖🏼‍♀️", "🧖🏽‍♀️", "🧖🏾‍♀️", "🧖🏿‍♀️", "🧗", "🧗🏻", "🧗🏼", "🧗🏽", "🧗🏾", "🧗🏿", "🧗‍♂️", "🧗🏻‍♂️", "🧗🏼‍♂️", "🧗🏽‍♂️", "🧗🏾‍♂️", "🧗🏿‍♂️", "🧗‍♀️", "🧗🏻‍♀️", "🧗🏼‍♀️", "🧗🏽‍♀️", "🧗🏾‍♀️", "🧗🏿‍♀️", "🤺", "🏇", "🏇🏻", "🏇🏼", "🏇🏽", "🏇🏾", "🏇🏿", "⛷️", "🏂", "🏂🏻", "🏂🏼", "🏂🏽", "🏂🏾", "🏂🏿", "🏌️", "🏌🏻", "🏌🏼", "🏌🏽", "🏌🏾", "🏌🏿", "🏌️‍♂️", "🏌🏻‍♂️", "🏌🏼‍♂️", "🏌🏽‍♂️", "🏌🏾‍♂️", "🏌🏿‍♂️", "🏌️‍♀️", "🏌🏻‍♀️", "🏌🏼‍♀️", "🏌🏽‍♀️", "🏌🏾‍♀️", "🏌🏿‍♀️", "🏄", "🏄🏻", "🏄🏼", "🏄🏽", "🏄🏾", "🏄🏿", "🏄‍♂️", "🏄🏻‍♂️", "🏄🏼‍♂️", "🏄🏽‍♂️", "🏄🏾‍♂️", "🏄🏿‍♂️", "🏄‍♀️", "🏄🏻‍♀️", "🏄🏼‍♀️", "🏄🏽‍♀️", "🏄🏾‍♀️", "🏄🏿‍♀️", "🚣", "🚣🏻", "🚣🏼", "🚣🏽", "🚣🏾", "🚣🏿", "🚣‍♂️", "🚣🏻‍♂️", "🚣🏼‍♂️", "🚣🏽‍♂️", "🚣🏾‍♂️", "🚣🏿‍♂️", "🚣‍♀️", "🚣🏻‍♀️", "🚣🏼‍♀️", "🚣🏽‍♀️", "🚣🏾‍♀️", "🚣🏿‍♀️", "🏊", "🏊🏻", "🏊🏼", "🏊🏽", "🏊🏾", "🏊🏿", "🏊‍♂️", "🏊🏻‍♂️", "🏊🏼‍♂️", "🏊🏽‍♂️", "🏊🏾‍♂️", "🏊🏿‍♂️", "🏊‍♀️", "🏊🏻‍♀️", "🏊🏼‍♀️", "🏊🏽‍♀️", "🏊🏾‍♀️", "🏊🏿‍♀️", "⛹️", "⛹🏻", "⛹🏼", "⛹🏽", "⛹🏾", "⛹🏿", "⛹️‍♂️", "⛹🏻‍♂️", "⛹🏼‍♂️", "⛹🏽‍♂️", "⛹🏾‍♂️", "⛹🏿‍♂️", "⛹️‍♀️", "⛹🏻‍♀️", "⛹🏼‍♀️", "⛹🏽‍♀️", "⛹🏾‍♀️", "⛹🏿‍♀️", "🏋️", "🏋🏻", "🏋🏼", "🏋🏽", "🏋🏾", "🏋🏿", "🏋️‍♂️", "🏋🏻‍♂️", "🏋🏼‍♂️", "🏋🏽‍♂️", "🏋🏾‍♂️", "🏋🏿‍♂️", "🏋️‍♀️", "🏋🏻‍♀️", "🏋🏼‍♀️", "🏋🏽‍♀️", "🏋🏾‍♀️", "🏋🏿‍♀️", "🚴", "🚴🏻", "🚴🏼", "🚴🏽", "🚴🏾", "🚴🏿", "🚴‍♂️", "🚴🏻‍♂️", "🚴🏼‍♂️", "🚴🏽‍♂️", "🚴🏾‍♂️", "🚴🏿‍♂️", "🚴‍♀️", "🚴🏻‍♀️", "🚴🏼‍♀️", "🚴🏽‍♀️", "🚴🏾‍♀️", "🚴🏿‍♀️", "🚵", "🚵🏻", "🚵🏼", "🚵🏽", "🚵🏾", "🚵🏿", "🚵‍♂️", "🚵🏻‍♂️", "🚵🏼‍♂️", "🚵🏽‍♂️", "🚵🏾‍♂️", "🚵🏿‍♂️", "🚵‍♀️", "🚵🏻‍♀️", "🚵🏼‍♀️", "🚵🏽‍♀️", "🚵🏾‍♀️", "🚵🏿‍♀️", "🤸", "🤸🏻", "🤸🏼", "🤸🏽", "🤸🏾", "🤸🏿", "🤸‍♂️", "🤸🏻‍♂️", "🤸🏼‍♂️", "🤸🏽‍♂️", "🤸🏾‍♂️", "🤸🏿‍♂️", "🤸‍♀️", "🤸🏻‍♀️", "🤸🏼‍♀️", "🤸🏽‍♀️", "🤸🏾‍♀️", "🤸🏿‍♀️", "🤼", "🤼‍♂️", "🤼‍♀️", "🤽", "🤽🏻", "🤽🏼", "🤽🏽", "🤽🏾", "🤽🏿", "🤽‍♂️", "🤽🏻‍♂️", "🤽🏼‍♂️", "🤽🏽‍♂️", "🤽🏾‍♂️", "🤽🏿‍♂️", "🤽‍♀️", "🤽🏻‍♀️", "🤽🏼‍♀️", "🤽🏽‍♀️", "🤽🏾‍♀️", "🤽🏿‍♀️", "🤾", "🤾🏻", "🤾🏼", "🤾🏽", "🤾🏾", "🤾🏿", "🤾‍♂️", "🤾🏻‍♂️", "🤾🏼‍♂️", "🤾🏽‍♂️", "🤾🏾‍♂️", "🤾🏿‍♂️", "🤾‍♀️", "🤾🏻‍♀️", "🤾🏼‍♀️", "🤾🏽‍♀️", "🤾🏾‍♀️", "🤾🏿‍♀️", "🤹", "🤹🏻", "🤹🏼", "🤹🏽", "🤹🏾", "🤹🏿", "🤹‍♂️", "🤹🏻‍♂️", "🤹🏼‍♂️", "🤹🏽‍♂️", "🤹🏾‍♂️", "🤹🏿‍♂️", "🤹‍♀️", "🤹🏻‍♀️", "🤹🏼‍♀️", "🤹🏽‍♀️", "🤹🏾‍♀️", "🤹🏿‍♀️", "🧘", "🧘🏻", "🧘🏼", "🧘🏽", "🧘🏾", "🧘🏿", "🧘‍♂️", "🧘🏻‍♂️", "🧘🏼‍♂️", "🧘🏽‍♂️", "🧘🏾‍♂️", "🧘🏿‍♂️", "🧘‍♀️", "🧘🏻‍♀️", "🧘🏼‍♀️", "🧘🏽‍♀️", "🧘🏾‍♀️", "🧘🏿‍♀️", "🛀", "🛀🏻", "🛀🏼", "🛀🏽", "🛀🏾", "🛀🏿", "🛌", "🛌🏻", "🛌🏼", "🛌🏽", "🛌🏾", "🛌🏿", "🧑‍🤝‍🧑", "🧑🏻‍🤝‍🧑🏻", "🧑🏻‍🤝‍🧑🏼", "🧑🏻‍🤝‍🧑🏽", "🧑🏻‍🤝‍🧑🏾", "🧑🏻‍🤝‍🧑🏿", "🧑🏼‍🤝‍🧑🏻", "🧑🏼‍🤝‍🧑🏼", "🧑🏼‍🤝‍🧑🏽", "🧑🏼‍🤝‍🧑🏾", "🧑🏼‍🤝‍🧑🏿", "🧑🏽‍🤝‍🧑🏻", "🧑🏽‍🤝‍🧑🏼", "🧑🏽‍🤝‍🧑🏽", "🧑🏽‍🤝‍🧑🏾", "🧑🏽‍🤝‍🧑🏿", "🧑🏾‍🤝‍🧑🏻", "🧑🏾‍🤝‍🧑🏼", "🧑🏾‍🤝‍🧑🏽", "🧑🏾‍🤝‍🧑🏾", "🧑🏾‍🤝‍🧑🏿", "🧑🏿‍🤝‍🧑🏻", "🧑🏿‍🤝‍🧑🏼", "🧑🏿‍🤝‍🧑🏽", "🧑🏿‍🤝‍🧑🏾", "🧑🏿‍🤝‍🧑🏿", "👭", "👭🏻", "👩🏻‍🤝‍👩🏼", "👩🏻‍🤝‍👩🏽", "👩🏻‍🤝‍👩🏾", "👩🏻‍🤝‍👩🏿", "👩🏼‍🤝‍👩🏻", "👭🏼", "👩🏼‍🤝‍👩🏽", "👩🏼‍🤝‍👩🏾", "👩🏼‍🤝‍👩🏿", "👩🏽‍🤝‍👩🏻", "👩🏽‍🤝‍👩🏼", "👭🏽", "👩🏽‍🤝‍👩🏾", "👩🏽‍🤝‍👩🏿", "👩🏾‍🤝‍👩🏻", "👩🏾‍🤝‍👩🏼", "👩🏾‍🤝‍👩🏽", "👭🏾", "👩🏾‍🤝‍👩🏿", "👩🏿‍🤝‍👩🏻", "👩🏿‍🤝‍👩🏼", "👩🏿‍🤝‍👩🏽", "👩🏿‍🤝‍👩🏾", "👭🏿", "👫", "👫🏻", "👩🏻‍🤝‍👨🏼", "👩🏻‍🤝‍👨🏽", "👩🏻‍🤝‍👨🏾", "👩🏻‍🤝‍👨🏿", "👩🏼‍🤝‍👨🏻", "👫🏼", "👩🏼‍🤝‍👨🏽", "👩🏼‍🤝‍👨🏾", "👩🏼‍🤝‍👨🏿", "👩🏽‍🤝‍👨🏻", "👩🏽‍🤝‍👨🏼", "👫🏽", "👩🏽‍🤝‍👨🏾", "👩🏽‍🤝‍👨🏿", "👩🏾‍🤝‍👨🏻", "👩🏾‍🤝‍👨🏼", "👩🏾‍🤝‍👨🏽", "👫🏾", "👩🏾‍🤝‍👨🏿", "👩🏿‍🤝‍👨🏻", "👩🏿‍🤝‍👨🏼", "👩🏿‍🤝‍👨🏽", "👩🏿‍🤝‍👨🏾", "👫🏿", "👬", "👬🏻", "👨🏻‍🤝‍👨🏼", "👨🏻‍🤝‍👨🏽", "👨🏻‍🤝‍👨🏾", "👨🏻‍🤝‍👨🏿", "👨🏼‍🤝‍👨🏻", "👬🏼", "👨🏼‍🤝‍👨🏽", "👨🏼‍🤝‍👨🏾", "👨🏼‍🤝‍👨🏿", "👨🏽‍🤝‍👨🏻", "👨🏽‍🤝‍👨🏼", "👬🏽", "👨🏽‍🤝‍👨🏾", "👨🏽‍🤝‍👨🏿", "👨🏾‍🤝‍👨🏻", "👨🏾‍🤝‍👨🏼", "👨🏾‍🤝‍👨🏽", "👬🏾", "👨🏾‍🤝‍👨🏿", "👨🏿‍🤝‍👨🏻", "👨🏿‍🤝‍👨🏼", "👨🏿‍🤝‍👨🏽", "👨🏿‍🤝‍👨🏾", "👬🏿", "💏", "💏🏻", "💏🏼", "💏🏽", "💏🏾", "💏🏿", "🧑🏻‍❤️‍💋‍🧑🏼", "🧑🏻‍❤️‍💋‍🧑🏽", "🧑🏻‍❤️‍💋‍🧑🏾", "🧑🏻‍❤️‍💋‍🧑🏿", "🧑🏼‍❤️‍💋‍🧑🏻", "🧑🏼‍❤️‍💋‍🧑🏽", "🧑🏼‍❤️‍💋‍🧑🏾", "🧑🏼‍❤️‍💋‍🧑🏿", "🧑🏽‍❤️‍💋‍🧑🏻", "🧑🏽‍❤️‍💋‍🧑🏼", "🧑🏽‍❤️‍💋‍🧑🏾", "🧑🏽‍❤️‍💋‍🧑🏿", "🧑🏾‍❤️‍💋‍🧑🏻", "🧑🏾‍❤️‍💋‍🧑🏼", "🧑🏾‍❤️‍💋‍🧑🏽", "🧑🏾‍❤️‍💋‍🧑🏿", "🧑🏿‍❤️‍💋‍🧑🏻", "🧑🏿‍❤️‍💋‍🧑🏼", "🧑🏿‍❤️‍💋‍🧑🏽", "🧑🏿‍❤️‍💋‍🧑🏾", "👩‍❤️‍💋‍👨", "👩🏻‍❤️‍💋‍👨🏻", "👩🏻‍❤️‍💋‍👨🏼", "👩🏻‍❤️‍💋‍👨🏽", "👩🏻‍❤️‍💋‍👨🏾", "👩🏻‍❤️‍💋‍👨🏿", "👩🏼‍❤️‍💋‍👨🏻", "👩🏼‍❤️‍💋‍👨🏼", "👩🏼‍❤️‍💋‍👨🏽", "👩🏼‍❤️‍💋‍👨🏾", "👩🏼‍❤️‍💋‍👨🏿", "👩🏽‍❤️‍💋‍👨🏻", "👩🏽‍❤️‍💋‍👨🏼", "👩🏽‍❤️‍💋‍👨🏽", "👩🏽‍❤️‍💋‍👨🏾", "👩🏽‍❤️‍💋‍👨🏿", "👩🏾‍❤️‍💋‍👨🏻", "👩🏾‍❤️‍💋‍👨🏼", "👩🏾‍❤️‍💋‍👨🏽", "👩🏾‍❤️‍💋‍👨🏾", "👩🏾‍❤️‍💋‍👨🏿", "👩🏿‍❤️‍💋‍👨🏻", "👩🏿‍❤️‍💋‍👨🏼", "👩🏿‍❤️‍💋‍👨🏽", "👩🏿‍❤️‍💋‍👨🏾", "👩🏿‍❤️‍💋‍👨🏿", "👨‍❤️‍💋‍👨", "👨🏻‍❤️‍💋‍👨🏻", "👨🏻‍❤️‍💋‍👨🏼", "👨🏻‍❤️‍💋‍👨🏽", "👨🏻‍❤️‍💋‍👨🏾", "👨🏻‍❤️‍💋‍👨🏿", "👨🏼‍❤️‍💋‍👨🏻", "👨🏼‍❤️‍💋‍👨🏼", "👨🏼‍❤️‍💋‍👨🏽", "👨🏼‍❤️‍💋‍👨🏾", "👨🏼‍❤️‍💋‍👨🏿", "👨🏽‍❤️‍💋‍👨🏻", "👨🏽‍❤️‍💋‍👨🏼", "👨🏽‍❤️‍💋‍👨🏽", "👨🏽‍❤️‍💋‍👨🏾", "👨🏽‍❤️‍💋‍👨🏿", "👨🏾‍❤️‍💋‍👨🏻", "👨🏾‍❤️‍💋‍👨🏼", "👨🏾‍❤️‍💋‍👨🏽", "👨🏾‍❤️‍💋‍👨🏾", "👨🏾‍❤️‍💋‍👨🏿", "👨🏿‍❤️‍💋‍👨🏻", "👨🏿‍❤️‍💋‍👨🏼", "👨🏿‍❤️‍💋‍👨🏽", "👨🏿‍❤️‍💋‍👨🏾", "👨🏿‍❤️‍💋‍👨🏿", "👩‍❤️‍💋‍👩", "👩🏻‍❤️‍💋‍👩🏻", "👩🏻‍❤️‍💋‍👩🏼", "👩🏻‍❤️‍💋‍👩🏽", "👩🏻‍❤️‍💋‍👩🏾", "👩🏻‍❤️‍💋‍👩🏿", "👩🏼‍❤️‍💋‍👩🏻", "👩🏼‍❤️‍💋‍👩🏼", "👩🏼‍❤️‍💋‍👩🏽", "👩🏼‍❤️‍💋‍👩🏾", "👩🏼‍❤️‍💋‍👩🏿", "👩🏽‍❤️‍💋‍👩🏻", "👩🏽‍❤️‍💋‍👩🏼", "👩🏽‍❤️‍💋‍👩🏽", "👩🏽‍❤️‍💋‍👩🏾", "👩🏽‍❤️‍💋‍👩🏿", "👩🏾‍❤️‍💋‍👩🏻", "👩🏾‍❤️‍💋‍👩🏼", "👩🏾‍❤️‍💋‍👩🏽", "👩🏾‍❤️‍💋‍👩🏾", "👩🏾‍❤️‍💋‍👩🏿", "👩🏿‍❤️‍💋‍👩🏻", "👩🏿‍❤️‍💋‍👩🏼", "👩🏿‍❤️‍💋‍👩🏽", "👩🏿‍❤️‍💋‍👩🏾", "👩🏿‍❤️‍💋‍👩🏿", "💑", "💑🏻", "💑🏼", "💑🏽", "💑🏾", "💑🏿", "🧑🏻‍❤️‍🧑🏼", "🧑🏻‍❤️‍🧑🏽", "🧑🏻‍❤️‍🧑🏾", "🧑🏻‍❤️‍🧑🏿", "🧑🏼‍❤️‍🧑🏻", "🧑🏼‍❤️‍🧑🏽", "🧑🏼‍❤️‍🧑🏾", "🧑🏼‍❤️‍🧑🏿", "🧑🏽‍❤️‍🧑🏻", "🧑🏽‍❤️‍🧑🏼", "🧑🏽‍❤️‍🧑🏾", "🧑🏽‍❤️‍🧑🏿", "🧑🏾‍❤️‍🧑🏻", "🧑🏾‍❤️‍🧑🏼", "🧑🏾‍❤️‍🧑🏽", "🧑🏾‍❤️‍🧑🏿", "🧑🏿‍❤️‍🧑🏻", "🧑🏿‍❤️‍🧑🏼", "🧑🏿‍❤️‍🧑🏽", "🧑🏿‍❤️‍🧑🏾", "👩‍❤️‍👨", "👩🏻‍❤️‍👨🏻", "👩🏻‍❤️‍👨🏼", "👩🏻‍❤️‍👨🏽", "👩🏻‍❤️‍👨🏾", "👩🏻‍❤️‍👨🏿", "👩🏼‍❤️‍👨🏻", "👩🏼‍❤️‍👨🏼", "👩🏼‍❤️‍👨🏽", "👩🏼‍❤️‍👨🏾", "👩🏼‍❤️‍👨🏿", "👩🏽‍❤️‍👨🏻", "👩🏽‍❤️‍👨🏼", "👩🏽‍❤️‍👨🏽", "👩🏽‍❤️‍👨🏾", "👩🏽‍❤️‍👨🏿", "👩🏾‍❤️‍👨🏻", "👩🏾‍❤️‍👨🏼", "👩🏾‍❤️‍👨🏽", "👩🏾‍❤️‍👨🏾", "👩🏾‍❤️‍👨🏿", "👩🏿‍❤️‍👨🏻", "👩🏿‍❤️‍👨🏼", "👩🏿‍❤️‍👨🏽", "👩🏿‍❤️‍👨🏾", "👩🏿‍❤️‍👨🏿", "👨‍❤️‍👨", "👨🏻‍❤️‍👨🏻", "👨🏻‍❤️‍👨🏼", "👨🏻‍❤️‍👨🏽", "👨🏻‍❤️‍👨🏾", "👨🏻‍❤️‍👨🏿", "👨🏼‍❤️‍👨🏻", "👨🏼‍❤️‍👨🏼", "👨🏼‍❤️‍👨🏽", "👨🏼‍❤️‍👨🏾", "👨🏼‍❤️‍👨🏿", "👨🏽‍❤️‍👨🏻", "👨🏽‍❤️‍👨🏼", "👨🏽‍❤️‍👨🏽", "👨🏽‍❤️‍👨🏾", "👨🏽‍❤️‍👨🏿", "👨🏾‍❤️‍👨🏻", "👨🏾‍❤️‍👨🏼", "👨🏾‍❤️‍👨🏽", "👨🏾‍❤️‍👨🏾", "👨🏾‍❤️‍👨🏿", "👨🏿‍❤️‍👨🏻", "👨🏿‍❤️‍👨🏼", "👨🏿‍❤️‍👨🏽", "👨🏿‍❤️‍👨🏾", "👨🏿‍❤️‍👨🏿", "👩‍❤️‍👩", "👩🏻‍❤️‍👩🏻", "👩🏻‍❤️‍👩🏼", "👩🏻‍❤️‍👩🏽", "👩🏻‍❤️‍👩🏾", "👩🏻‍❤️‍👩🏿", "👩🏼‍❤️‍👩🏻", "👩🏼‍❤️‍👩🏼", "👩🏼‍❤️‍👩🏽", "👩🏼‍❤️‍👩🏾", "👩🏼‍❤️‍👩🏿", "👩🏽‍❤️‍👩🏻", "👩🏽‍❤️‍👩🏼", "👩🏽‍❤️‍👩🏽", "👩🏽‍❤️‍👩🏾", "👩🏽‍❤️‍👩🏿", "👩🏾‍❤️‍👩🏻", "👩🏾‍❤️‍👩🏼", "👩🏾‍❤️‍👩🏽", "👩🏾‍❤️‍👩🏾", "👩🏾‍❤️‍👩🏿", "👩🏿‍❤️‍👩🏻", "👩🏿‍❤️‍👩🏼", "👩🏿‍❤️‍👩🏽", "👩🏿‍❤️‍👩🏾", "👩🏿‍❤️‍👩🏿", "👪", "👨‍👩‍👦", "👨‍👩‍👧", "👨‍👩‍👧‍👦", "👨‍👩‍👦‍👦", "👨‍👩‍👧‍👧", "👨‍👨‍👦", "👨‍👨‍👧", "👨‍👨‍👧‍👦", "👨‍👨‍👦‍👦", "👨‍👨‍👧‍👧", "👩‍👩‍👦", "👩‍👩‍👧", "👩‍👩‍👧‍👦", "👩‍👩‍👦‍👦", "👩‍👩‍👧‍👧", "👨‍👦", "👨‍👦‍👦", "👨‍👧", "👨‍👧‍👦", "👨‍👧‍👧", "👩‍👦", "👩‍👦‍👦", "👩‍👧", "👩‍👧‍👦", "👩‍👧‍👧", "🗣️", "👤", "👥", "🫂", "👣", "🐵", "🐒", "🦍", "🦧", "🐶", "🐕", "🦮", "🐕‍🦺", "🐩", "🐺", "🦊", "🦝", "🐱", "🐈", "🐈‍⬛", "🦁", "🐯", "🐅", "🐆", "🐴", "🐎", "🦄", "🦓", "🦌", "🦬", "🐮", "🐂", "🐃", "🐄", "🐷", "🐖", "🐗", "🐽", "🐏", "🐑", "🐐", "🐪", "🐫", "🦙", "🦒", "🐘", "🦣", "🦏", "🦛", "🐭", "🐁", "🐀", "🐹", "🐰", "🐇", "🐿️", "🦫", "🦔", "🦇", "🐻", "🐻‍❄️", "🐨", "🐼", "🦥", "🦦", "🦨", "🦘", "🦡", "🐾", "🦃", "🐔", "🐓", "🐣", "🐤", "🐥", "🐦", "🐧", "🕊️", "🦅", "🦆", "🦢", "🦉", "🦤", "🪶", "🦩", "🦚", "🦜", "🐸", "🐊", "🐢", "🦎", "🐍", "🐲", "🐉", "🦕", "🦖", "🐳", "🐋", "🐬", "🦭", "🐟", "🐠", "🐡", "🦈", "🐙", "🐚", "🪸", "🐌", "🦋", "🐛", "🐜", "🐝", "🪲", "🐞", "🦗", "🪳", "🕷️", "🕸️", "🦂", "🦟", "🪰", "🪱", "🦠", "💐", "🌸", "💮", "🪷", "🏵️", "🌹", "🥀", "🌺", "🌻", "🌼", "🌷", "🌱", "🪴", "🌲", "🌳", "🌴", "🌵", "🌾", "🌿", "☘️", "🍀", "🍁", "🍂", "🍃", "🪹", "🪺", "🍇", "🍈", "🍉", "🍊", "🍋", "🍌", "🍍", "🥭", "🍎", "🍏", "🍐", "🍑", "🍒", "🍓", "🫐", "🥝", "🍅", "🫒", "🥥", "🥑", "🍆", "🥔", "🥕", "🌽", "🌶️", "🫑", "🥒", "🥬", "🥦", "🧄", "🧅", "🍄", "🥜", "🫘", "🌰", "🍞", "🥐", "🥖", "🫓", "🥨", "🥯", "🥞", "🧇", "🧀", "🍖", "🍗", "🥩", "🥓", "🍔", "🍟", "🍕", "🌭", "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🥚", "🍳", "🥘", "🍲", "🫕", "🥣", "🥗", "🍿", "🧈", "🧂", "🥫", "🍱", "🍘", "🍙", "🍚", "🍛", "🍜", "🍝", "🍠", "🍢", "🍣", "🍤", "🍥", "🥮", "🍡", "🥟", "🥠", "🥡", "🦀", "🦞", "🦐", "🦑", "🦪", "🍦", "🍧", "🍨", "🍩", "🍪", "🎂", "🍰", "🧁", "🥧", "🍫", "🍬", "🍭", "🍮", "🍯", "🍼", "🥛", "☕", "🫖", "🍵", "🍶", "🍾", "🍷", "🍸", "🍹", "🍺", "🍻", "🥂", "🥃", "🫗", "🥤", "🧋", "🧃", "🧉", "🧊", "🥢", "🍽️", "🍴", "🥄", "🔪", "🫙", "🏺", "🌍", "🌎", "🌏", "🌐", "🗺️", "🗾", "🧭", "🏔️", "⛰️", "🌋", "🗻", "🏕️", "🏖️", "🏜️", "🏝️", "🏞️", "🏟️", "🏛️", "🏗️", "🧱", "🪨", "🪵", "🛖", "🏘️", "🏚️", "🏠", "🏡", "🏢", "🏣", "🏤", "🏥", "🏦", "🏨", "🏩", "🏪", "🏫", "🏬", "🏭", "🏯", "🏰", "💒", "🗼", "🗽", "⛪", "🕌", "🛕", "🕍", "⛩️", "🕋", "⛲", "⛺", "🌁", "🌃", "🏙️", "🌄", "🌅", "🌆", "🌇", "🌉", "♨️", "🎠", "🛝", "🎡", "🎢", "💈", "🎪", "🚂", "🚃", "🚄", "🚅", "🚆", "🚇", "🚈", "🚉", "🚊", "🚝", "🚞", "🚋", "🚌", "🚍", "🚎", "🚐", "🚑", "🚒", "🚓", "🚔", "🚕", "🚖", "🚗", "🚘", "🚙", "🛻", "🚚", "🚛", "🚜", "🏎️", "🏍️", "🛵", "🦽", "🦼", "🛺", "🚲", "🛴", "🛹", "🛼", "🚏", "🛣️", "🛤️", "🛢️", "⛽", "🛞", "🚨", "🚥", "🚦", "🛑", "🚧", "⚓", "🛟", "⛵", "🛶", "🚤", "🛳️", "⛴️", "🛥️", "🚢", "✈️", "🛩️", "🛫", "🛬", "🪂", "💺", "🚁", "🚟", "🚠", "🚡", "🛰️", "🚀", "🛸", "🛎️", "🧳", "⌛", "⏳", "⌚", "⏰", "⏱️", "⏲️", "🕰️", "🕛", "🕧", "🕐", "🕜", "🕑", "🕝", "🕒", "🕞", "🕓", "🕟", "🕔", "🕠", "🕕", "🕡", "🕖", "🕢", "🕗", "🕣", "🕘", "🕤", "🕙", "🕥", "🕚", "🕦", "🌑", "🌒", "🌓", "🌔", "🌕", "🌖", "🌗", "🌘", "🌙", "🌚", "🌛", "🌜", "🌡️", "☀️", "🌝", "🌞", "🪐", "⭐", "🌟", "🌠", "🌌", "☁️", "⛅", "⛈️", "🌤️", "🌥️", "🌦️", "🌧️", "🌨️", "🌩️", "🌪️", "🌫️", "🌬️", "🌀", "🌈", "🌂", "☂️", "☔", "⛱️", "⚡", "❄️", "☃️", "⛄", "☄️", "🔥", "💧", "🌊", "🎃", "🎄", "🎆", "🎇", "🧨", "✨", "🎈", "🎉", "🎊", "🎋", "🎍", "🎎", "🎏", "🎐", "🎑", "🧧", "🎀", "🎁", "🎗️", "🎟️", "🎫", "🎖️", "🏆", "🏅", "🥇", "🥈", "🥉", "⚽", "⚾", "🥎", "🏀", "🏐", "🏈", "🏉", "🎾", "🥏", "🎳", "🏏", "🏑", "🏒", "🥍", "🏓", "🏸", "🥊", "🥋", "🥅", "⛳", "⛸️", "🎣", "🤿", "🎽", "🎿", "🛷", "🥌", "🎯", "🪀", "🪁", "🎱", "🔮", "🪄", "🧿", "🪬", "🎮", "🕹️", "🎰", "🎲", "🧩", "🧸", "🪅", "🪩", "🪆", "♠️", "♥️", "♦️", "♣️", "♟️", "🃏", "🀄", "🎴", "🎭", "🖼️", "🎨", "🧵", "🪡", "🧶", "🪢", "👓", "🕶️", "🥽", "🥼", "🦺", "👔", "👕", "👖", "🧣", "🧤", "🧥", "🧦", "👗", "👘", "🥻", "🩱", "🩲", "🩳", "👙", "👚", "👛", "👜", "👝", "🛍️", "🎒", "🩴", "👞", "👟", "🥾", "🥿", "👠", "👡", "🩰", "👢", "👑", "👒", "🎩", "🎓", "🧢", "🪖", "⛑️", "📿", "💄", "💍", "💎", "🔇", "🔈", "🔉", "🔊", "📢", "📣", "📯", "🔔", "🔕", "🎼", "🎵", "🎶", "🎙️", "🎚️", "🎛️", "🎤", "🎧", "📻", "🎷", "🪗", "🎸", "🎹", "🎺", "🎻", "🪕", "🥁", "🪘", "📱", "📲", "☎️", "📞", "📟", "📠", "🔋", "🪫", "🔌", "💻", "🖥️", "🖨️", "⌨️", "🖱️", "🖲️", "💽", "💾", "💿", "📀", "🧮", "🎥", "🎞️", "📽️", "🎬", "📺", "📷", "📸", "📹", "📼", "🔍", "🔎", "🕯️", "💡", "🔦", "🏮", "🪔", "📔", "📕", "📖", "📗", "📘", "📙", "📚", "📓", "📒", "📃", "📜", "📄", "📰", "🗞️", "📑", "🔖", "🏷️", "💰", "🪙", "💴", "💵", "💶", "💷", "💸", "💳", "🧾", "💹", "✉️", "📧", "📨", "📩", "📤", "📥", "📦", "📫", "📪", "📬", "📭", "📮", "🗳️", "✏️", "✒️", "🖋️", "🖊️", "🖌️", "🖍️", "📝", "💼", "📁", "📂", "🗂️", "📅", "📆", "🗒️", "🗓️", "📇", "📈", "📉", "📊", "📋", "📌", "📍", "📎", "🖇️", "📏", "📐", "✂️", "🗃️", "🗄️", "🗑️", "🔒", "🔓", "🔏", "🔐", "🔑", "🗝️", "🔨", "🪓", "⛏️", "⚒️", "🛠️", "🗡️", "⚔️", "🔫", "🪃", "🏹", "🛡️", "🪚", "🔧", "🪛", "🔩", "⚙️", "🗜️", "⚖️", "🦯", "🔗", "⛓️", "🪝", "🧰", "🧲", "🪜", "⚗️", "🧪", "🧫", "🧬", "🔬", "🔭", "📡", "💉", "🩸", "💊", "🩹", "🩼", "🩺", "🩻", "🚪", "🛗", "🪞", "🪟", "🛏️", "🛋️", "🪑", "🚽", "🪠", "🚿", "🛁", "🪤", "🪒", "🧴", "🧷", "🧹", "🧺", "🧻", "🪣", "🧼", "🫧", "🪥", "🧽", "🧯", "🛒", "🚬", "⚰️", "🪦", "⚱️", "🗿", "🪧", "🪪", "🏧", "🚮", "🚰", "♿", "🚹", "🚺", "🚻", "🚼", "🚾", "🛂", "🛃", "🛄", "🛅", "⚠️", "🚸", "⛔", "🚫", "🚳", "🚭", "🚯", "🚱", "🚷", "📵", "🔞", "☢️", "☣️", "⬆️", "↗️", "➡️", "↘️", "⬇️", "↙️", "⬅️", "↖️", "↕️", "↔️", "↩️", "↪️", "⤴️", "⤵️", "🔃", "🔄", "🔙", "🔚", "🔛", "🔜", "🔝", "🛐", "⚛️", "🕉️", "✡️", "☸️", "☯️", "✝️", "☦️", "☪️", "☮️", "🕎", "🔯", "♈", "♉", "♊", "♋", "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓", "⛎", "🔀", "🔁", "🔂", "▶️", "⏩", "⏭️", "⏯️", "◀️", "⏪", "⏮️", "🔼", "⏫", "🔽", "⏬", "⏸️", "⏹️", "⏺️", "⏏️", "🎦", "🔅", "🔆", "📶", "📳", "📴", "♀️", "♂️", "⚧️", "✖️", "➕", "➖", "➗", "🟰", "♾️", "‼️", "⁉️", "❓", "❔", "❕", "❗", "〰️", "💱", "💲", "⚕️", "♻️", "⚜️", "🔱", "📛", "🔰", "⭕", "✅", "☑️", "✔️", "❌", "❎", "➰", "➿", "〽️", "✳️", "✴️", "❇️", "©️", "®️", "™️", "#️⃣", "*️⃣", "0️⃣", "1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟", "🔠", "🔡", "🔢", "🔣", "🔤", "🅰️", "🆎", "🅱️", "🆑", "🆒", "🆓", "ℹ️", "🆔", "Ⓜ️", "🆕", "🆖", "🅾️", "🆗", "🅿️", "🆘", "🆙", "🆚", "🈁", "🈂️", "🈷️", "🈶", "🈯", "🉐", "🈹", "🈚", "🈲", "🉑", "🈸", "🈴", "🈳", "㊗️", "㊙️", "🈺", "🈵", "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "🟤", "⚫", "⚪", "🟥", "🟧", "🟨", "🟩", "🟦", "🟪", "🟫", "⬛", "⬜", "◼️", "◻️", "◾", "◽", "▪️", "▫️", "🔶", "🔷", "🔸", "🔹", "🔺", "🔻", "💠", "🔘", "🔳", "🔲", "🏁", "🚩", "🎌", "🏴", "🏳️", "🏳️‍🌈", "🏳️‍⚧️", "🏴‍☠️", "🇦🇨", "🇦🇩", "🇦🇪", "🇦🇫", "🇦🇬", "🇦🇮", "🇦🇱", "🇦🇲", "🇦🇴", "🇦🇶", "🇦🇷", "🇦🇸", "🇦🇹", "🇦🇺", "🇦🇼", "🇦🇽", "🇦🇿", "🇧🇦", "🇧🇧", "🇧🇩", "🇧🇪", "🇧🇫", "🇧🇬", "🇧🇭", "🇧🇮", "🇧🇯", "🇧🇱", "🇧🇲", "🇧🇳", "🇧🇴", "🇧🇶", "🇧🇷", "🇧🇸", "🇧🇹", "🇧🇻", "🇧🇼", "🇧🇾", "🇧🇿", "🇨🇦", "🇨🇨", "🇨🇩", "🇨🇫", "🇨🇬", "🇨🇭", "🇨🇮", "🇨🇰", "🇨🇱", "🇨🇲", "🇨🇳", "🇨🇴", "🇨🇵", "🇨🇷", "🇨🇺", "🇨🇻", "🇨🇼", "🇨🇽", "🇨🇾", "🇨🇿", "🇩🇪", "🇩🇬", "🇩🇯", "🇩🇰", "🇩🇲", "🇩🇴", "🇩🇿", "🇪🇦", "🇪🇨", "🇪🇪", "🇪🇬", "🇪🇭", "🇪🇷", "🇪🇸", "🇪🇹", "🇪🇺", "🇫🇮", "🇫🇯", "🇫🇰", "🇫🇲", "🇫🇴", "🇫🇷", "🇬🇦", "🇬🇧", "🇬🇩", "🇬🇪", "🇬🇫", "🇬🇬", "🇬🇭", "🇬🇮", "🇬🇱", "🇬🇲", "🇬🇳", "🇬🇵", "🇬🇶", "🇬🇷", "🇬🇸", "🇬🇹", "🇬🇺", "🇬🇼", "🇬🇾", "🇭🇰", "🇭🇲", "🇭🇳", "🇭🇷", "🇭🇹", "🇭🇺", "🇮🇨", "🇮🇩", "🇮🇪", "🇮🇱", "🇮🇲", "🇮🇳", "🇮🇴", "🇮🇶", "🇮🇷", "🇮🇸", "🇮🇹", "🇯🇪", "🇯🇲", "🇯🇴", "🇯🇵", "🇰🇪", "🇰🇬", "🇰🇭", "🇰🇮", "🇰🇲", "🇰🇳", "🇰🇵", "🇰🇷", "🇰🇼", "🇰🇾", "🇰🇿", "🇱🇦", "🇱🇧", "🇱🇨", "🇱🇮", "🇱🇰", "🇱🇷", "🇱🇸", "🇱🇹", "🇱🇺", "🇱🇻", "🇱🇾", "🇲🇦", "🇲🇨", "🇲🇩", "🇲🇪", "🇲🇫", "🇲🇬", "🇲🇭", "🇲🇰", "🇲🇱", "🇲🇲", "🇲🇳", "🇲🇴", "🇲🇵", "🇲🇶", "🇲🇷", "🇲🇸", "🇲🇹", "🇲🇺", "🇲🇻", "🇲🇼", "🇲🇽", "🇲🇾", "🇲🇿", "🇳🇦", "🇳🇨", "🇳🇪", "🇳🇫", "🇳🇬", "🇳🇮", "🇳🇱", "🇳🇴", "🇳🇵", "🇳🇷", "🇳🇺", "🇳🇿", "🇴🇲", "🇵🇦", "🇵🇪", "🇵🇫", "🇵🇬", "🇵🇭", "🇵🇰", "🇵🇱", "🇵🇲", "🇵🇳", "🇵🇷", "🇵🇸", "🇵🇹", "🇵🇼", "🇵🇾", "🇶🇦", "🇷🇪", "🇷🇴", "🇷🇸", "🇷🇺", "🇷🇼", "🇸🇦", "🇸🇧", "🇸🇨", "🇸🇩", "🇸🇪", "🇸🇬", "🇸🇭", "🇸🇮", "🇸🇯", "🇸🇰", "🇸🇱", "🇸🇲", "🇸🇳", "🇸🇴", "🇸🇷", "🇸🇸", "🇸🇹", "🇸🇻", "🇸🇽", "🇸🇾", "🇸🇿", "🇹🇦", "🇹🇨", "🇹🇩", "🇹🇫", "🇹🇬", "🇹🇭", "🇹🇯", "🇹🇰", "🇹🇱", "🇹🇲", "🇹🇳", "🇹🇴", "🇹🇷", "🇹🇹", "🇹🇻", "🇹🇼", "🇹🇿", "🇺🇦", "🇺🇬", "🇺🇲", "🇺🇳", "🇺🇸", "🇺🇾", "🇺🇿", "🇻🇦", "🇻🇨", "🇻🇪", "🇻🇬", "🇻🇮", "🇻🇳", "🇻🇺", "🇼🇫", "🇼🇸", "🇽🇰", "🇾🇪", "🇾🇹", "🇿🇦", "🇿🇲", "🇿🇼", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", ""]
}
