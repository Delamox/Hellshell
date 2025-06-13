import QtQuick

SeqNode {
    a: "u"
    r: 0
    SeqNode {
        a: "d"
        r: 180
        SeqNode {
            a: "r"
            r: 90
            SeqNode {
                a: "l"
                r: 270
                SeqNode {
                    a: "u"
                    r: 0
                }
            }
        }
    }
}
