with version "6.0.0-SNAPSHOT"
with kmfVersion "4.19.1-SNAPSHOT"

class org.kevoree.NamedElement {
    att name: String
}

class org.kevoree.Model {
    rel nodes:      org.kevoree.Node
    rel groups:     org.kevoree.Group
    rel channels:   org.kevoree.Channel
    rel namespaces: org.kevoree.Namespace
}

class org.kevoree.Instance extends org.kevoree.NamedElement {
    att started : Bool

    rel dictionary:     org.kevoree.Dictionary      with maxBound 1
    rel typeDefinition: org.kevoree.TypeDefinition  with maxBound 1

    rel metaData: org.kevoree.Value
}

class org.kevoree.Node extends org.kevoree.Instance {
    rel host:       org.kevoree.Node  with opposite "children"
    rel groups:     org.kevoree.Group with opposite "nodes"
    rel children:   org.kevoree.Node  with opposite "host"
    rel networks:   org.kevoree.NetworkInfo
    rel components: org.kevoree.Component
}

class org.kevoree.Component extends org.kevoree.Instance {
    rel inputs:  org.kevoree.Port
    rel outputs: org.kevoree.Port
}

class org.kevoree.Group extends org.kevoree.Instance {
    rel nodes: org.kevoree.Node with opposite "groups"
    rel fragmentDictionaries: org.kevoree.FragmentDictionary
}

class org.kevoree.Channel extends org.kevoree.Instance {
    att isRemote: Bool

    rel ports: org.kevoree.Port with opposite "channels"
    rel fragmentDictionaries: org.kevoree.FragmentDictionary
}

class org.kevoree.Namespace extends org.kevoree.NamedElement {
    rel typeDefinitions: org.kevoree.TypeDefinition
}

class org.kevoree.TypeDefinition extends org.kevoree.NamedElement {
    att version:  String
    att abstract: Bool

    rel dictionaryType: org.kevoree.DictionaryType  with maxBound 1

    rel metaData:    org.kevoree.Value
    rel deployUnits: org.kevoree.DeployUnit
}

class org.kevoree.PortType extends org.kevoree.NamedElement {
    rel metaData: org.kevoree.Value
    // add message types: MessagePack, ProtoBuf, JsonSchema, Raw...
}

class org.kevoree.ComponentType extends org.kevoree.TypeDefinition {
    att remote : Bool

    rel inputs:  org.kevoree.PortType
    rel outputs: org.kevoree.PortType
}

class org.kevoree.GroupType extends org.kevoree.TypeDefinition {
    att remote : Bool
}

class org.kevoree.NodeType extends org.kevoree.TypeDefinition {}

class org.kevoree.ChannelType extends org.kevoree.TypeDefinition {
    att local : Bool
}

class org.kevoree.Port extends org.kevoree.NamedElement {
    rel channels: org.kevoree.Channel with opposite "ports"
}

class org.kevoree.Dictionary {
    rel values : org.kevoree.Value
}

class org.kevoree.FragmentDictionary extends org.kevoree.Dictionary {
    rel node: org.kevoree.Node  with maxBound 1
}

class org.kevoree.Value extends org.kevoree.NamedElement {
    att value: String
}

class org.kevoree.DictionaryType {
    rel attributes: org.kevoree.AttributeType
}


class org.kevoree.DataType {}
class org.kevoree.StringDataType extends org.kevoree.DataType {
    att multiline: Bool
}
class org.kevoree.BooleanDataType extends org.kevoree.DataType {}
class org.kevoree.IntegerDataType extends org.kevoree.DataType {
    att min: Int
    att max: Int
}
class org.kevoree.DecimalDataType extends org.kevoree.DataType {
    att min: Double
    att max: Double
}
class org.kevoree.ListDataType extends org.kevoree.DataType {

}
class org.kevoree.CharDataType extends org.kevoree.DataType {}
class org.kevoree.ButtonDataType extends org.kevoree.DataType {
    att code: String
}

class org.kevoree.AttributeType extends org.kevoree.TypedElement {
    att optional:          Bool
    att datatype:          org.kevoree.DataType
    att defaultValue:      String
    att fragmentDependant: Bool
}

class org.kevoree.TypedElement extends org.kevoree.NamedElement {
    rel genericTypes: org.kevoree.TypedElement
}

class org.kevoree.DeployUnit extends org.kevoree.NamedElement {
    att version: String
    att hashcode: String

    rel metaData: org.kevoree.Value

    rel requiredLibs: org.kevoree.DeployUnit
}

class org.kevoree.NetworkInfo extends org.kevoree.NamedElement {
    rel values: org.kevoree.Value
}
