/**
 * Phylogenetic Tree
 *
 * Author: Michiel Van Bel http://bioinformatics.psb.ugent.be/plaza/
 * Adapted By: Ken Seal http://comparative-legumes.org
 *
 * Parses Newick data and depends on wz_graphics.js to draw to the tree.
 *---------------------------------------------------------------------------*/

/*
 * Object of a node,
 * with asociated functions.
 *
 * A node is a general abstraction, and it can
 * represent both normal internal nodes, the root node,
 * and leaves.
 *
 * If a node is internal, it has both childrennodes and a parentnode.
 * If a node is a leave, it has a parent node, but no children.
 * If a node is the root node, it has children but no parent.
 *
 * We give a general empty ("") name to all newly constructed nodes,
 * so we will not have any null-references.
 */
function Node(value, pn) {
  /** variables **/
  // every node can have an associated value.
  this.value = value;
  // array containing all children (can be empty)
  this.childrenNodes = new Array();
  // the name of the node ("" if internal)
  this.nodeName = "";
  // the reference to the parent node
  this.parentNode = pn;
  // the relative y-coord at which the node should be drawn
  this.drawHeight = -1;
  // the relative x-coord at which the node should be drawn
  this.drawDepth = -1;

  /** functions **/
  // returns the value of this node
  this.getValue = getValue;
  // returns the name of this node
  this.getNodeName = getNodeName;
  // sets the name of this node
  this.setNodeName = setNodeName;
  // adds a child node to this node
  this.addChild = addChild;
  // returns a child (from certain index) from this node
  this.getChild = getChild;
  // returns the number of children of this node
  this.numChildren = numChildren;
  // returns string representation of this node
  this.nodeToString = nodeToString;
  // returns the depth (relative to root node)
  this.getDepth = getDepth;
  // returns the number of leave-nodes that are children of this node
  this.numLeaves = numLeaves;
  // returns the relative y-coord of this node
  this.getDrawHeight = getDrawHeight;
  // returns the relative x-coord of this node
  this.getDrawDepth = getDrawDepth;
  // sets the relative y--coord of this node
  this.setDrawHeight = setDrawHeight;
  // sets the relative x-coord of this node
  this.setDrawDepth = setDrawDepth;
  // returns all the leaves which are children of this node
  this.getLeaves = getLeaves;
  // returns the maximum depth of leaves connected to this node
  this.getMaxDepth = getMaxDepth;
  // returns the parentnode of this node.
  this.getParentNode = getParentNode;
  // returns whether or not this node is a leave
  this.isLeave = isLeave;
}

/*
 * returns whether or not the node is a leave
 */
  function isLeave() {
    if (this.numChildren() == 0)
      return true;
    else
      return false;
  }

/*
 * returns the value of the node
 */
function getValue() {
  return this.value;
}

/*
 * Returns the parentnode of this node.
 */
function getParentNode() {
  return this.parentNode;
}

/*
 * returns the maximum depth of leaves connected to this node
 */
function getMaxDepth() {
  var leaves = this.getLeaves();
  var result = 0;
  for ( var i = 0; i < leaves.length; i++) {
    var node = leaves[i];
    var depth = node.getDepth();
    if (depth > result)
      result = depth;
  }
  return result;
}

/*
 * returns all the leaves which are children of this node
 */
function getLeaves() {
  var leaves = new Array();
  if (this.numChildren() == 0) {
    leaves.splice(leaves.length - 1, 0, this);
    return leaves;
  } else {
    for ( var i = 0; i < this.numChildren(); i++) {
      var nod = this.getChild(i);
      var tempLeaves = nod.getLeaves();
      leaves = leaves.concat(tempLeaves);
    }
    return leaves;
  }
}

/*
 * sets the relative x-coord of this node
 */
function setDrawDepth(nd) {
  this.drawDepth = nd;
}

/*
 * sets the relative y--coord of this node
 */
