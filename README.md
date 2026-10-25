# Korea University Academic Template

An unofficial adaptation of the supplied Korea University / Yale / UC Berkeley RAIL / Google DeepMind report class. This revision is based on `Korea_University_Academic_Template_Overleaf.zip` supplied on 2026-10-25. It retains the original author's metadata API, contents behavior, IEEE bibliography style, vector resources, and license attribution.

## Compile and start writing

Upload the ZIP to Overleaf, choose `main.tex` and **pdfLaTeX**, then Recompile. Locally:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

Alternatively run pdfLaTeX, BibTeX, then pdfLaTeX until citations, contents, and back-links stabilize. No shell escape, local absolute paths, external fonts, or network access are required. The included `main.pdf` is a compiled preview; Overleaf itself has not been tested.

Edit `Metadata/paper.tex` (title/running title/keywords/resources), `Metadata/authors.tex` (authors/affiliations/emails/roles), and `Metadata/abstract.tex` (abstract text only). Write the five manuscript sections in `main.tex`, or replace them with your own section inputs. The supplied author records are retained; emails are rendered as addresses only. Review names, contribution roles, and placeholder `example.org` links before publication.

## Organization

- `main.tex`: concise paper skeleton and unified guide input.
- `TemplateGuide.tex`: all original formatting instructions, table/equation/theorem/figure/listing examples, acknowledgments guidance, five author configurations, and resource examples.
- `kuarxiv.cls`: reusable layout, metadata API, and university visual identity.
- `preamble.tex`: additional packages, callout/listing style, link configuration, and `\KUContents`.
- `command.tex`: original math shortcuts and the sole theorem-environment declarations.
- `Metadata/`: the three editable document configuration files.
- `Figure/`, `TemplateAssets/`, `References/`: the original vector figure, official vector logo/provenance, and bibliography.

The previous example section/table files and `Metadata/Examples/` are consolidated into the single guide; their examples remain available there. Old process reports are omitted. Remove the guide input to prepare your manuscript without template instructions. The bibliography follows the guide to resolve its demonstration citations; move it to your preferred position when replacing the guide with real appendices. Existing bibliography entries are retained, including the author's TODO. The sample citations are fictional typesetting fixtures, not verified research sources.

## Author and resource API

Prefer the automatic three-field interface below. It assigns and reuses affiliation numbers from the full unit text. The original `\KUAuthor{name}{affiliation numbers}{role keys}` and `\KUAffiliation{id}{text}` remain supported for explicit numbering. `\KUEmail{email}` prints only the address; legacy `\KUEmail{name}{email}` is accepted and its name is ignored. Initialize with `\KUResetAuthors`. Roles `equal`, `lead`, `corresponding`, and `senior` retain their symbols and print one explanation each in canonical order. `\KUContribution{lead}{Project coordination}` customizes a note. The five complete original author configurations are in Appendix H of the guide. An ordinary `\author` remains supported when no KUAuthor entries are supplied.

`\KUResetResources` clears resources; `\KUResource{label}{URL}` adds a link. Remove placeholder entries to omit them. Empty resources and no-logo layouts remain supported. Legacy footer tokens use `\paperurl={...}`, `\correspondingauthor={...}`, and `\reportnumber={...}`; do not duplicate a corresponding-author role note unless intended.


### Automatic author records

Fill only `Metadata/authors.tex`; one record contains name, complete unit, and email:

```latex
\KUResetAuthors
\KUAddAuthor{Alice Kim}
  {Department of Artificial Intelligence, Korea University, Seoul, Republic of Korea}
  {alice@korea.ac.kr}
\KUAddAuthor{Bob Lee}
  {Department of Artificial Intelligence, Korea University, Seoul, Republic of Korea}
  {bob@korea.ac.kr}
```

Both authors automatically share affiliation 1. Names form a centered wrapping row; each unique unit is printed once below it, followed by a centered, wrapping row of plain email addresses. Identical emails are printed once. Author records, including identical names, are retained.

For several units belonging to one author, brace **each complete unit** so commas inside unit names remain literal:

```latex
\KUAddAuthorMulti[equal,corresponding]{Carol Park}
  {{Department of Artificial Intelligence, Korea University, Seoul, Republic of Korea},
   {School of Computing, Example University, Seoul, Republic of Korea}}
  {carol@example.ac.kr}
```

The optional role list uses the existing `equal`, `lead`, `corresponding`, and `senior` keys; omit the square-bracket argument when no role is needed. Empty unit/email fields are allowed. Use consistent full unit wording to reuse its number. `\KUResetAuthors` clears author, unit, email, role-use and automatic-number state. If mixing explicit IDs and automatic records, register all explicit `\KUAffiliation` entries first; assigning different text to an existing explicit ID produces a clear error.

Only citation numerals receive a restrained bold weight through natbib's `\citenumfont`; citation brackets, author names and ordinary prose keep their existing weight.

## Preserved class behavior

Options: `10pt`, `11pt`, `12pt`, `a4paper`, `letterpaper`, `twocolumn`, `logo`, `nonumbering`, `copyright`, `internal`, and `address`. Single-column frontmatter can flow; two-column full-width frontmatter must fit within one page. The compact contents stays outside the card and includes headings through level 3. A one- or two-page contents is followed naturally by the body with a minimum-space check; a contents of three or more pages is followed by a clean body page. Recompile to stabilize the start/end page labels.

