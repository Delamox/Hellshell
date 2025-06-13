import QtQuick

SeqNode {
    a: "d"
    r: 180
    SeqNode {
        a: "d"
        r: 180
        SeqNode {
            a: "l"
            r: 270
            SeqNode {
                a: "r"
                r: 90
                SeqNode {
                    a: "l"
                    r: 270
                    SeqNode {
                        a: "r"
                        r: 90
                    }
                }
            }
        }
    }
}