function setDrawHeight(nh) {
  this.drawHeight = nh;
}

/*
 * returns the relative x-coord of this node
 */
function getDrawDepth() {
  return this.drawDepth;
}

/*
 * returns the relative y-coord of this node
 */
function getDrawHeight() {
  return this.drawHeight;
}

/*
 * adds a child node to this node
 */
function addChild(childNode) {
  this.childrenNodes.splice(this.childrenNodes.length - 1, 0, childNode);
}

/*
 * returns a child (from certain index) from this node
 */
function getChild(ind) {
  return this.childrenNodes[ind];
}

/*
 * returns the number of children of this node
 */
function numChildren() {
  return this.childrenNodes.length;
}

/*
 * returns the name of this node
 */
function getNodeName() {
  return this.nodeName;
}

/*
 * sets the name of this node
 */
function setNodeName(newName) {
  this.nodeName = newName;
}

/*
 * returns string representation of this node
 */
function nodeToString() {
  var res = "";
  for ( var i = 0; i < this.getDepth(); i++)
    res = res + "&nbsp;&nbsp;&nbsp;";
  if (this.getNodeName() == "")
    res = res + "NODE";
  else
    res = res + this.getNodeName();
  res = res + "(" + this.getDepth() + ")";
  res = res + "<br/>";
  for ( var i = 0; i < this.numChildren(); i++)
    res += this.getChild(i).nodeToString();
  return res;
}

/*
 * returns the number of leave-nodes that are children of this node
 */
function numLeaves() {
  var res = 0;
  if (this.numChildren() == 0)
    res = 1;
  else {
    for ( var i = 0; i < this.numChildren(); i++) {
      res = res + this.getChild(i).numLeaves();
    }
  }
  return res;
}

/*
 * returns the depth (relative to root node)
 */
function getDepth() {
  var tempNode = this;
  var res = 0;
  while (tempNode.parentNode != null) {
    tempNode = tempNode.parentNode;
    res = res + 1;
  }
  return res;
}

/*
 * ***********************************************************
 *
 * Some other functions, not part of the Node object. These functions are
 * specifically designed to parse a tree-structure from the newick tree
 * representation.
 *
 * ***********************************************************
 */

/*
 * takes an array of leaves, and sets the correct drawing depths and heights.
 * Leaves are all set to maxDepth.
 */
function setCorrectParameters(leaves, maxDepth) {
  for ( var i = 0; i < leaves.length; i++) {
    var node = leaves[i];
    node.setDrawDepth(maxDepth);
    node.setDrawHeight(i + 1);
  }
}

/*
 * basic parsing function, takes a single newicktree string as variable.
 */
function parseNewick(s) {
  var x = s.lastIndexOf(":");
  if (x == -1) {
    s = extendTree(s);
  } else if (s.lastIndexOf(":") < s.lastIndexOf(")")) {
    s += "100:0.1";
  }
  document.write(s);
  x = s.lastIndexOf(":");
  var doubleVal = s.substr(x + 1);
  var pN = new Node(doubleVal, null);
  return build(s, pN, 0, x);
}

/*
 * basic parsing function, takes a single newicktree string as variable.
 */
function parseNewickSpecies(s) {
  if (s.charAt(s.length - 1) == ';')
    s = s.substring(0, s.length - 1);
  var parentNode = new Node(0.1, null);
  parentNode.setNodeName("");
  return build(s, parentNode, 0, s.length, 0);
}

/*
 * prints the parsed tree to the current document. Is not really display safe
 * (can overwrite the text of other stuff).
 */
  function printParsedTree(parsedTree) {
    if (parsedTree == null)
      document.write("Parsed tree is null!");
    else {
      for ( var i = 0; i < parsedTree.numChildren(); i++) {
        printParsedNodes(parsedTree.getChild(i), parsedTree.getChild(i)
            .getDepth());
      }
      document.write("<br/>");
    }
  }

