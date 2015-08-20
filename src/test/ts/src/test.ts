import { org } from 'kevoree-model';
import { WebSocketCDNClient } from './WebSocketCDD';


var dm = org.kevoree.modeling.memory.manager.DataManagerBuilder
          // .create()
          // .withContentDeliveryDriver(new WebSocketCDNClient('ws://ws.kevoree.org/cdd'))
          // .build();
          .buildDefault();
var kModel = new org.KevoreeModel(dm);
var view = kModel.universe(0).time(0);

kModel.connect((e: any) => {
  if (e) {
    console.log(e);
  } else {
    console.log('connected');

    var model: org.kevoree.Model = view.createModel();

    var node = view.createNode();
    node.setName("node0");

    var jsNode = view.createNodeType();
    jsNode.setName('JavascriptNode');
    jsNode.setVersion('6.0.0-alpha');
    var meta = view.createValue();
    meta.setName('fooMeta');
    meta.setValue('barValue');
    jsNode.addMetaData(meta);

    // console.log(jsNode.toJSON());
    model.addNodes(node);
    // console.log(model.toJSON());

    view.setRoot(model, (e) => {
      if (e) {
        console.log('boum');
        console.log(e);
      } else {
        function a(o: org.kevoree.modeling.KObject): org.kevoree.modeling.traversal.visitor.KVisitResult {
          console.log('visit0', o);
          return null;
        }

        function b(e: any): void {
          console.log('visit');
        }

        model.visit(a, b);
      }
    });
    // kModel.save((e: any) => {
    //   if (e) {
    //     console.log(e);
    //   } else {
    //     console.log('saved');
    //   }
    // });
  }
});
