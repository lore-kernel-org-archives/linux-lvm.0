From: Martyn.AYSHFORD@orange.co.uk
Message-Id: <199904122025.AB04979@future-is.orange.co.uk>
Date: Mon, 12 Apr 1999 21:28:42 +0100
Subject: Re: [linux-lvm] Cdroms and LVM
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	Boundary="0__=wgiVAky3ZjfrELrDw7a4V2D4QyfY59WIl2UQEabYWAZM40nEkOtzKBur"
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com

--0__=wgiVAky3ZjfrELrDw7a4V2D4QyfY59WIl2UQEabYWAZM40nEkOtzKBur
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline

Just compiled my kernel up correctly to support a IDE-CD WR (using SCSI
emulation) and the errors become less intrusive.  Instead of a page or two
of crap, you get :-

ide-scsi hdb:unsupported command in request queue
end request: I/O error, dev 03:40, sector 0

Better but no cigar!

mja




martyn.ayshford@notes-gw.orange.co.uk on 12/04/99 19:40:41

To:   linux-lvm@msede.com
cc:    (bcc: Martyn AYSHFORD/IT/HTLUK)

Subject:  [linux-lvm] Cdroms and LVM




Hi

Firstly this is very cool, vg00 with 6 gig in it :-), well done.

Secondly vgscan does a pv_read_all_pv which is fine, except that my hdb is
a cdrom (cd/rw really) and this generates lots of 'tray open or drive not
ready' errors.   I'd really like for it not to do this :-)  Can we have a
little mod so that it doesn't bother Readonly devices?

cheers

mja



--0__=wgiVAky3ZjfrELrDw7a4V2D4QyfY59WIl2UQEabYWAZM40nEkOtzKBur
Content-type: application/octet-stream; 
	name="att1.eml"
Content-Disposition: attachment; filename="att1.eml"
Content-transfer-encoding: x-uuencode

