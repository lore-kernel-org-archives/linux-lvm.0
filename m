From: dirk.derycke@icos.be
Message-ID: <C125683C.005D024B.00@icosdmz.icos.be>
Date: Fri, 3 Dec 1999 18:00:31 +0100
Subject: Re: [linux-lvm] LVM and Compaq Smart Array
Mime-Version: 1.0
Content-type: multipart/mixed; 
	Boundary="0__=6t837TC9avLEtdF7dz5L01wTwEH7Bh4Md5yoyhwYH72yFje82lw4Upe1"
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Stephan Hendl <Stephan.Hendl@lds.brandenburg.de>
Cc: linux-lvm@msede.com

--0__=6t837TC9avLEtdF7dz5L01wTwEH7Bh4Md5yoyhwYH72yFje82lw4Upe1
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephan,

We had similar problems with our Proliant 1600 + smart array.
We were able to solve the problem and we sent our patch to Heinz.
Heinz told me the problem would be fixed in LVM 0.8 as he had done a
similar patch already.

All you need to do is apply this very small patch to the LVM tools sources
to fix your problem.

Here it is.....
(See attached file: lvm.07.diff)

regards,

Dirk





"Stephan Hendl" <Stephan.Hendl@lds.brandenburg.de> on 12/03/99 03:13:43 PM

To:   linux-lvm@msede.com
cc:    (bcc: Dirk De Rycke/ICOS)

Subject:  [linux-lvm] LVM and Compaq Smart Array




Hi all,

I tried to set up LVM 0.7 on a Compaq Pro Liant 3000 Server with 2 CPUs and
a Smart Array Controller 4200 that include 3 9.1 GB SCSI Disks. The patch
and the new kernel gave no errors, but I can't create a physical volume.
Here are the outputs of fdisk and pvcreate:

sgate:/dev/ida # fdisk -lu

Disk /dev/ida/c0d0: 255 heads, 32 sectors, 4355 cylinders
Units = sectors of 1 * 512 bytes

         Device Boot    Start       End    Blocks   Id  System
/dev/ida/c0d0p1   *     73440   1101599    514080   83  Linux
/dev/ida/c0d0p2       1101600   2154239    526320   82  Linux swap
/dev/ida/c0d0p3            32     73439     36704   12  Compaq diagnostics
/dev/ida/c0d0p4       2154240  35536799  16691280   fe  LANstep

sgate:/dev/ida # pvcreate -v /dev/ida/c0d0p4
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/ida/c0d0p4"
pvcreate -- invalid physical volume name "/dev/ida/c0d0p4"
pvcreate -- unlocking logical volume manager

Does anybody have a Solution. Could it be that the partition is too big?

Thanks
Stephan


--
LDS Brandenburg
Dr. Stephan Hendl
fon: +49-(0)331-39 471
fax: +49-(0)331-27548 1187
EMail: stephan.hendl@lds.brandenburg.de





--0__=6t837TC9avLEtdF7dz5L01wTwEH7Bh4Md5yoyhwYH72yFje82lw4Upe1
Content-type: application/octet-stream; 
	name="lvm.07.diff"
Content-Disposition: attachment; filename="lvm.07.diff"
Content-transfer-encoding: x-uuencode