/*
 * prints the information about one parsed node (used by the printParsedTree
 * method )
 */
  function printParsedNodes(parsedNode, dep) {
    if (parsedNode == null)
      document.write("Parsed node is null!");
    else {
      for ( var i = 0; i < dep; i++)
        document.write("&nbsp;&nbsp;");
      document.write(parsedNode.getNodeName() + " :: "
          + parsedNode.getDepth() + " -> "
          + parsedNode.getParentNode().getDepth() + " || "
          + parsedNode.getDrawHeight());
      for ( var i = 0; i < parsedNode.numChildren(); i++) {
        printParsedNodes(parsedNode.getChild(i), parsedNode.getChild(i)
            .getDepth());
      }
      document.write("<br/>");
    }
  }

/*
 * The parsing function only works well when every node has an associated value.
 * Because not all newick forms have this, we have to adapt the original string
 * to make the tree representation parseable. Used by the parseNewick method
 */
function extendTree(s) {
  var newTreeString = "";
  for ( var i = 0; i < s.length; i++) {
    var p = s.charAt(i);
    if (p == ')') {
      var p2 = s.charAt(i - 1);
      var p3 = s.charAt(i + 1);
      var isWritten = false;
      if (p2 == ')') {
        newTreeString += p;
        isWritten = true;
      } else {
        newTreeString += ":1.0";
        newTreeString += p;
        isWritten = true;
      }
      if (p3 == ',') {
        if (!isWritten) {
          newTreeString += p;
        }
      } else {
        if (!isWritten) {
          newTreeString += p;
        }
        newTreeString += ":1.0";
      }
    } else if (p == ',') {
      newTreeString += ":1.0";
      newTreeString += p;
    } else {
      newTreeString += p;
    }
  }
  return newTreeString;
}

/*
 * builds nodes and links them in a recursive way This is the main method used
 * for parsing a newick string + s : The current newick string to be parsed +
 * nodeParent : The current parent node (to which new nodes can be attached) +
 * from : Indicates the starting point in the string that will be parsed + to :
 * Indicates the ending point in the string that will be parsed + iterativeDepth :
 * current depth in the recursion. Needed for determining depth of treenodes
 */
function build(s, nodeParent, from, to, iterativeDepth) {
  iterativeDepth++;
  if (s.charAt(from) != '(') {
    nodeParent.setNodeName(s.substring(from, to));
    return nodeParent;
  }
  var b = 0;
  var colon = 0;
  var x = from;
  var lastClosed = 0;
  var lastLastClosed = 0;
  for ( var i = from; i < to; i++) {
    var c = s.charAt(i);
    if (c == '(') {
      b++;
    } else if (c == ')') {
      b--;
      lastLastClosed = lastClosed;
      lastClosed = i;
    } else if (c == ':') {
      colon = i;
    }
    if (b == 0) {
      var sub = s.substring(x + 1, colon);
      var tdrValue = s.substring(colon + 1, i);
      if (sub.lastIndexOf(')') == -1) {// leave node
        var nn = new Node(tdrValue, nodeParent);
        var nb = build(s, nn, x + 1, colon, iterativeDepth);
        nodeParent.addChild(nb);
      } else {
        var tdrName = sub.substring(sub.lastIndexOf(')') + 1, colon);
        var nn = new Node(tdrValue, nodeParent);
        nn.setNodeName(tdrName);
        var nb = build(s, nn, x + 1, lastLastClosed + 1,
            iterativeDepth);
        nodeParent.addChild(nb);
      }
      x = i;
    } else if ((b == 1 && c == ',')) {
      var tdrValue = s.substring(colon + 1, i);
      var tdrName = s.substring(lastClosed + 1, colon);
      if (lastClosed == 0) {
        var nn = new Node(tdrValue, nodeParent);
        var nb = build(s, nn, x + 1, colon, iterativeDepth);
        nodeParent.addChild(nb);
      } else {
        var sub = s.substring(x + 1, lastClosed + 1);
        if (sub.lastIndexOf(')') == -1) { // leave node
          var nn = new Node(tdrValue, nodeParent);
          var nb = build(s, nn, x + 1, colon, iterativeDepth);
          nodeParent.addChild(nb);
        } else {
          var nn = new Node(tdrValue, nodeParent);
          nn.setNodeName(tdrName);
          var nb = build(s, nn, x + 1, lastClosed + 1,
              iterativeDepth);
          nodeParent.addChild(nb);
        }
      }
      x = i;
    } else {
      // do nothing
    }
  }
  return nodeParent;
}

