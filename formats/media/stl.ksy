meta:
  id: stl
  endian: le
  application: 3D Systems Stereolithography
  file-extension: stl
  xref:
    wikidata: Q1238229
  license: CC0-1.0
doc: |
  STL files are used to represent simple 3D models, defined using
  triangular 3D faces.

  Initially it was introduced as native format for 3D Systems
  Stereolithography CAD system, but due to its extreme simplicity, it
  was adopted by a wide range of 3D modelling, CAD, rapid prototyping
  and 3D printing applications as the simplest 3D model exchange
  format.

  STL is extremely bare-bones format: there are no complex headers, no
  texture / color support, no units specifications, no distinct vertex
  arrays. Whole model is specified as a collection of triangular
  faces.

  There are two versions of the format (text and binary), this spec
  describes binary version.
seq:
  - id: header
    size: 80
  - id: num_triangles
    type: u4
  - id: triangles
    type: triangle
    repeat: expr
    repeat-expr: num_triangles
types:
  triangle:
    doc: |
      Each STL triangle is defined by its 3 points in 3D space and a
      normal vector, which is generally used to determine where is
      "inside" and "outside" of the model.
    seq:
      - id: normal
        type: vec3d
      - id: vertices
        type: vec3d
        repeat: expr
        repeat-expr: 3
  vec3d:
    seq:
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4