begin 644 lvm.07.diff
M9&EF9B`M<F,R($Q635\P+C<O;6%K92YT;7!L($Q635\P+C=P871C:&5D+VUA
M:V4N=&UP;`HJ*BH@3%9-7S`N-R]M86ME+G1M<&P)36]N($IU;"`Q,B`R,SHR
M,3HR-B`Q.3DY"BTM+2!,5DU?,"XW<&%T8VAE9"]M86ME+G1M<&P)5&AU($IU
M;"`R.2`Q.#HQ,3HT,2`Q.3DY"BHJ*BHJ*BHJ*BHJ*BHJ*@HJ*BH@,S`L,S8@
M*BHJ*@H@(`H@(",@56YC;VUM96YT('1H:7,@9F]R(&UU;'1I<')O8V5S<V]R
M(&%N9"!S970@=&AE(&YU;6)E<B!O9B!Y;W5R(&-P=7,*(2`C($U!2T5&3$%'
M4R`]("UJ,@H@(`HA(%1/4"`]("]R;V]T+TQ632\P+C<*("`*("!+15).14Q?
M3$]#051)3TX@/2`O=7-R+W-R8R]L:6YU>`HM+2T@,S`L,S8@+2TM+0H@(`H@
M(",@56YC;VUM96YT('1H:7,@9F]R(&UU;'1I<')O8V5S<V]R(&%N9"!S970@
M=&AE(&YU;6)E<B!O9B!Y;W5R(&-P=7,*(2!-04M%1DQ!1U,@/2`M:C(*("`*
M(2!43U`@/2`O=7-R+W-R8R],5DTO,"XW"B`@"B`@2T523D5,7TQ/0T%424].
M(#T@+W5S<B]S<F,O;&EN=7@**BHJ*BHJ*BHJ*BHJ*BHJ"BHJ*B`T."PU,B`J
M*BHJ"B`@"20H0T,I("0H3$1&3$%'4RD@+6\@)$`@)"HN;R`D*$Q)0E,I"B`@
M"B$@0T9,04=3(#T@+5=A;&P@+4DD*%1/4"DO=&]O;',@+4DD*%1/4"DO=&]O
M;',O;&EB("U$7U]+15).14Q?7R`M3S(*("`*("!"24Y$25(@/2`O<V)I;@HM
M+2T@-#@L-3(@+2TM+0H@(`DD*$-#*2`D*$Q$1DQ!1U,I("UO("1`("0J+F\@
M)"A,24)3*0H@(`HA($-&3$%'4R`]("U$1$5"54<@+5=A;&P@+4DD*%1/4"DO
M=&]O;',@+4DD*%1/4"DO=&]O;',O;&EB("U$7U]+15).14Q?7R`M3S(*("`*
M("!"24Y$25(@/2`O<V)I;@I/;FQY(&EN($Q635\P+C=P871C:&5D+SH@;6%K
M92YT;7!L?@ID:69F("UR8S(@3%9-7S`N-R]T;V]L<R]L:6(O9&5B=6<N8R!,
M5DU?,"XW<&%T8VAE9"]T;V]L<R]L:6(O9&5B=6<N8PHJ*BH@3%9-7S`N-R]T
M;V]L<R]L:6(O9&5B=6<N8PE-;VX@2G5L(#$R(#(S.C(Q.C(V(#$Y.3D*+2TM
M($Q635\P+C=P871C:&5D+W1O;VQS+VQI8B]D96)U9RYC"51H=2!*=6P@,CD@
M,3@Z,C,Z,3(@,3DY.0HJ*BHJ*BHJ*BHJ*BHJ*BH**BHJ(#,U+#0P("HJ*BH*
M("`@("`@("!V<W!R:6YT9B`H(&)U9BP@9FUT+"!V86PI.PH@("`@("`@('9A
M7V5N9"`H('9A;"D["B$@("`@("`@<')I;G1F("@@8G5F*3L*(2`@("`@("!F
M9FQU<V@@*"!S=&1O=70I.PH@("`@('T*("`@("`*+2TM(#,U+#0P("TM+2T*
M("`@("`@("!V<W!R:6YT9B`H(&)U9BP@9FUT+"!V86PI.PH@("`@("`@('9A
M7V5N9"`H('9A;"D["B$@("`@("`@9G!R:6YT9B`H('-T9&5R<BP@8G5F*3L*
M(2`@("`@("!F9FQU<V@@*"!S=&1E<G(I.PH@("`@('T*("`@("`*9&EF9B`M
M<F,R($Q635\P+C<O=&]O;',O;&EB+VQV;5]C:&5C:U]D978N8R!,5DU?,"XW
M<&%T8VAE9"]T;V]L<R]L:6(O;'9M7V-H96-K7V1E=BYC"BHJ*B!,5DU?,"XW
M+W1O;VQS+VQI8B]L=FU?8VAE8VM?9&5V+F,)36]N($IU;"`Q,B`R,SHR,3HR
M-B`Q.3DY"BTM+2!,5DU?,"XW<&%T8VAE9"]T;V]L<R]L:6(O;'9M7V-H96-K
M7V1E=BYC"49R:2!*=6P@,S`@,3(Z-#@Z,S`@,3DY.0HJ*BHJ*BHJ*BHJ*BHJ
M*BH**BHJ(#,T+#,W("HJ*BH*+2TM(#,T+#,Y("TM+2T*("`@*B`@(#$W+S`S
M+S$Y.3D@+2!A9&1E9"!L;V]P(&1E=FEC92!S=7!P;W)T"B`@("H@("`R,B\P
M-"\Q.3DY("T@1$%#.38P('-U<'!O<G0@8GD@36%T=&AE=R!487EL;W(@/$TN
M5&%Y;&]R0')B9VME=RYO<F<N=6L^"BL@("H@("`S,"\P-R\Q.3DY("T@0T]-
M4$%1(%--05)4,B`H+V1E=B]I9'$O*2!S=7!P;W)T(&)Y($1I<FL@1&4@4GEC
M:V4**R`@*@D)("`@/&1I<FLN9&4N<GEC:V5`='9D+F)E/@H@("`J"B`@("HO
M"BHJ*BHJ*BHJ*BHJ*BHJ*@HJ*BH@-S,L-S8@*BHJ*@HM+2T@-S4L.#@@+2TM
M+0H@("-I9F1E9B!-1%]-04I/4@H@("`@("`@($U$7TU!2D]2+`HK("-E;F1I
M9@HK("-I9F1E9B!#3TU005%?4TU!4E0R7TU!2D]2"BL@"4-/35!!45]334%2
M5#)?34%*3U(L"0HK(`E#3TU005%?4TU!4E0R7TU!2D]2,2P**R`)0T]-4$%1
M7U--05)4,E]-04I/4C(L"BL@"4-/35!!45]334%25#)?34%*3U(S+`HK(`E#
M3TU005%?4TU!4E0R7TU!2D]2-"P**R`)0T]-4$%17U--05)4,E]-04I/4C4L
M"BL@"4-/35!!45]334%25#)?34%*3U(V+`HK(`E#3TU005%?4TU!4E0R7TU!
M2D]2-RP*("`C96YD:68*("`C:69D968@3D)$7TU!2D]2"F1I9F8@+7)C,B!,
M5DU?,"XW+W1O;VQS+VQI8B]L=FU?9&ER7V-A8VAE+F,@3%9-7S`N-W!A=&-H
M960O=&]O;',O;&EB+VQV;5]D:7)?8V%C:&4N8PHJ*BH@3%9-7S`N-R]T;V]L
M<R]L:6(O;'9M7V1I<E]C86-H92YC"4UO;B!*=6P@,3(@,C,Z,C$Z,C8@,3DY
M.0HM+2T@3%9-7S`N-W!A=&-H960O=&]O;',O;&EB+VQV;5]D:7)?8V%C:&4N
M8PE&<FD@2G5L(#,P(#`Y.C,R.C,P(#$Y.3D**BHJ*BHJ*BHJ*BHJ*BHJ"BHJ
M*B`S,BPS-2`J*BHJ"BTM+2`S,BPS-R`M+2TM"B`@("H@("`@("`@("`@("`@
M("T@1$%#.38P("@O9&5V+W)D+RD@<W5P<&]R="!B>2!-871T:&5W(%1A>6QO
M<@H@("`J("`@("`@("`@("`@("`@(#Q-+E1A>6QO<D!R8F=K97<N;W)G+G5K
M/@HK("`J("`@,S`O,#<O,3DY.2`M($-/35!!42!334%25#(@*"]D978O:61Q
M+RD@<W5P<&]R="!B>2!$:7)K($1E(%)Y8VME"BL@("H)"2`@(#QD:7)K+F1E
M+G)Y8VME0'1V9"YB93X*("`@*@H@("`J+PHJ*BHJ*BHJ*BHJ*BHJ*BH**BHJ
M(#0Y+#4R("HJ*BH*+2TM(#4Q+#4U("TM+2T*("`@("!C:&%R(&YA;65;3D%-
M15],14Y=(#T@>R`P+"!].PH@("`@('-T871I8R!C:&%R("ID979D:7);72`]
M('L**R`@("`@("`B+V1E=B]I9&$B+`H@("`@("`@("(O9&5V+VED92]H9"(L
M"B`@("`@("`@(B]D978O;&]O<"(L"BHJ*BHJ*BHJ*BHJ*BHJ*@HJ*BH@,38Q
M+#$V-R`J*BHJ"BTM+2`Q-C0L,3<X("TM+2T*("`@("`@("!R971U<FX@,3L*
M("`@("!]"BL@"B`@("`@+RI#:&5C:R!F;W(@1$%#.38P(&1E=FEC97,J+PH@
M("`@(&EF("@@<W1R8VUP("@@9&ER;F%M92P@(B]D978O<F0B*2`]/2`P("8F
M"B`@("`@("`@("`H(&1I<F5N="T^9%]N86UE6S!=(#T]("=C)R`F)B`@("`O
M*B`O9&5V+W)D+V-;,"TQ761;,"TW77!;,"TW72`@*B\**R`@("`@("`@("`@
M9&ER96YT+3YD7VYA;65;,ET@/3T@)V0G("8F"BL@("`@("`@("`@(&1I<F5N
M="T^9%]N86UE6S1=(#T]("=P)RDI"BL@("`@("!R971U<FX@,3L**R`**R`@
M("`O*D-H96-K(&9O<B!#;VUP87$@4TU!4E0R(%)!240@9&5V:6-E<RHO"BL@
M("`@:68@*"!S=')C;7`@*"!D:7)N86UE+"`B+V1E=B]I9&$B*2`]/2`P("8F
M"BL@("`@("`@("`H(&1I<F5N="T^9%]N86UE6S!=(#T]("=C)R`F)B`@("`O
M*B`O9&5V+VED82]C6S`M,5UD6S`M-UUP6S`M-UT@("HO"B`@("`@("`@("`@
M(&1I<F5N="T^9%]N86UE6S)=(#T]("=D)R`F)@H@("`@("`@("`@("!D:7)E
M;G0M/F1?;F%M95LT72`]/2`G<"<I*0ID:69F("UR8S(@3%9-7S`N-R]T;V]L
M<R]L:6(O<'9?8VAE8VM?;F%M92YC($Q635\P+C=P871C:&5D+W1O;VQS+VQI
M8B]P=E]C:&5C:U]N86UE+F,**BHJ($Q635\P+C<O=&]O;',O;&EB+W!V7V-H
M96-K7VYA;64N8PE-;VX@2G5L(#$R(#(S.C(Q.C(V(#$Y.3D*+2TM($Q635\P
M+C=P871C:&5D+W1O;VQS+VQI8B]P=E]C:&5C:U]N86UE+F,)1G)I($IU;"`S
M,"`P.3HS,#HU,R`Q.3DY"BHJ*BHJ*BHJ*BHJ*BHJ*@HJ*BH@,S<L-#`@*BHJ
M*@HM+2T@,S<L-#(@+2TM+0H@("`J("`@(#(R+S`T+S$Y.3D@+2!$04,Y-C`@
M*"]D978O<F0O*2!S=7!P;W)T(&)Y($UA='1H97<@5&%Y;&]R"B`@("H@("`@
M("`@("`@("`@("`@(#Q-+E1A>6QO<D!R8F=K97<N;W)G+G5K/@HK("`J("`@
M(#,P+S`W+S$Y.3D@+2!#3TU005$@4TU!4E0R("@O9&5V+VED<2\I('-U<'!O
M<G0@8GD@1&ER:R!$92!2>6-K90HK("`J"0D@("`\9&ER:RYD92YR>6-K94!T
M=F0N8F4^"B`@("H*("`@*B\**BHJ*BHJ*BHJ*BHJ*BHJ"BHJ*B`U,"PU,R`J
M*BHJ"BTM+2`U,BPU-B`M+2TM"B`@("`@("`@:6YT(&QE;F=T:#L*("`@("!]
M(&1I<EM=(#T@>PHK("`@("`@('L@(B]D978O:61A+R(L("`@("`Y?2P*("`@
M("`@("![("(O9&5V+VED92]H9"\B+"`Q,GTL"B`@("`@("`@>R`B+V1E=B]L
.;V]P+R(L("`@,3!]+`H!
`
end

--0__=6t837TC9avLEtdF7dz5L01wTwEH7Bh4Md5yoyhwYH72yFje82lw4Upe1--