function writeNodes(nodes) {
  for ( var i = 0; i < nodes.length; i++) {
    document.write(nodes[i].getNodeName() + "&nbsp;");
  }
  document.write("<br/>");
}

function getMaximumDrawDepth(nodes) {
  var max = 0;
  for ( var i = 0; i < nodes.length; i++) {
    var temp = nodes[i].getDrawDepth();
    if (temp > max) {
      max = temp;
    }
  }
  return max;
}

/*
 * Global drawing variables.
 */
var DEPTH_CONST = 50;
var DEPTH_CONST1 = 300;
var DEPTH_CONST2 = 50;
var HEIGHT_CONST = 18;
var DRAW_COLOR = "#eee";
var STROKE = 2;
var FONT = "Tahoma";
var FONT_SIZE = "12px";

/*
 * Species URL Mapping
 */

var speciesUrls = new Array();

speciesUrls["Arachis_hypogaea"] = "http://arahy.comparative-legumes.org";
speciesUrls["Cajanus_cajan"] = "http://cajca.comparative-legumes.org";
speciesUrls["Chamaecrista_fasciculata"] = "http://chafs.comparative-legumes.org";
speciesUrls["Cicer_arietinum"] = "http://cicar.comparative-legumes.org";
speciesUrls["Glycine_max"] = "http://glyma.comparative-legumes.org";
speciesUrls["Lens_culinaris"] = "http://lencu.comparative-legumes.org";
speciesUrls["Lotus_japonicus"] = "http://lotja.comparative-legumes.org";
speciesUrls["Lupinus_albus"] = "http://lupal.comparative-legumes.org";
speciesUrls["Lupinus_angustifolius"] = "http://lupan.comparative-legumes.org";
speciesUrls["Medicago_sativa"] = "http://medsa.comparative-legumes.org";
speciesUrls["Medicago_truncatula"] = "http://medtr.comparative-legumes.org";
speciesUrls["Phaseolus_coccineus"] = "http://phacn.comparative-legumes.org";
speciesUrls["Phaseolus_vulgaris"] = "http://phavu.comparative-legumes.org";
speciesUrls["Pisum_sativum"] = "http://pea.comparative-legumes.org";
speciesUrls["Trifolium_pratense"] = "http://tripr.comparative-legumes.org";
speciesUrls["Vicia_faba"] = "http://vicfa.comparative-legumes.org";
speciesUrls["Vigna_radiata"] = "http://vigra.comparative-legumes.org";
speciesUrls["Vigna_unguiculata"] = "http://vigun.comparative-legumes.org";

/**
 * Draws phylogenetic tree.
 *
 * Canvas is a jsGraphics oject.
 * Tree is a parsedNewickSpecies() tree.
 *
 * @param canvas
 * @param tree
 */
