Message-Id: <199903152314.AA03207@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: [linux-lvm] LVM patch 15/03/1999 for 0.6 available
Date: Tue, 16 Mar 1999 0:12:50 MET
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com, mge@ts1.ez-darmstadt.telekom.de


Hi folks!

After two weeks in California with (almost) no LVM activity i'm back 8*)

Sorry that some parts of the new code caused trouble.
I'm fixing... (special thanks to Steve Brueggeman!).


There were some brainos in lvm_tab_get_free_blk_dev.c.
I have put a first preliminary version (not tested too much 8*( )
which should help a lot of you to
ftp://linux.msede.com/incoming/lvm_0.6-patch-15031999a.gz


Another braino caused /dev/lvm not to be created any longer.
The above lvm_0.6-patch-15031999a.gz contains a fix for this one too.


The trouble with vgscan and md is caused due to existing /dev/md* entries
(or /dev/md/* in case of devfs) _but_ a too small MAX_MD_DEV.
Because vgscan uses liblvm function pv_read_all_pv() all of these
md device specials are opened in turn.
In md_open() no check exists against field overrun --> 8*(((.
The problem exists basically due to the old md version
in the stock linux kernel.
Look for the actual versions of the md kernel patches and raid tools for eg.
at ftp://ftp.de.kernel.org/pub/linux/daemons/raid/alpha
or another kernel.org mirror.



Would you be so kind as to test and report, if errors like

  - invalid i/o protocol version (many)
  - table problems causing read after end of device (Steve Brueggeman)
  - invalid block minor number creation (many)

are fixed by this?


Regards,
Heinz


For your convenience i added the patch here too...

begin 644 lvm_0.6-patch-15031999a.gz
M'XL("&B2[38"`VQV;5\P+C8M<&%T8V@M,34P,S$Y.3EA`+57^V_:2!#^N?XK
MYAJI"M@.F$=X):<DQ$ESQZ,B:=136UD&%MB+8Z.U32^-^-]O=FW#&ILD5^D0
MS]V9V9EOOID==%V'\M%Q*?`\QR\Y=%QR5H]68(^M.0FL&2/$&CL/UI2LCB;O
M;NT`KL@8*F5\MHU&N]X$H]5J*:JJHI7&VZS<A03Z-@/C&,KE-CYK]<C*V1GH
MAM8"E;^=G2E0*BHZ%"'?*C?X2%V/'4T4=:]4^FP%H,A?T/663XS.%P$<=@OB
M=("/A+H_T;.0./["GA-7@VO"'FWW2:AQ3S!X%MKL*8Y:6M$QHLDB6H\/$0?=
M+:@/O?L^H&.,:^)/[A/XWBSX83/2@2<OA(GM`B-3Z@>,CL.```W`=J<ECPE4
M*DW-*(/*/XX%,@H<3,F,NN3=M7EG]>ZM2_,>ON&)`,_XJ8-X4#<`JH'3V2[-
M/`:'0.$4RAW\.`%GQ:&Q)EZ(PCH8N*JJ!=G*1LN)M)P=+5S):O#39UQ'",+I
M::(2("!?G>^%^+>J<N?4C(:0@]].8?"YUXN,JUO+<5P:.A:Z4X&G<$T6>CG2
M#Q]DW4@FB4*5HY!/,#K9W;<!DU)Z'9L\%7SD0+;/U7*>S'IW;1US)O,K^;H6
M]*NVM":HM7I<EAS^?36&83V(4*!81'?C52&"82E)]E*YX-[*.[*2+*(FJ4]K
M,!+O<_;%AR?0\M*S+GI_6OWS/X8C.#F!_LU@.+JXN;N-[.7+#[OY&OS(R0)[
M5[&XFENN_4BL9<`@8FFTC>L8^VJ>6DP@D;F=['.`&W6M`6JS@N]1=:=9(@/"
MZ1+7A)2Z;1?H2$4HL^P$O^X'HP`J],^_H(U"C&>DUI&K+M=:/E3[[6U]QC9+
MXDV=VS+YV]WYA<6#N1J9IO`50[(&PRBR#3F%JAQ_'E*[+40@W:SR"Z95CJF\
M4UU9=3F+\>G*?A6)K-LL_%A0A_Q*(IXE\/<:>1W_YW28^53Y9;8\ISO*KY)D
MQ\D]Z;!\>Q5Q*;/5>=6`2`XVSXR@\'D/?4ZCJ:1<XP5J&(9F-#+$V1`\>UPN
M<=8"]_5_*(!DX_[:ZGXT$4SSR\WMG77>Z^%25*-)4>#0!*G>%#$8BJ7=6S;5
M5:0R4=\(3.8&8L1V'&^"&MR4%N<6AR"?_B3>;',U%`H%N8NI62Q?@6-D8N3#
M;B>M.O<";^^]9!%W*LNO7YH4(L?CB2`O^J_T^Z:E(8FI;#F*(#:1K*>2+;?6
M->_VRHMNMQ4]=TCGLM1;6BO"?.JY.%E?,2KF<Z/"YW.<K`WCI?D\:Z#ON=%H
M7H=*M5UNMNO5[6A>TXYQ"(BOJ+P9NL'GQ[>,TEQ[X*W(XY@PH2B/TO_;#%WE
M_E=JFE&+(^"O$J*OXO\,[D!W8;MSXGAS_DNL`")1*E=+(BH=[.F43$6ND.8/
M`L/0Y5]A:5.&_T"`N'[("`0+.X@-I!XE3"E7`_(/NNDGYV!IXD!/W8D33@F<
M8)@H<[3XG3,C]!<>B^:MG7PA9U<>G28W6U7$5ZO$-]L!G>$_!+@T+SY?B\8S
M)>-PCCKON2G9#)*KB_5D7GYSWQ>P81T@Y^@,7>+\Q&[R=^@'4FS"==N=$,"2
MW@2$@QAA,QM7_2694-M)&DZ"%AP6.B`A=LB/4J0N,V=>N,3J\);$C2\.K'4-
JAM;H<CCH_14U#=TH*'M:Q<WPDW5OCFYOA@-K^,D<=)1_`7->/#7=#@``
`
end



--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
