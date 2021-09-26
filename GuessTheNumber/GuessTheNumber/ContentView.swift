//
//  GuessTheNumber.swift
//  Угадай число
//  Тестовое задание для Нетологии
//
//  Created by Ilya on 26.09.2021.
//

import SwiftUI

struct GuessTheNumber: View {
    private let maxAttempts = 5; // количество попыток (можно менять, но не больше 8, см. attemptNames ниже)
    
    var body: some View {

// MARK: Главный экран
        VStack(spacing: 20) {
            
            // Название игры
            Text("Угадай число")
                .font(.largeTitle) // стиль шрифта
                .bold() // толщина шрифта
                .foregroundColor(.blue) // цвет
                .padding() // пустые поля вокруг
            
            // Краткое описание
            Text("Я загадал число от 0 до 99. У вас есть \(maxAttempts) попыток чтобы отгадать его!")
                .font(.title) // стиль шрифта
                .frame(maxWidth: .infinity) // ширина элемента - максимально возможная по размеру экрана
                .padding() // пустые поля вокруг текста
                .foregroundColor(.white) // цвет текста
                .background(Color.blue) // цвет заливки
            
            // Игровое поле (передача данных о максимальном количестве попыток)
            GameField(currentAttempt: maxAttempts, maxAttemtps: maxAttempts)
        }
    }
}

// MARK: Игровое поле
struct GameField: View {
    @State var currentAttempt: Int // текущая попытка
    @State var maxAttemtps: Int // максимум попыток
    @State private var digit10 = 0 // число циферблата (разряд десятков)
    @State private var digit1 = 0 // число циферблата (раздяд единиц)
    @State private var min = 0 // минимум диапазона
    @State private var max = 99 // максимум диапазона
    @State private var attemptNames = ["последняя попытка", "две попытки", "три попытки", "четыре попытки", "пять попыток", "шесть попыток", "семь попыток", "восемь попыток"] // цифры словами
    @State private var hint = "Угадывайте!" // подсказка
    @State private var guess = 0 // число-предположение игрока
    @State private var number = Int.random(in: 0...99) // случайное число
    @State private var newGameHint = "Начнем!" // дополнительный текст
    