begin 644 att1.eml
M4F5C96EV960Z(&9R;VT@9G5T=7)E+6ES+F]R86YG92YC;RYU:R`H6S$Y-"XS
M,RXR-RXR72D@8GD@<G5D9&EC:R`H3&]T=7,@4TU44"!-5$$@=C$N,B`@*#8P
M,"XQ(#,M,C8M,3DY."DI('=I=&@@4TU44"!I9"`X,#(U-C<U,2XP,#8Y.$4X
M0SL@36]N+"`Q,B!!<'(@,3DY.2`R,#HQ,CHU-R`K,#$P,`T*4F5C96EV960Z
M(&9R;VT@93,U+FUS961E+F-O;2!B>2!I;G1E<FYE="US:71E+F]R86YG92YC
M;RYU:R!W:71H(%--5%`@:60@04$P,S<V-0T*("`H26YT97),;V-K(%--5%`@
M1V%T97=A>2`S+C`@9F]R(#Q-87)T>6XN05E32$9/4D1`;W)A;F=E+F-O+G5K
M/BD[#0H@($UO;BP@,3(@07!R(#$Y.3D@,C`Z,3`Z-3`@*S`Q,#`-"E)E8V5I
M=F5D.B`H9G)O;2!M86IO<F1O;4!L;V-A;&AO<W0I#0H)8GD@93,U+FUS961E
M+F-O;2`H."XX+C@O."XX+C8I(&ED($]!03$Y,C<R#0H)9F]R(&QI;G5X+6QV
M;2UO=71G;VEN9SL@36]N+"`Q,B!!<'(@,3DY.2`Q-#HS-SHR-"`M,#0P,"`H
M1414*0T*4F5C96EV960Z(&9R;VT@9G5T=7)E+6ES+F]R86YG92YC;RYU:R`H
M9G5T=7)E+6ES+F]R86YG92YC;RYU:R!;,3DT+C(Q-BXQ-#8N,5TI#0H)8GD@
M93,U+FUS961E+F-O;2`H."XX+C@O."XX+C8I('=I=&@@4TU44"!I9"!504$Q
M.3(V-PT*"69O<B`\;&EN=7@M;'9M0&US961E+F-O;3X[($UO;BP@,3(@07!R
M(#$Y.3D@,C`Z,S<Z,3D@*S`R,#`@*$U%4UHI#0I&<F]M.B!M87)T>6XN87ES
M:&9O<F1`;F]T97,M9W<N;W)A;F=E+F-O+G5K#0I296-E:79E9#H@8GD@9G5T
M=7)E+6ES+F]R86YG92YC;RYU:R!I9"!!03`S,C`R#0H@("A);G1E<DQO8VL@
M4TU44"!'871E=V%Y(#,N,"!F;W(@;&EN=7@M;'9M0&US961E+F-O;2D[#0H@
M($UO;BP@,3(@07!R(#$Y.3D@,3DZ,S<Z,38@*S`Q,#`-"DUE<W-A9V4M260Z
M(#PQ.3DY,#0Q,C$X,S<N04$P,S(P,D!F=71U<F4M:7,N;W)A;F=E+F-O+G5K
M/@T*4F5C96EV960Z(&)Y(&9U='5R92UI<RYO<F%N9V4N8V\N=6L@*$EN=&5R
M;F%L($UA:6P@06=E;G0M,2D[#0H@($UO;BP@,3(@07!R(#$Y.3D@,3DZ,S<Z
M,38@*S`Q,#`-"E@M3&]T=7,M1G)O;61O;6%I;CH@2%1,54L-"E1O.B!L:6YU
M>"UL=FU`;7-E9&4N8V]M#0I$871E.B!-;VXL(#$R($%P<B`Q.3DY(#$Y.C0P
M.C0Q("LP,3`P#0I3=6)J96-T.B!;;&EN=7@M;'9M72!#9')O;7,@86YD($Q6
M30T*36EM92U697)S:6]N.B`Q+C`-"D-O;G1E;G0M5'EP93H@=&5X="]P;&%I
M;CL@8VAA<G-E=#UU<RUA<V-I:0T*0V]N=&5N="U$:7-P;W-I=&EO;CH@:6YL
M:6YE#0I396YD97(Z(&]W;F5R+6QI;G5X+6QV;4!M<V5D92YC;VT-"D5R<F]R
M<RU4;SH@;W=N97(M;&EN=7@M;'9M0&US961E+F-O;0T*4')E8V5D96YC93H@
M8G5L:PT*#0I(:0T*#0I&:7)S=&QY('1H:7,@:7,@=F5R>2!C;V]L+"!V9S`P
M('=I=&@@-B!G:6<@:6X@:70@.BTI+"!W96QL(&1O;F4N#0H-"E-E8V]N9&QY
M('9G<V-A;B!D;V5S(&$@<'9?<F5A9%]A;&Q?<'8@=VAI8V@@:7,@9FEN92P@
M97AC97!T('1H870@;7D@:&1B(&ES#0IA(&-D<F]M("AC9"]R=R!R96%L;'DI
M(&%N9"!T:&ES(&=E;F5R871E<R!L;W1S(&]F("=T<F%Y(&]P96X@;W(@9')I
M=F4@;F]T#0IR96%D>2<@97)R;W)S+B`@($DG9"!R96%L;'D@;&EK92!F;W(@
M:70@;F]T('1O(&1O('1H:7,@.BTI("!#86X@=V4@:&%V92!A#0IL:71T;&4@
M;6]D('-O('1H870@:70@9&]E<VXG="!B;W1H97(@4F5A9&]N;'D@9&5V:6-E
9<S\-"@T*8VAE97)S#0H-"FUJ80T*#0H-"@``
`
end

--0__=wgiVAky3ZjfrELrDw7a4V2D4QyfY59WIl2UQEabYWAZM40nEkOtzKBur--