function drawTreeNew(canvas, tree) {

  // part 1, get the correct heights for all the leaves and branches.
  // This is done by a top-down iterative algorithm.
  // get the necessary variables from the tree
  var leaves = tree.getLeaves();
  var maxDepth = tree.getMaxDepth();
  leaves = invertsPosition(leaves);
  setCorrectParameters(leaves, maxDepth);
  var toDrawNodes = new Array();
  toDrawNodes = toDrawNodes.concat(leaves);

  var iterations = 0;
  while (toDrawNodes.length > 1) {
    if (iterations++ > 50) {
      break;
    }
    for ( var i = 0; i < toDrawNodes.length; i++) {
      var n1 = toDrawNodes[i];
      var sameParentArray = getSameParentNodesIndices(toDrawNodes, i + 1,
          n1.getParentNode());
      if (sameParentArray.length == 0) {
      } else {
        var drawNodes = new Array();
        drawNodes[0] = n1;
        for ( var j = 0; j < sameParentArray.length; j++)
          drawNodes[j + 1] = toDrawNodes[sameParentArray[j]];
        var newHeight = 0;
        for ( var j = 0; j < drawNodes.length; j++)
          newHeight += drawNodes[j].getDrawHeight();
        newHeight = newHeight / drawNodes.length;
        // prepare parent node
        var parentNode = n1.getParentNode();
        parentNode.setDrawHeight(newHeight);
        // remove the nodes that were used.
        toDrawNodes = removeNodes(drawNodes, toDrawNodes);
        // push parent node onto stack of nodes to be drawn
        toDrawNodes.push(parentNode);
        // jump outta for loop, into outer while loop.
        break;
      }
    }
  }
  // part 2, with the correct heights set, draw the correct branches with the
  // approptiate lengths.
  // This is done by a bottom-up recursive algorithm.
  var maxDepth = tree.getMaxDepth();
  drawBranchRecursive(canvas, tree, 0, maxDepth);
  // canvas settings
  canvas.setColor(DRAW_COLOR);
  canvas.setFont(FONT, FONT_SIZE, Font.PLAIN);
  canvas.paint();
}

/*
 * Draw the branches in a recursive manner
 */
function drawBranchRecursive(canvas, node, startx, maxDepth) {
  var nodeName = node.getNodeName();
  var nodeLength = node.getValue();
  if (startx == 0) {
    nodeLength = nodeLength / 5;
  }
  var numChildren = node.numChildren();
  var height = node.getDrawHeight();

  // set the branch stroke and color
  canvas.setColor(DRAW_COLOR);
  canvas.setStroke(STROKE);

  // x,y coords needed for drawing
  var x1 = 0;
  var x2 = 0;
  var y1 = 0;
  var y2 = 0;

  var endHorizontal = startx + nodeLength * DEPTH_CONST1;
  // horizontal line
  x1 = startx;
  x2 = endHorizontal;
  y1 = height * HEIGHT_CONST;
  y2 = height * HEIGHT_CONST;
  if (height > 0)
    canvas.drawLine(x1, y1, x2, y2);
  if (node.isLeave()) {
    // draw string
    var totalNodeName = node.getNodeName();
    var speciesNodeName = totalNodeName.replace(/_/g, " ");
    var newNodeName = "";
    //
    if (speciesUrls[totalNodeName]) {
      newNodeName = "<a class='species_tree_link' id='tree_link_"
        + totalNodeName + "' href='" + speciesUrls[totalNodeName]
        + "'>" + speciesNodeName + "</a>";
    } else {
      newNodeName = "<span class='grey'>" + speciesNodeName + "</span>";
    }
    canvas.drawString(newNodeName, x2 + 10, parseInt(height * HEIGHT_CONST
          - 7));
    canvas.setColor(DRAW_COLOR);
  } else {
    // draw vertical lines
    for ( var i = 0; i < node.numChildren(); i++) {
      var childnode = node.getChild(i);
      x1 = endHorizontal;
      x2 = endHorizontal;
      y1 = height * HEIGHT_CONST;
      y2 = childnode.getDrawHeight() * HEIGHT_CONST;
      if (height > 0)
        canvas.drawLine(x1, y1, x2, y2);
      // draw children nodes in recursive way
      drawBranchRecursive(canvas, childnode, endHorizontal, maxDepth);
    }
    var tr_height = height * HEIGHT_CONST - 12;
    if (tr_height > 0) {
      var innerNodeName = "";
      var nameLower = node.getNodeName().toLowerCase();
      var pl_ind = nameLower.indexOf("plants");
      if (pl_ind != -1) {
        nameLower = nameLower.substring(0, pl_ind) + "_"
          + nameLower.substring(pl_ind);
      }
      innerNodeName = "<span class='group goup_"
        + nameLower
        + "'><a href='"
        + node.getNodeName() + "'>" + node.getNodeName()
        + "</a></span>";
      canvas.drawStringRect(innerNodeName, endHorizontal - 203, height
          * HEIGHT_CONST - 12, 200, "right");
      canvas.fillRect(endHorizontal - 1, height * HEIGHT_CONST - 1, 4, 4);
    }
  }
}

