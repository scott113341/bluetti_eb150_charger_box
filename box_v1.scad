function holes_for_xt60_panel(x, y, holePaddingRadius, rectPaddingPerSide) =
    let (holeRadius = 2.5/2)
    let (paddedHoleRadius = holeRadius + holePaddingRadius)
    let (hole1X = x - holePaddingRadius)
    let (hole1Y = y + 4.6 - holePaddingRadius)
    let (hole2X = hole1X + 24.5)
    let (hole2Y = hole1Y)
    
    let (rectX = x + 4.1 - rectPaddingPerSide)
    let (rectY = y - rectPaddingPerSide)
    let (rectWidth = 18.8 + rectPaddingPerSide * 2)
    let (rectHeight = 11.7 + rectPaddingPerSide * 2)
   
    [
        [hole1X, hole1Y, 0, 0, paddedHoleRadius, yappCircle],
        [hole2X, hole2Y, 0, 0, paddedHoleRadius, yappCircle],
        [rectX, rectY, rectWidth, rectHeight, 0, yappRectangle]
    ];

// Set to false to speed up preview render
render_honeycomb = false;

include <./YAPP_Box/YAPPgenerator_v3.scad>

pcbLength    = 40;
pcbWidth     = 76;
pcbThickness = 39;

paddingFront = 0;
paddingBack  = 40;
paddingRight = 15;
paddingLeft  = 15;

baseWallHeight = 30;
lidWallHeight  = 30;

basePlaneThickness = 3;
lidPlaneThickness  = 3;
wallThickness      = 3;
ridgeHeight        = 6;

standoffHeight = 10;

cutoutsFront = [
    [0, -39, 75, 39, 0, yappRectangle],
];

cutoutsBack = concat(
    render_honeycomb ? [[0, -45, 80, 17.5, 0, yappRectangle, [maskHoneycomb, 2.0, 3.2, 30]]] : [],
    []
);

cutoutsLid = concat(
    holes_for_xt60_panel(-35, 70, 0.2, 0.1),
    holes_for_xt60_panel(-35, -5, 0.2, 0.1),
    [
        [-33, 28, 5, 20, 0, yappRectangle],
        [-23, 28, 5, 20, 0, yappRectangle],
        [-13, 28, 5, 20, 0, yappRectangle],
        [-3, 28, 5, 20, 0, yappRectangle],
        [7, 28, 5, 20, 0, yappRectangle],
        [17, 28, 5, 20, 0, yappRectangle],
        [27, 28, 5, 20, 0, yappRectangle],
    ]
);

// https://www.dafont.com/fw-punk-is-dead.font
labelsPlane = [
    [38, 87.5, 0, 5, yappLid, "FW Punk Is Dead", 12, "Out", 0, yappTextLeftToRight, yappTextHAlignLeft, yappTextVAlignBottom, 1.1],
    [38, 12.5, 0, 5, yappLid, "FW Punk Is Dead", 12, "In", 0, yappTextLeftToRight, yappTextHAlignLeft, yappTextVAlignBottom, 1.1],
];

snapJoins = [
    [8, 10, yappLeft, yappRight, yappSymmetric, yappRectangle],
    [6, 10, yappFront, yappBack, yappSymmetric, yappRectangle],
];

pcbStands = [
    [25, 15, yappHole],
    [25, 60, yappHole],
];

// Debug
//showPCB = true;
//showSideBySide = false;

YAPPgenerate();
