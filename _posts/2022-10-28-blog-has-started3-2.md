---
title: Симулятор выживания в «бесконечной IKEA» разозлил настоящую IKEA, которая угрожает судом
layout: post
preview: https://3dnews.ru/assets/external/illustrations/2022/10/29/1076554/00.jpg
description: Британский инди-разработчик Джейкоб Шоу (Jacob Shaw) создаёт симулятор выживания в «бесконечном мебельном магазине» The Store is Closed.
tags:
- tech
- events
category: larchanka
updated: '2022-10-23 22:29:00 +0000'
---

![1_L0jtcMWvl4YtFV7KB5-xlg.jpeg](https://cdn.mobila.name/images/uploads/6353f1acae053_1_L0jtcMWvl4YtFV7KB5-xlg.jpeg)

Скорее всего, вы с удовольствием использовали пиксели (px) в Sketch и Figma, не задумываясь об этом. Это то, что стоит в этих программах по-умолчанию и прекрасно работает. Тем более все еще распространена практика pixel perfect, которая так удачно накладывается на пиксели.

## Тогда в чем проблема использования значений в px?

Пиксели в программах для дизайна (например, Figma) являются абсолютными единицами, а это значит, что 1 пиксель соответствует определенному размеру (позже это будет преобразовано в различные разрешения экрана, но в Figma мы работаем с 1x, где 1px = 1pt). Теперь фиксированное значение кажется мечтой дизайнера, полным контролем. Исправляем все, чтобы все выглядело идеально! Однако использование px (помимо других проблем) может создать серьезные ограничения в доступности, такие как игнорирование предпочтений размера шрифта, установленных пользователями после перевода в CSS.

### Предпочтение по размеру шрифта? Что это?

У каждого браузера есть размер шрифта по умолчанию, что означает, что нестилизованный текст будет отображаться с определенным размером, обычно это 16 пикселей. Пользователи могут изменить этот размер в настройках браузера. Попробуйте сами. *Chrome → Дополнительное меню (три точки вверху справа) > Настройки > Внешний вид > Либо пользовательский шрифт, либо размер шрифта*. Чаще всего этим пользуются люди с нарушениями зрения!

![1_I3dzmSc_iBYCCGQuMnLsWg.gif](https://cdn.mobila.name/images/uploads/6353f1f781f5e_1_I3dzmSc_iBYCCGQuMnLsWg.gif)

Не только пользователи могут менять эту настройку. Разработчики также могут изменить размер шрифта с помощью CSS, используя селектор html.

> Кстати: пользователи могут увеличить настройки масштабирования браузера вместо изменения размера шрифта. Это не вызовет проблем с px и будет работать нормально! Соответственно все будет масштабироваться. Тем не менее, мы ничего не знаем о предустановленных настройках браузера пользователей, поэтому использование rem будет способствовать изменению масштаба и корневого размера шрифта и сделает всех счастливыми.

![1_CYaqg5Zq5pEuYoYeiddrvg.png](https://cdn.mobila.name/images/uploads/6353f221990cd_1_CYaqg5Zq5pEuYoYeiddrvg.png)

### px перезапишет пользовательские настройки

Позвольте мне показать вам пример. Итак, вы определили все размеры шрифта в px. Чтобы упростить это, предположим, что ваш `H1` равен `48px`, а текст `p` — `16px`. Звучит как разумные читаемые значения на экране.

![единицы px будут препятствовать настройкам размера шрифта браузера пользователей](https://cdn.mobila.name/images/uploads/1_kb_BIHqXzQF1P2a4vD32cg.jpeg)

Однако, поскольку px фиксированы, они перезаписывают любые настройки браузера. Даже если пользователь изменит размер шрифта в браузере, в нашем примере с `16` пикселей на `24` пикселя, это не повлияет на отображаемый размер. Итак, вы создали  ограничение юзабилити.

### Что изменится, если вместо этого я буду использовать rem?

`rem` — это относительная единица, связанная с размерами корневого шрифта (r в rem на самом деле означает корень/root). Таким образом, в большинстве случаев `1rem = 16px`, однако, если корневой размер шрифта был изменен (помните, что это могут сделать пользователи или разработчик), например. до `24px`, тогда `1rem = 24px`.

> `1rem` = текущая настройка размера корневого шрифта
> 

![использование единиц rem учитывает настройки браузера пользователя](https://cdn.mobila.name/images/uploads/1_X0OzlPZwhXHI4WBI4J_xOw.jpeg)

Таким образом, чтобы перевести наш `H1` из `48 пикселей в rem`, мы вычисляем `48px/16px` (мы предполагаем размер корня по умолчанию) `= 3rem`. Если вам так проще, просто думайте об этом как о процентах. `1rem` — это 100%, а `3rem` — это то же самое, что и 300%.

Итак, чтобы ответить на наш первоначальный вопрос: «Что изменится в нашем дизайне при использовании rem вместо px». Ответ таков: для всех пользователей, не меняющих корневой размер шрифта (которых, без сомнения, подавляющее большинство), абсолютно ничего не меняется, и ваш дизайн выглядит так же, как и с px. Для меньшинства, которое полагается на изменение корневого размера шрифта, весь текст (и в идеале все остальные элементы, но об этом позже) будет масштабироваться пропорционально.

> Удобство этого в том, что, используя единицы rem для определения размера шрифта, вы как дизайнер сохраняете гармонию и иерархию масштаба вашего шрифта, но при этом предоставляете гибкость для пользователей в адаптации размеров шрифта.
> 

### А как же em?

По-началу `rem` и `em` относятся к корневому размеру шрифта, но они не интерпретируют его одинаково во всем вашем проекте.

`rem` → **кратное корневому размеру шрифта вашего браузера** (r - root). Размер корневого шрифта `= 16px`, значит `1rem = 16px`

`em` → **кратное размеру шрифта элемента, в котором он используется**. Размер шрифта контейнера `2rem = 32px`, таким образом, `1em = 32px` внутри контейнера

![использование единиц em учитывает настройки браузера пользователя, но относится к элементу, для которого они используются](https://cdn.mobila.name/images/uploads/1_lpOwd47SvC-2e47n_dUTYQ.jpeg)

**Таким образом, `em` по-прежнему учитывает настройки браузера, чтобы использовать его**. Но всегда относится к вышестоящему элементу, в некоторых случаях это может быть корень, но также может быть, как в нашем примере, контейнер с установленным размером шрифта. [Пример](https://codepen.io/chrisvall/pen/zYzxwzY).

Так же это довольно интересный и динамичный способ настройки таких вещей, как отступы и поля. И `rem`, и `em` имеют свои сильные и слабые стороны в зависимости от варианта использования. Опытные фронтенд-разработчики отлично их совмещают. Однако, работая с **Figma**, вы могли заметить, что, хотя вычисление `rem` является простым, `em` становится довольно запутанным. Поэтому я, как дизайнер, лично придерживаюсь определения всего в единицах `rem` и понимаю, что команда разработчиков имеет полный контроль над переопределением этих единиц в другие единицы, такие как `em`, где это необходимо. О том, как и почему я это делаю, я расскажу немного позже.

## Но в Figma нет rem?! Что я мне делать?

> Это то, о чем не знает большинство веб-разработчиков: ни в одной программе для разработки UI, даже в таких великолепных и продвинутых, как **Sketch** и **Figma**, мы в настоящее время не можем использовать `rem/em`.
> 

Так что UX/UI-дизайнеры вынуждены проектировать в `px` в мире, где доступность является требованием… Да, это странно, да, это грустно, учитывая, насколько продвинута **Figma** во всех других областях, и да, я уверен, что это скоро изменится. И да, да, я знаю, что все дизайнеры должны быть идеальными кодерами в идеальном мире, есть много статей об этом, но это не моя тема. А пока давайте посмотрим, какие у нас варианты как у дизайнеров, использующих **Figma**, чтобы начать работу с относительными единицами измерения.

### Способ 1. Проект остается в px и переводится в относительные единицы во время программирования. И вся команда об этом знает!!!

Сейчас это хорошо работает, если вы тесно сотрудничаете как команда и у вас есть четкие обязанности. Разработчики должны знать о «проблеме в Figma» и переводить все пиксели в относительные единицы в CSS.

![px в Figma, rem/em (или любая другая подходящая единица измерения) в CSS](https://cdn.mobila.name/images/uploads/1_7PHQJxJUXNEqtPvIEjitkw.jpeg)

На самом деле это неплохое решение, потому что, если вы работаете с хорошей  командой, они будут гораздо более осведомлены о новейших технологиях и требованиях к доступности, которые, как уже упоминалось, гораздо больше, чем просто относительные единицы. Они также могут не возражать против получения значений `px`, поскольку есть несколько трюков, позволяющих избежать утомительных вычислений:

#### Старый, но проверенный трюк – 62,5%

Размер корневого шрифта в CSS установлен на **62,5%**. Таким образом, вы как бы подделываете размер `10px`, но продолжаете выводить правильный размер. 

```css
html {       
	font-size: 62.5%; 
	/* 62.5% от 16px = 10px */
}
body {       
	font-size: 1.6rem; 
	/* 10*1.6 = 16px, что бы продолжить работать с 16px */
}
.someClass {       
	font-size: 2.4rem; 
	/* 10*2.4 = 24px */
}
```

#### Sass Mixin

Сама **Figma** рекомендует этот **Sass Mixin** для легкого преобразования из `px` в `rem`. Вы найдете немного волшебства из **62,5%** и здесь.

![Sass Mixin rem](https://cdn.mobila.name/images/uploads/1_5gv9xB7ZH3U8bEM0KhEvuw.png)

### Способ 2. Используйте сторонний сервис (например, Zeplin)

Прелесть Figma в том, что вам больше не нужен еще инструмент для работы. Однако, если вы используете такой, как **Zeplin**,  это обеспечивает [фантастический способ просто переключения единиц измерения](https://support.zeplin.io/en/articles/3870738-enabling-rem-unit) на `rem`. Мне нравится, что для блоков **Spacing** есть отдельная таблица стилей, которая автоматически отображается в `rem`.

![Использование rem в Zeplin](https://cdn.mobila.name/images/uploads/1_3zqeNnsd1sYgzP9eYAd9zw.gif)

Тем не менее, внутри команды стоит отметить, что исходные файлы **Figma** остаются в `px`.

Вы также можете использовать любой другой инструмент с такой опцией, например. **Avocode**, **Anima** и многие другие.

### Способ 3. Определите значения px и rem в таблицах стилей

Это мой любимый способ. Я добавляю это в свои таблицы стилей в любом случае, особенно когда работаю фрилансером с меняющимися разработчиками. UX в UX/UI Design исходит из удобства использования, поэтому я обязан убедиться, что я разрабатываю для каждого пользователя. Этот прием помогает напомнить всем, что конечный результат должен быть отображен в относительных единицах.

#### Таблица стилей типографики

Итак, в моей таблице стилей типографики, важном документе, когда дело доходит до передачи от дизайна к разработке, я просто добавляю значения `rem` к своим значениям `px`. Важно иметь и то, и другое, так как дизайнерам, работающим с файлом, потребуется `px`.

![Таблица стилей типографики](https://cdn.mobila.name/images/uploads/1_8Sh88Pbeb3VXd4wzyihrZQ.png)

Между прочим, в Figma фактические единицы `px` безразмерны, я предполагаю, что это сделано для того, чтобы не путать `px`, используемые для дизайна, и `px` разрешения экрана (в Figma мы проектируем в так называемом `1x`, где `1px = 1pt`).

Не забудьте также перевести высоту строки в относительные единицы! В этом случае вам не нужно использовать `rem`, вы можете просто использовать безразмерное число, например `1.5`. Он рассчитает высоту строки из заданного размера шрифта. Таким образом, размер шрифта 16 пикселей и высота строки 1.5 приведут к высоте строки `16px * 1.5 = 24px`.

#### Рассчитать непосредственно в Figma

Если вы не знаете, вы можете рассчитать что-либо прямо в панели свойств. Таким образом, вы можете просто разделить заданный размер шрифта на `16` пикселей и получить rem для записи в вашей таблице стилей. Вам нужно снова умножить его на `16px`, чтобы сбросить его до `px`. `Line-height`, я просто использую %, так как мне это намного проще, а затем перевожу, например. `150%` до `1.5` в моей таблице стилей.

![Используйте панель свойств в качестве калькулятора](https://cdn.mobila.name/images/uploads/1_zwQOxvQ3-YQsV8YNDfrtTA.gif)

#### Используйте плагин Hand››over

Вы также можете использовать этот отличный плагин, который сделает всю работу за вас. В **Figma** просто выберите элемент, и он покажет вам все, что в нем есть. Вы можете получить плагин бесплатно через [сообщество Figma](https://www.figma.com/community/plugin/837070613195594890/Hand%E2%80%BA%E2%80%BAover). Сохраняйте размер корня на уровне 16 пикселей.

![Плагин Hand>>over переведет px в rem для вас](https://cdn.mobila.name/images/uploads/1_XCivVJWyA5A7xRwSIqmkzw.png)

#### Используйте онлайн-конвертер

Есть много таких, как [nekoCalc](https://nekocalc.com/px-to-rem-converter). Вы также можете использовать определенное соотношение и попробовать что-то вроде [этого](https://type-scale.com/). Подробнее об использовании масштабов адаптивного шрифта [здесь](https://www.moonlearning.io/typography-preview).

![вычисление rem из предполагаемого базового размера 16px](https://cdn.mobila.name/images/uploads/1_17IiFhUEiLE7kIoS53OIww.png)

### Системы интервалов и компоненты

Я использую систему интервалов `8pt` для большинства своих дизайнов. То есть все кратно 8. Теперь это прекрасно работает с предполагаемым корневым размером по умолчанию `1rem = 16px`. Как вы могли заметить, я также делаю размер шрифта и высоту строки кратными 8 (иногда вам нужно 4), поэтому я редко получаю сумасшедшие `rem`.

![Система интервалов 8pt, выбранные блоки в px, rem и описательное наименование](https://cdn.mobila.name/images/uploads/1_UT8LsQ9MpJ6Yj3JEGGCSkg.png)

Итак, как только я установил свою систему, я просто применяю ее к своим компонентам.

![компонент с размерами](https://cdn.mobila.name/images/uploads/1_P-FkJNEqMzug4ac4a1k3fQ.jpeg)

Я добавляю свой `rem` только для того, чтобы сохранить напоминание об использовании относительных единиц для меня и всех остальных. Тем не менее, я добавляю примечание, в котором четко указано, что последнее слово о том, как они будут настраивать компоненты и блоки, остается за командой разработчиков. Иногда `em` может быть более разумным решением.

> Имейте в виду, что когда дело доходит до интервалов, `em` иногда может быть гораздо лучшим решением, чем `rem`.
> 

> Тестирование и вычисление `em` в **Figma** было бы кошмаром, поэтому лучше доверить настройку реальных компонентов экспертам. Однако рад услышать другие решения!
> 

### Не парьтесь с контуром в 1 пиксель!

Это совершенно нормально! Речь идет о том, чтобы сделать контент масштабируемым и потребляемым.

## Что насчет точек брейкпоинтов?

Как UX/UI-дизайнер, вы редко будете отвечать за выбор системы сеток (если только вы не используете пользовательскую сетку CSS, которая мне всегда нравилась). Поэтому вам, скорее всего, будет предоставлен набор возможных брейкпоинтов для использования (все или некоторые из них) для вашего проекта.

![Таблица стилей типографики с контрольными точками](https://cdn.mobila.name/images/uploads/1_lXhyi_sRszgAuioWT70diw.jpeg)

**Bootstrap**, например, хранит все контрольные точки в `px`, а большинство других размеров определяет в `rem` и `em`, по причине того, что «ширина области просмотра указана в пикселях и не меняется с размером шрифта». Другие, такие как фонд **Zurb**, используют `em` (обратите внимание, здесь `em` побеждает `rem`). Я немного углубился в кроличью нору точки останова и решил, что буду указывать, как и в других моих таблицах стилей, `px`, а также `em` (не `rem`). 

Брейкпоинты и единицы измерения — сложный вопрос (по крайней мере, для меня как для дизайнера), так как есть еще кое-что, что нужно учитывать, например, браузеры, которые вы используете…

## Хорошо, я понял, но для такого небольшого количества людей требуется много усилий, чтобы фактически изменить размер корневого шрифта!

Это – правда. Так почему же вы все еще должны беспокоиться об относительных единицах как дизайнер UX/UI? Потому что вы хороший человек и не стали бы парковаться на парковке для инвалидов только потому, что она удобнее и редко используется (по крайней мере, я надеюсь, что вы этого не сделаете). Если вам нужна другая причина, вы по закону обязаны сделать свой веб-сайт доступным, и одна небольшая часть этого требования — позволить пользователям масштабировать текст. В разделе 1.4.4 WCAG говорится: *«1.4.4 Изменение размера текста:… размер текста может быть изменен без вспомогательных технологий до 200 процентов без потери содержимого или функциональности… (далее) Обеспечение изменения размера текстовых контейнеров при изменении размера текста и с использованием измерений которые относятся к другим измерениям (уровень AA)»*. Хорошо, вы все равно можете использовать аргумент масштабирования, если хотите, масштабирование работает с `px` и `rem`, поэтому пользователи могут масштабироваться до 200%. Но, что касается меня, я все равно никогда не любил pixel-perfect и вижу преимущество в использовании относительных единиц с учетом масштабирования и корня. Все остальное зависит от вас!

---

Автор: [Christine Vallaure](https://christinevallaure.medium.com/)
Оригинал: [UX Collective](https://uxdesign.cc/why-designers-should-move-from-px-to-rem-and-how-to-do-that-in-figma-c0ea23e07a15)