/*
 * inverts the position of all elements in an array
 */
function invertsPosition(nodes) {
  var newNodes = new Array();
  for ( var i = nodes.length - 1; i >= 0; i--) {
    var node = nodes[i];
    newNodes.push(node);
  }
  return newNodes;
}

function removeNodes(nodeArray, nodes) {
  var result = new Array();
  for ( var i = 0; i < nodes.length; i++) {
    var n = nodes[i];
    var contains = containsNode(n, nodeArray);
    if (contains) {
      // do nothing
    } else {
      result.push(n);
    }
  }
  return result;
}

function containsNode(node, nodes) {
  var result = false;
  for ( var i = 0; i < nodes.length; i++) {
    var n = nodes[i];
    if (n == node) {
      result = true;
      break;
    }
  }
  return result;
}

/*
 * removes two used nodes from the array that should draw those nodes.
 *
 * function removeNodes(node1,node2,nodes){ var newNodes = new Array(); for(var
 * i=0;i<nodes.length;i++){ var node = nodes[i];
 * if((node==node1)||(node==node2)){ //do nothing } else{ newNodes.push(node); } }
 * return newNodes; }
 */

/*
 * returns the correct x-offset
 */
  function getGoodOffset(node, maxDepth) {
    if (parseInt(node.getDrawDepth()) == maxDepth)
      return 0.75;
    else
      return 1.0;
  }

/*
 * just returns the minimum of two numbers
 */
  function min(a, b) {
    if (a > b)
      return b;
    else
      return a;
  }

// this gets an array with Nodes as param
function min(a) {
  var result = a[0].getDrawDepth();
  for ( var j = 1; j < a.length; j++) {
    var temp = a[j].getDrawDepth();
    if (temp < result)
      result = temp;
  }
  return result;
}

// this gets an array with Nodes as param
function minDrawDepth(a) {
  var result = a[0].getDrawDepth();
  for ( var j = 1; j < a.length; j++) {
    var temp = a[j].getDrawDepth();
    if (temp < result)
      result = temp;
  }
  return result;
}

function getSameParentNodesIndices(nodes, startIndex, parentNode) {
  var result = new Array();
  for ( var i = startIndex; i < nodes.length; i++) {
    var n = nodes[i];
    var nParent = n.getParentNode();
    if (nParent == parentNode) {
      var tpe = new Array("" + i);
      result = result.concat(tpe);
    }
  }
  return result;
}

/*
 * This method tries to find a node in the array nodes, with the same parentnode
 * as given by the function. Startindex is given to prevent nodes as indicating
 * themselves as having the same parent.
 */
function getSameParentNodeIndex(nodes, startIndex, parentNode) {
  var result = -1;
  for ( var i = startIndex; i < nodes.length; i++) {
    var n = nodes[i];
    if (n != null) {
      var nParent = n.getParentNode();
      if (nParent == parentNode) {
        result = i;
        break;
      }
    } else {
      break;
    }
  }
  return result;
}

/*
 * Sets the div as indicated to be a certain height, depending on the
 * given tree.
 */
function setCorrectDivHeight(tree, divid) {
  var numLeaves = tree.numLeaves();
  var totalHeight = (numLeaves * HEIGHT_CONST + 20) + "px";
  document.getElementById(divid).style.height = totalHeight;
}
