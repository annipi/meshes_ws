class Mesh extends Basic_Mesh{

  Mesh() {
    build();
    //use processing style instead of pshape's, see https://processing.org/reference/PShape.html
    shape.disableStyle();
    s_points.disableStyle();
  }

  // compute both mesh vertices and pshape
  void build() {
    vertices = new ArrayList<PVector>();
    
    PShape s = loadShape("wolf.obj");
    
    int children = s.getChildCount();
    for (int i = 0; i < children; i++) {
      PShape child = s.getChild(i);
      int total = child.getVertexCount();
      for(int j=0; j< total;j++){
        vertices.add(child.getVertex(j));
      }
    }
    
    shape = createShape();
    s_points = createShape();
    shape.beginShape(TRIANGLES);
    s_points.beginShape(POINTS);
    for(PVector v : vertices) {
      shape.vertex(v.x, v.y ,v.z);
      s_points.vertex(v.x, v.y, v.z);
    }
    s_points.endShape();
    shape.endShape();
  }

  // transfer geometry every frame
  // TODO: current implementation targets a quad.
  // Adapt me, as necessary
  void drawImmediate() {
    if(mode == 3){
      PShape s = createShape();
      s.beginShape(POINTS);
      for(PVector v : vertices)
        s.vertex(v.x, v.y ,v.z);
      s.endShape();
      shape(s, 0, -100);
    }else{
      PShape s = createShape();
      s.beginShape(TRIANGLES);
      for(PVector v : vertices)
        s.vertex(v.x, v.y ,v.z);
      s.endShape();
      shape(s, 0, -100);
    }
  }

}


  