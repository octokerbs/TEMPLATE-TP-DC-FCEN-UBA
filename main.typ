#import "template.typ": *
#import "caratula.typ": caratula
#import "@preview/hydra:0.6.2": hydra // Para los índices

// ======================== CARATULA ========================
#let titulo = "Descripción del TP"

#show: caratula.with(
  materia: "Materia de la carrera",
  titulo: titulo,
  subtitulo: "Subtítulo del TP",
  grupo: "Grupo 42",
  fecha: "14 de Diciembre de 2025",
  integrantes: (
    (nombre: "Apellido Nombre", lu: "001/01", email: "burdmankevin@gmail.com"),
    (nombre: "Apellido Nombre", lu: "002/01", email: "pablodherrero@gmail.com"),
    (nombre: "Apellido Nombre", lu: "003/01", email: "octaviokerbs@gmail.com"),
    (nombre: "Apellido Nombre", lu: "004/01", email: "nicyanz98@gmail.com"),
  ),
)

// ======================== INDICE ========================
#pagebreak()

// Recuadro rojo en referencias
#show selector(outline): it => {
  show regex("\d+"): num => {
    box(num, stroke: 1pt + red, outset: (bottom: 1pt, x: 1pt, y: 0.3pt))
  }
  it
}
#show selector(cite): it => {
  show regex("\\[\d+\\]"): num => {
    box(num, stroke: 1pt + red, outset: (bottom: 1pt, x:-3.2pt, y: -0.5pt))
  }
  it
}

#outline(title: "Índice")

#set page(numbering: "1")

#set page(
  header: context {
    if counter(page).get().first() > 1 [
      #let elems = query(selector(heading.where(level: 2)).before(here()))
      #if elems.len() > 0 {
          emph[#elems.last().body]
      }
      #h(1fr)
      #(titulo)
      #line(length: 100%, stroke: 0.5pt + black)
    ]
  }
)

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Template TP - DC UBA",
  authors: (
    "Octo Kerbs ",
  ),
)

// We generated the example code below so you can see how
// your document will look. Go ahead and replace it with
// your own content!

// ======================== CONTENIDO ========================
= Definir referencias
En el archivo references.yml pueden definir sus referencias con una estructura similar a esta:

```yml
pe_format:
  type: Web
  title: Portable Executable Format
  url: https://learn.microsoft.com/en-us/windows/win32/debug/pe-format
  organization: Microsoft

cubawiki:
  type: Web
  title: Cubaca
  url: https://www.cubawiki.com.ar/images/e/e1/Cubaca.png
  organization: Cuba-Wiki
```

y referenciarlas literalmente con el nombre definido:
"Bla bla bla bla, bla bla! bla bla @pe_format"
"The cubaca loves you! @cubawiki"

Para saber mas pueden consultar la sintaxis de typst @typst_syntax

= Introduction
#lorem(60)

== In this paper
#lorem(20) 

=== Contributions
#lorem(40)

= Related Work
#lorem(500)

// ======================== REFERENCIAS ========================
#pagebreak()

#set page(
  header: context {
    if counter(page).get().first() > 1 [
      #let elems = query(selector(heading))
      #if elems.len() > 0 {
          emph[#elems.last().body]
      }
      #h(1fr)
      Diseño e Implementación de Honeytokens
      #line(length: 100%, stroke: 0.5pt + black)
    ]
  }
)

#show link: it => {
  set text(fill: blue, style: "italic")
  underline(it)
}

#bibliography("references.yml", title: "Referencias", style: "ieee")