## Repairs and visual changes

The source loaded hyperref twice with conflicting options and referred to an undefined `citegreen` color. Hyperref now loads once, with the requested page back-links enabled at its first load. Citation accents use KUCitation (`#B51F3F`, brighter than the original crimson); internal links and URLs use KULink (`#A62A46`). The global hypersetup and the frontmatter card's hypersetup use the same three values. The original color request is preserved as a comment in the preamble. Back-links have compact, explicit page labels.

The original `\KU@logotile` explicitly placed the logo in `\colorbox{white}`. That container is removed. `TemplateAssets/ku_logo.pdf` has 54 vector drawing objects and no raster images; its bytes are unchanged. PDF 1.7 output accommodates the original asset without downconversion. Logo paths, colors, proportions, and original provenance remain intact. The logo and resource minipages are top-aligned (`[t]` with `\vspace{0pt}`) so the logo row lines up with the resource text; the tall-resource and empty-resource branches are unchanged.

Repeated package loads and competing text/monospace font selections are removed. XCharter text, Palatino math, and Latin Modern Mono remain. Running headers use bold XCharter at 10.5/13pt in KUHeader (`#3A2026`), with an 18pt header height and 13pt header separation. The running-header rule is 0.75pt in KURule (`#B51F3F`), set inside a group so its color does not leak. The official title, abstract heading, author role markers, and logo keep KUCrimson (`#862633`). The warm-white/pale-pink card (`#FCF8F9`) has a borderless 2.5mm radius and balanced padding, with a soft, low-opacity warm fuzzy shadow (KUShadow `#6C3B47` at 24% over white). Existing author/abstract/resource order is preserved.

The supplied Overleaf log identifies LaTeX2e 2026-06-01 with thmtools 0.76. This kernel adds native sibling-counter aliases, while thmtools also pre-creates them, producing duplicate counter errors and cascading missing environments. The compatibility block immediately after loading thmtools checks for `\newcounteralias`: on new kernels it keeps automatic reference-name registration but removes the obsolete alias-creation and sibling-rewriting path; older kernels keep their original behavior. `command.tex` remains the only owner of theorem declarations. No counter is deleted and no error is suppressed. The upstream workaround is documented at https://github.com/muzimuzhi/thmtools/issues/75#issuecomment-4804901577. The original definition/theorem family is retained; axiom/property now resets by section in body and appendix. The missing independence-symbol helper is implemented. A fictional theorem/proof example is corrected to a valid left-inverse/injectivity example.

## Collaboration and rights

OpenCode Claude (`opencode-go/claude-haiku-5-5`) completed a read-only review (session `ses_e8df00ab2ffefaN0SvI3TcDVAT`) and an actual scoped write to the guide (session `ses_e8de8e51fffe8Kjp7y8HM0UUZ7`). Codex integrated and compiled the changes; Claude did not run compilation. A first write attempt was denied by a Windows path-pattern mismatch before the bridge was repaired. No failed write was counted as a successful modification.

Gemini supplied design advice for the palette and shadow. Claude updated this README using Skill context supplied by Codex. Neither model performed compilation or rendering; Codex independently compiled and rendered the integrated final version. The Google model available in the runtime catalog was `opencode-go/gemini-4-argon` (design session `ses_e8dd7187bffeirbmOHQZHHJJ87`). Claude used Skill text supplied by Codex in session `ses_e8dd5fe0bffeomlQ1LsyrtAbyH`; its earlier external Skill read was denied and no source modification occurred during that failed attempt.

The original CC BY-SA 4.0 attribution remains in the class. Korea University's mark is governed separately by its usage restrictions, as recorded in `TemplateAssets/ASSET_SOURCE.txt`. This template implies no university endorsement.

## Validation of this author-template revision

OpenCode Claude implemented the centered author/affiliation/email registries and reviewed the integrated automatic API (session `ses_e8c8d1632ffeh76OxxeojifJAr`). Codex implemented the high-level three-field records and the natbib number styling, then executed compilation and PDF inspection. Author names use standard 10/13pt bold Charter; units and emails use 9/12pt and notes use 8/10pt. Text dagger/section glyphs avoid tiny math-font substitutions in role superscripts.

Seven independent fixtures passed compilation and PDF checks: a single automatic author, three authors sharing one unit, multiple affiliations plus contribution roles, 24 authors/emails, legacy calls with repeated units/emails, registry reset, and empty unit/email fields. Unique unit/email counts and actual bold citation-number fonts were checked. A conflicting explicit affiliation ID intentionally failed with the expected diagnostic. Multi-author, multi-unit and long-list previews were visually inspected.

The current supplied main.tex keeps the template guide commented out and contains no manuscript citations. Its compiled preview is two pages and therefore retains the existing natbib empty-bibliography warning; the citation-bearing fixtures compile without warnings. The guide has not been re-enabled. The earlier LaTeX 2026/thmtools compatibility patch, crimson palette, top-aligned vector logo and card shadow remain intact. No live Overleaf compilation was performed.