    var body: some View {
        VStack() {
            // MARK: Подсказки
            VStack() {
                Text(newGameHint) // подсказка к новой игре
                    .foregroundColor(.red)
                Text("У вас \(attemptNames[currentAttempt-1])") // количество оставшихся попыток
                    .foregroundColor(currentAttempt > 1 ? .blue : .red) // если у игрока последняя попытка - текст становится красного цвета
                Text("Диапазон - от \(min) до \(max)") // показывает текущий диапазон
                Text(hint) // подсказка (число больше/меньше)
            }
            .font(.title3)
            .foregroundColor(.blue)
            .padding()
            
            // MARK: Табло с числом
            VStack() {
                // табло состоит из двух разрядов (цифр)
                HStack(spacing: 40) {
                    Text("\(digit10)") // разряд десятков
                        .bold()
                    Text("\(digit1)") // разряд единиц
                        .bold()
                }
                .font(.largeTitle)
                .foregroundColor(.red)
            }
            
            // MARK: Кнопоки
            // Их можно (и нужно) оптимизировать, сделать рефакторинг
            VStack() {
                // первая строка кнопок
                HStack(spacing: 20) {
                    // MARK: 1
                    Button(action: {
                        // если нажали кнопку с цифрой, то цифры на табло 'сдвигаются' на один разряд влево
                        digit10 = digit1 // разряд единичных цифр переходит на разряд десятых
                        digit1 = 1 // разряд единичных цифр становится равен цифре на кнопке
                    }) {
                        Text("1") // текстовая метка на кнопке
                            .bold()
                    }
                    .frame(width: 100, height: 50) // размер кнопки
                    .background(Color.blue) // цвет кнопки
                    .cornerRadius(10) // закругление уголков кнопки
                    // MARK: 2
                    Button(action: {
                        digit10 = digit1
                        digit1 = 2
                    }) {
                        Text("2")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 3
                    Button(action: {
                        digit10 = digit1
                        digit1 = 3
                    }) {
                        Text("3")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                // вторая строка кнопок
                HStack(spacing: 20) {
                    // MARK: 4
                    Button(action: {
                        digit10 = digit1
                        digit1 = 4
                    }) {
                        Text("4")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 5
                    Button(action: {
                        digit10 = digit1
                        digit1 = 5
                    }) {
                        Text("5")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 6
                    Button(action: {
                        digit10 = digit1
                        digit1 = 6
                    }) {
                        Text("6")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                // третья строка кнопок
                HStack(spacing: 20) {
                    // MARK: 7
                    Button(action: {
                        digit10 = digit1
                        digit1 = 7
                    }) {
                        Text("7")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 8
                    Button(action: {
                        digit10 = digit1
                        digit1 = 8
                    }) {
                        Text("8")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 9
                    Button(action: {
                        digit10 = digit1
                        digit1 = 9
                    }) {
                        Text("9")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                // четвертая строка кнопок
                HStack(spacing: 20) {
                    // MARK: X
                    Button(action: {
                        // кнопка 'x' сбрасывает оба регистра на 0
                        digit1 = 0
                        digit10 = 0
                    }) {
                        // меткой кнопки может быть не только текст, но и изображение, в данном случае из встроенных системных иконок (крест в круге)
                        Image(systemName: "x.circle")
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    // MARK: 0
                    Button(action: {
                        digit10 = digit1
                        digit1 = 0
                    }) {
                        Text("0")
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    // MARK: Логика игры
                    Button(action: {
                        newGameHint = "" // дополнительный текст исчезает как только происходит первая попытка угадать новое число
                        let guessNumber = digit10*10 + digit1 // воссоздаем число-предположение игрока из данных на табло
                        
                        // MARK: число меньше
                        if guessNumber < number { // если число игрока меньше числа компьютера
                            min = guessNumber+1 // обновляем минимум диапазона
                            hint = "Мое число больше \(guessNumber)" // показываем подсказку
                            currentAttempt -= 1 // уменьшаем количество оставшихся попыток
                        
                        // MARK: число больше
                        } else if guessNumber > number { // если число игрока больше числа компьютера
                            max = guessNumber-1 // обновляем максимум диапазона
                            hint = "Мое число меньше \(guessNumber)" // показываем подсказку
                            currentAttempt -= 1 // уменьшаем количество оставшихся попыток
                        
                        // MARK: игрок угадал
                        } else {
                            // Игрок угадал!
                            hint = "Мое предыдущее число было \(number)" // обновляем подсказку
                            newGameHint = "Вы угадали и я выбрал новое число!" // обновляем дополнительный текст
                            number = Int.random(in: 0...99) // новое случайное число
                            currentAttempt = maxAttemtps // даем новое количество попыток
                            digit1 = 0 // сброс цифры табло
                            digit10 = 0 // сброс цифры табло
                            min = 0 // сброс минимума
                            max = 99 // сброс максимума
                        }

                        // MARK: игрок проиграл
                        if currentAttempt < 1 { // попытки закончились
                            hint = "Кстати, мое число было \(number)" // обновляем подсказку
                            newGameHint = "Нет, но давайте сыграем заново!" // обновляем дополнительный текст
                            number = Int.random(in: 0...99) // новое случайное число
                            currentAttempt = maxAttemtps // возобновляем попытки
                            digit1 = 0 // сброс цифры табло
                            digit10 = 0 // сброс цифры табло
                            min = 0 // сброс минимума
                            max = 99 // сброс максимума
                        }
                    }) {
                        Image(systemName: "checkmark.circle") // изображение на метке кнопки
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
            .font(.largeTitle) // все элементы большого размера
            .foregroundColor(.white) // все элементы белого цвета
            .padding() // увеличиваем расстояние
        }
        
        Spacer() // оставляем место внизу (лучше для эргономики)
    }
}

// MARK: Вспомогательная структура
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheNumber()
    }
}
