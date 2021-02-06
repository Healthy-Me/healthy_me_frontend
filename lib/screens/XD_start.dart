import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XD_start extends StatelessWidget {
  XD_start({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(142.0, 262.6),
            child: SizedBox(
              width: 130.0,
              height: 164.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(12.2, 0.0, 101.7, 115.4),
                    size: Size(130.0, 163.8),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 89.8, 115.2),
                          size: Size(101.7, 115.4),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: SvgPicture.string(
                            _svg_fgkbih,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(56.3, 0.0, 45.3, 115.4),
                          size: Size(101.7, 115.4),
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child: SvgPicture.string(
                            _svg_ljitmf,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(15.5, 52.6, 71.3, 32.5),
                          size: Size(101.7, 115.4),
                          pinLeft: true,
                          pinRight: true,
                          fixedHeight: true,
                          child: SvgPicture.string(
                            _svg_lokb40,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(26.1, 61.3, 50.1, 19.8),
                          size: Size(101.7, 115.4),
                          fixedWidth: true,
                          fixedHeight: true,
                          child: SvgPicture.string(
                            _svg_3cozk1,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(20.3, 30.5, 13.0, 11.6),
                          size: Size(101.7, 115.4),
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: const Color(0xff303a32),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(68.1, 30.5, 13.0, 11.6),
                          size: Size(101.7, 115.4),
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: const Color(0xff303a32),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 126.8, 130.0, 37.0),
                    size: Size(130.0, 163.8),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: Text(
                      'Healthy Me',
                      style: TextStyle(
                        fontFamily: 'Spoqa Han Sans Neo',
                        fontSize: 25,
                        color: const Color(0xff03282d),
                        height: 0.64,
                        shadows: [
                          Shadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_fgkbih =
    '<svg viewBox="167.1 225.9 89.8 115.2" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ffacd1a6"  /><stop offset="1.0" stop-color="#ffbbae3e"  /></linearGradient></defs><path transform="translate(167.1, 225.88)" d="M 12.70655632019043 0 C 19.72419548034668 0 25.41311264038086 5.26292896270752 25.41311264038086 11.75508213043213 L 25.41311264038086 28.5122241973877 C 25.41311264038086 28.5122241973877 18.30312156677246 30.10125350952148 18.19289016723633 35.81352615356445 C 18.0826587677002 41.52580261230469 25.41311264038086 44.22626495361328 25.41311264038086 44.22626495361328 C 25.41311264038086 44.22626495361328 37.87212371826172 48.35564804077148 50.57938003540039 48.29358673095703 C 63.28663635253906 48.23152160644531 76.24214172363281 43.97801208496094 76.24214172363281 43.97801208496094 L 89.83615875244141 74.34320068359375 C 76.58525085449219 81.71869659423828 65.83303833007813 87.77524566650391 56.78141403198242 92.90095520019531 C 51.52444076538086 95.87783813476563 46.98049163818359 98.46266937255859 42.67497634887695 100.9110107421875 C 42.67497634887695 100.9110107421875 17.49610900878906 115.1997985839844 12.70655632019043 115.1997985839844 C 5.688919067382813 115.1997985839844 0 109.9368743896484 0 103.4447250366211 L 0 11.75508213043213 C 0 5.26292896270752 5.688919067382813 0 12.70655632019043 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_ljitmf =
    '<svg viewBox="223.4 225.9 45.3 115.4" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff406f74"  /><stop offset="1.0" stop-color="#ffaacfa5"  /></linearGradient></defs><path transform="translate(236.75, 225.88)" d="M 19.23563003540039 0 C 25.55827713012695 0 31.88092422485352 6.275579929351807 31.88092422485352 10.95374870300293 C 31.88092422485352 10.95374870300293 32.1566162109375 99.906982421875 31.88092422485352 106.7292175292969 C 31.6052360534668 113.5514678955078 22.32784652709961 116.2302169799805 19.23563003540039 115.1997985839844 C 12.25182914733887 115.1997985839844 -13.31680393218994 93.33516693115234 -13.31680393218994 93.33516693115234 L 6.590339660644531 44.0454216003418 C 6.590339660644531 44.0454216003418 13.88715362548828 41.52569961547852 13.72548770904541 36.00830459594727 C 13.56382179260254 30.49090766906738 6.590339660644531 28.13218688964844 6.590339660644531 28.13218688964844 L 6.590339660644531 10.95374870300293 C 6.590339660644531 6.275579929351807 12.91298484802246 0 19.23563003540039 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_lokb40 =
    '<svg viewBox="182.6 278.5 71.3 32.5" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#fff65f5f"  /><stop offset="1.0" stop-color="#ffe55f5f"  /></linearGradient></defs><path transform="matrix(0.0, 1.0, -1.0, 0.0, 253.91, 278.47)" d="M 10.50262832641602 0.005220651626586914 C 21.3039379119873 -0.4494218826293945 32.5269889831543 28.92853164672852 32.5269889831543 34.04322814941406 L 32.5269889831543 34.04322814941406 L 32.5269889831543 35.32106781005859 C 32.5269889831543 40.43576049804688 22.1936149597168 72.337158203125 10.50262832641602 71.29367828369141 C -1.188356518745422 70.25019836425781 -0.4074351787567139 55.96453857421875 1.241660833358765 52.79327011108398 L 9.558319091796875 35.32106781005859 L 1.241660833358765 17.70269203186035 C -1.475204825401306 10.40625381469727 -0.2986788749694824 0.4598634243011475 10.50262832641602 0.005220651626586914 Z" fill="url(#gradient)" stroke="none" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" filter="url(#shadow)"/></svg>';
const String _svg_3cozk1 =
    '<svg viewBox="193.2 287.2 50.1 19.8" ><path transform="matrix(0.990268, -0.139173, 0.139173, 0.990268, 193.22, 293.97)" d="M -4.03310026214366e-16 5.542302131652832 L 11.87232780456543 8.747420310974121 L 12.90063953399658 7.657881736755371 L 13.74927997589111 8.747420310974121 L 14.38597297668457 9.543117523193359 L 14.78588485717773 8.747420310974121 L 17.92479133605957 3.491513748416365e-16 L 18.90752029418945 8.789507865905762 L 19.53264999389648 12.87372398376465 L 21.71029663085938 8.593482971191406 L 22.78657531738281 6.624425888061523 L 23.60124778747559 9.302104949951172 L 24.35192680358887 11.4908332824707 L 25.11253929138184 10.61585140228271 L 28.98465919494629 6.161489009857178 L 31.92474365234375 11.47872257232666 L 32.95662307739258 13.14115905761719 L 33.77646636962891 11.93134880065918 L 35.30423736572266 9.95641040802002 L 36.94378662109375 12.78834629058838 L 48.69823837280273 11.83881378173828" fill="none" stroke="#e4e4e4" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg>';
