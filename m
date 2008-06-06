Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m56Il0io025437
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 14:47:00 -0400
Received: from smtp.lippi.fr (smtp.lippi.fr [213.223.112.35])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m56IkiQN013067
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 14:46:45 -0400
Received: from inetgw (inetgw [127.0.0.1])
	by smtp.lippi.fr (smtp) with ESMTP id 4CAAAC0BE256
	for <linux-lvm@redhat.com>; Fri,  6 Jun 2008 20:46:38 +0200 (CEST)
In-Reply-To: <1c748a490806060803v1b2b7027ib6e5cdd70029a628@mail.gmail.com>
Subject: RE Re: [linux-lvm] Performance tunning on LVM2
Message-ID: <OF93BDA186.73B2685F-ONC1257460.00672C3B-C1257460.00672C3E@LocalDomain>
Date: Fri, 6 Jun 2008 20:46:55 +0200
From: "Antony MARTINEAU" <Antony.MARTINEAU@lippi.fr>
Content-Type: multipart/related; boundary="=_related 00672C3EC1257460_="
References: <OF71017368.B3FFEE57-ONC1257460.0047F98A-C1257460.004C061F@lippi.fr><1c748a490806060718t55680d38mdaa1286b754c346@mail.gmail.com><OFFF54BB34.40906B94-ONC1257460.004F3651-C1257460.004FF3D1@lippi.fr>,
	<1c748a490806060803v1b2b7027ib6e5cdd70029a628@mail.gmail.com>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--=_related 00672C3EC1257460_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1
MIME-Version: 1.0

<FONT face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D2>I understand what you said, but the disk performances are not the prob=
leme...<br>One simple test to<span style=3D"font-weight: bold;">&nbsp; </sp=
an>convince :<br><font face=3D"Arial"><b><span style=3D"font-size: 14px;"><=
span id=3D"IDAQUL4H" style=3D"" direction=3D"targettarget"></span></span></=
b></font><div><br>I create 2 LV on the same VG (one after the other)<br>I L=
aunch a writing on these AT THE SAME TIME, so test1 and test2 is writing at=
 the same time<br><br>Look the result<br>suse2:~ # lvcreate -L2G -ntest vg0=
<br>&nbsp; Logical volume "test" created<br>suse2:~ # lvcreate -L2G -ntest2=
 vg0<br>&nbsp; Logical volume "test2" created<br><br><br>suse2:~ # dd if=3D=
/dev/zero of=3D/dev/vg0/test2 bs=3D1M count=3D800<br>800+0 records in<br>80=
0+0 records out<br>838860800 bytes (839 MB) copied, 11.2715 seconds, 74.4 M=
B/s<br><br>suse2:~ # dd if=3D/dev/zero of=3D/dev/vg0/test bs=3D1M count=3D8=
00<br>800+0 records in<br>800+0 records out<br>838860800 bytes (839 MB) cop=
ied, 11,5366 seconde, 72,7 MB/s<br><br>I repeat that the two writing has be=
en launch AT THE SAME TIME<br><br>It is obvious that it isn't the <font siz=
e=3D"2"><span class=3D"e" id=3D"q=5F11a5e4cbd0ecd7b9=5F3">result of excessi=
ve seeking but the LVM2 implementation....<br><br>Why LVM2 snaphot COW resu=
lt disastrous performance on Writing original volume... is there one issue.=
..<br></span></font><br></div><div>Antony MARTINEAU<br>Service informatique=
 <br>Tel: 05.45.67.34.35<br>LIPPI - Solutions de cl=F4ture<br>16440 Mouthie=
rs sur Boh=EBme<br><div><br></div><font color=3D"#990099">-----linux-lvm-bo=
unces@redhat.com a =E9crit : -----<br><br></font><blockquote style=3D"borde=
r-left: 2px solid #000000; padding-right: 0px; padding-left: 5px; margin-le=
ft: 5px; margin-right: 0px;">A : "LVM general discussion and development" &=
lt;linux-lvm@redhat.com&gt;<br>De : "Larry Dickson" &lt;ldickson@cuttedge.c=
om&gt;<br>Envoy=E9 par : linux-lvm-bounces@redhat.com<br>Date : 06/06/2008 =
17:03<br>Objet : Re: [linux-lvm] Performance tunning on LVM2<br><br><div>A =
(linear) volume group made of two physical volumes&nbsp;consists of one&nbs=
p;PV followed by the other, rather like a "Raid-Linear". If you size the or=
igin&nbsp;logical volume right, you can get one LV (the origin) to fall on =
one disk, and force the snapshot to land on the other disk. This eliminates=
 back-and-forth seeking to the COW. Whether it solves your problem will dep=
end on how smart the driver is about the read-before-write activity on the =
origin volume.</div>
<div>&nbsp;</div><div>Other members of the list may have more experience on=
 this. Comments?</div><div>&nbsp;</div><div>Larry<br>&nbsp;</div><div><span=
 class=3D"gmail=5Fquote">On 6/6/08, <b class=3D"gmail=5Fsendername">Antony =
MARTINEAU</b> &lt;<a href=3D"mailto:Antony.MARTINEAU@lippi.fr">Antony.MARTI=
NEAU@lippi.fr</a>&gt; wrote:</span><blockquote class=3D"gmail=5Fquote" styl=
e=3D"border-left: 1px solid #cccccc; margin: 0px 0px 0px 0.8ex; padding-lef=
t: 1ex;"><br><font face=3D"sans-serif" size=3D"2">The volume group vg0 is t=
he raid0 of two disk (SAS 15000rpm 300G0)</font> <br><font face=3D"sans-ser=
if" size=3D"2">I have only this raid on the server</font> <br><br><font fac=
e=3D"sans-serif" size=3D"2">But i don't understand, imagine i make a volume=
 group &nbsp;ou of this raid0. It is no possible to snapshot the original v=
olume, am i wrong?</font> <br><br><font face=3D"sans-serif" size=3D"2">If i=
 make a new VG on another disks, For exemple /dev/vg1/</font> <br><font fac=
e=3D"sans-serif" size=3D"2">LVM don't permit to store a snaphot on a differ=
ent VG than the origin volum.</font> <br><br><font face=3D"sans-serif" size=
=3D"2">for exemple /dev/vg0/test cant be snapshoting on /dev/vg1/test.snap<=
/font> <br><br><font face=3D"sans-serif" size=3D"2">LV test and LV test.sna=
p must be on the same volume, am i wrong ???? so it is impossible to store =
snapshot on another disk....</font> <br><span class=3D"q"><br><font face=3D=
"sans-serif" size=3D"2"><br></font><table><tbody><tr><td><font face=3D"Aria=
l" size=3D"2">Cordialement,</font> <br></td></tr></tbody></table><br><table=
><tbody><tr><td colspan=3D"2"><div align=3D"center"><img src=3D"cid:=5F1=5F=
07B3149007B310BC004FF3CCC1257460"></div></td></tr><tr><td><font face=3D"Ari=
al" size=3D"3"><b>MARTINEAU<br>Antony</b> </font><font color=3D"#808080" fa=
ce=3D"Arial" size=3D"2"><br>Service informatique </font><font color=3D"#808=
080" face=3D"Arial" size=3D"1"><br>Assistant informatique <br>LIPPI Managem=
ent </font></td><td><font color=3D"#004080" face=3D"Arial" size=3D"1">La Fo=
uillouse<br>16440 Mouthiers sur Boheme <br>Tel.: 05.45.67.34.35<br>Courriel=
: </font><a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=
=3D"mailto:antony.martineau@lippi.fr" target=3D"=5Fblank"><font color=3D"bl=
ue" face=3D"Arial" size=3D"1"><u>antony.martineau@lippi.fr</u></font></a><f=
ont color=3D"blue" face=3D"Arial" size=3D"1"><u><br></u></font><a onclick=
=3D"return top.js.OpenExtLink(window,event,this)" href=3D"http://www.lippi.=
fr/" target=3D"=5Fblank"><font color=3D"blue" face=3D"Arial" size=3D"1"><u>=
http://www.lippi.fr</u></font></a><font color=3D"#004080" face=3D"Arial" si=
ze=3D"1"> </font></td></tr></tbody></table><br><br><br><br></span><table wi=
dth=3D"100%"><tbody><tr valign=3D"top"><td><font color=3D"#5f5f5f" face=3D"=
sans-serif" size=3D"1">De :</font>=20
</td><td><font face=3D"sans-serif" size=3D"1">"Larry Dickson" &lt;<a onclic=
k=3D"return top.js.OpenExtLink(window,event,this)" href=3D"mailto:ldickson@=
cuttedge.com" target=3D"=5Fblank">ldickson@cuttedge.com</a>&gt;</font>=20
</td></tr><tr valign=3D"top"><td><font color=3D"#5f5f5f" face=3D"sans-serif=
" size=3D"1">Pour :</font>=20
</td><td><font face=3D"sans-serif" size=3D"1">"LVM general discussion and d=
evelopment" &lt;<a onclick=3D"return top.js.OpenExtLink(window,event,this)"=
 href=3D"mailto:linux-lvm@redhat.com" target=3D"=5Fblank">linux-lvm@redhat.=
com</a>&gt;</font>=20
</td></tr><tr valign=3D"top"><td><font color=3D"#5f5f5f" face=3D"sans-serif=
" size=3D"1">Date:</font>=20
</td><td><font face=3D"sans-serif" size=3D"1">06/06/2008 16:19</font>=20
</td></tr><tr valign=3D"top"><td><font color=3D"#5f5f5f" face=3D"sans-serif=
" size=3D"1">Objet :</font>=20
</td><td><font face=3D"sans-serif" size=3D"1">Re: [linux-lvm] Performance t=
unning on LVM2</font></td></tr></tbody></table><br><hr noshade=3D"noshade">
<div><span class=3D"e" id=3D"q=5F11a5e4cbd0ecd7b9=5F3"><br><br><br><font si=
ze=3D"3">This looks like the result of excessive seeking. Are origin volume=
 and snapshot both on the same physical drive? Is it possible to make a vol=
ume group out of two drives, and arrange things so that origin volume and s=
napshot are hitting different disks?</font> <br><font size=3D"3">&nbsp;</fo=
nt> <br><font size=3D"3">Larry Dickson</font> <br><font size=3D"3">Cutting =
Edge Networked Storage<br></font><br><font size=3D"3">On 6/6/08, <b>Antony =
MARTINEAU</b> &lt;</font><a onclick=3D"return top.js.OpenExtLink(window,eve=
nt,this)" href=3D"mailto:Antony.MARTINEAU@lippi.fr" target=3D"=5Fblank"><fo=
nt color=3D"blue" size=3D"3"><u>Antony.MARTINEAU@lippi.fr</u></font></a><fo=
nt size=3D"3">&gt; wrote: </font><br><font face=3D"sans-serif" size=3D"2"><=
br>Hello,</font><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"=
2"><br>My configuration:</font><font size=3D"3"> </font><font face=3D"sans-=
serif" size=3D"2"><br>Server DELL 2860 Intel(R) Xeon(R) CPU &nbsp;X3230 @ 2=
.66GHz (Quad Core)</font><font size=3D"3"> </font><font face=3D"sans-serif"=
 size=3D"2"><br>8GB of &nbsp;memory</font><font size=3D"3"> </font><font fa=
ce=3D"sans-serif" size=3D"2"><br>2 x SAS 15000 300G0 RAID 0 hardware <br>SL=
ES 10 SP2</font><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"=
2"><br>Kernel 2.6.16.60-0.21-xen</font><font size=3D"3"> <br></font><font f=
ace=3D"sans-serif" size=3D"2"><br>i have one volume group vg0 ( whith one P=
V, the two disks in raid0) whith many lvm</font><font size=3D"3"> </font><f=
ont face=3D"sans-serif" size=3D"2"><br>I am very surprise about LVM2 perfor=
mance when a snapshot is done.</font><font size=3D"3"> </font><font face=3D=
"sans-serif" size=3D"2"><br>Write speed on the Original volume is very bad =
when a snaphot is active...</font><font size=3D"3"> <br></font><font face=
=3D"sans-serif" size=3D"2"><br>For exemple:</font><font size=3D"3"> <br></f=
ont><font face=3D"sans-serif" size=3D"2"><b><br>Speed on /dev/vg0/test when=
 there is NO snapshot :</b></font><font size=3D"3"> <br></font><font face=
=3D"sans-serif" size=3D"2"><br>suse2:~ # dd if=3D/dev/zero of=3D/dev/vg0/te=
st bs=3D2M count=3D400</font><font size=3D"3"> </font><font face=3D"sans-se=
rif" size=3D"2"><br>400+0 records in</font><font size=3D"3"> </font><font f=
ace=3D"sans-serif" size=3D"2"><br>400+0 records out</font><font size=3D"3">=
 </font><font face=3D"sans-serif" size=3D"2"><br>838860800 bytes (839 MB) c=
opied, 6.42741 seconds, 131 MB/s</font><font size=3D"3"> <br></font><font f=
ace=3D"sans-serif" size=3D"2"><b><br>Speed on /dev/vg0/test when there is o=
ne snapshot of this original volume :</b></font><font size=3D"3"> <br></fon=
t><font face=3D"sans-serif" size=3D"2"><br>suse2:~ # lvremove --force /dev/=
vg0/test3.snap</font><font size=3D"3"> </font><font face=3D"sans-serif" siz=
e=3D"2"><br>&nbsp;Logical volume "test3.snap" successfully removed</font><f=
ont size=3D"3"> </font><font face=3D"sans-serif" size=3D"2"><br>suse2:~ # d=
d if=3D/dev/zero of=3D/dev/vg0/test bs=3D2M count=3D400</font><font size=3D=
"3"> </font><font face=3D"sans-serif" size=3D"2"><br>400+0 records in</font=
><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"2"><br>400+0 re=
cords out</font><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"=
2"><br>838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s</font><fo=
nt size=3D"3"> </font><font face=3D"sans-serif" size=3D"2"><br>suse2:~ # lv=
create -s -L1G -ntest.snap /dev/vg0/test</font><font size=3D"3"> </font><fo=
nt face=3D"sans-serif" size=3D"2"><br>&nbsp;Logical volume "test.snap" crea=
ted</font><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"2"><br=
>suse2:~ # dd if=3D/dev/zero of=3D/dev/vg0/test bs=3D2M count=3D400</font><=
font size=3D"3"> </font><font face=3D"sans-serif" size=3D"2"><br>400+0 reco=
rds in</font><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"2">=
<br>400+0 records out</font><font size=3D"3"> </font><font face=3D"sans-ser=
if" size=3D"2"><br>838860800 bytes (839 MB) copied, 204.862 seconds, 4.1 MB=
/s</font><font size=3D"3"> <br><br></font><font face=3D"sans-serif" size=3D=
"2"><b><br>Speed on /dev/vg0/test when there is 2 snapshots of this origina=
l volume :</b></font><font size=3D"3"> <br></font><font face=3D"sans-serif"=
 size=3D"2"><br>suse2:~ # lvcreate -s -L1G -ntest1.snap /dev/vg0/test</font=
><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"2"><br>&nbsp;Lo=
gical volume "test1.snap" created</font><font size=3D"3"> </font><font face=
=3D"sans-serif" size=3D"2"><br>suse2:~ # lvcreate -s -L1G -ntest2.snap /dev=
/vg0/test</font><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"=
2"><br>&nbsp;Logical volume "test2.snap" created</font><font size=3D"3"> </=
font><font face=3D"sans-serif" size=3D"2"><br>suse2:~ # lvremove /dev/vg0/t=
est2.snap</font><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"=
2"><br>Do you really want to remove active logical volume "test2.snap"? [y/=
n]: y</font><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"2"><=
br>&nbsp;Logical volume "test2.snap" successfully removed</font><font size=
=3D"3"> </font><font face=3D"sans-serif" size=3D"2"><br>suse2:~ # dd if=3D/=
dev/zero of=3D/dev/vg0/test bs=3D2M count=3D400</font><font size=3D"3"> </f=
ont><font face=3D"sans-serif" size=3D"2"><br>400+0 records in</font><font s=
ize=3D"3"> </font><font face=3D"sans-serif" size=3D"2"><br>400+0 records ou=
t</font><font size=3D"3"> </font><font face=3D"sans-serif" size=3D"2"><br>8=
38860800 bytes (839 MB) copied, 270.928 seconds, 3.1 MB/s</font><font size=
=3D"3"> <br><br></font><font face=3D"sans-serif" size=3D"2"><br>Do you know=
 &nbsp;some elements about tunning performance?,?</font><font size=3D"3"> <=
br></font><font face=3D"sans-serif" size=3D"2"><br>Performances are </font>=
<font size=3D"3">disastrous when a snaphot is active </font><font face=3D"s=
ans-serif" size=3D"2"><br>Could you give your speed result? and your amelio=
ration??</font><font size=3D"3"> <br></font><font face=3D"sans-serif" size=
=3D"2"><br>ps:Results are the same whithout Kernel Xen and whith a kernel m=
ore recent (</font><a onclick=3D"return top.js.OpenExtLink(window,event,thi=
s)" href=3D"http://2.6.24.2/" target=3D"=5Fblank"><font color=3D"blue" face=
=3D"sans-serif" size=3D"2"><u>2.6.24.2</u></font></a><font face=3D"sans-ser=
if" size=3D"2">)</font>=20
<table><tbody><tr><td><font face=3D"Arial" size=3D"2">Cordialement,</font><=
/td></tr></tbody></table><br><table><tbody><tr><td colspan=3D"2"><div align=
=3D"center"><img src=3D"cid:=5F1=5F07A1E0E807A1DD14004FF3CCC1257460"></div>=
</td></tr><tr><td><font face=3D"Arial" size=3D"3"><b>MARTINEAU<br>Antony</b=
> </font><font color=3D"#808080" face=3D"Arial" size=3D"2"><br>Service info=
rmatique </font><font color=3D"#808080" face=3D"Arial" size=3D"1"><br>Assis=
tant informatique <br>LIPPI Management </font></td><td><font color=3D"#0040=
80" face=3D"Arial" size=3D"1">La Fouillouse<br>16440 Mouthiers sur Boheme <=
br>Tel.: 05.45.67.34.35<br>Courriel: </font><a onclick=3D"return top.js.Ope=
nExtLink(window,event,this)" href=3D"mailto:antony.martineau@lippi.fr" targ=
et=3D"=5Fblank"><font color=3D"blue" face=3D"Arial" size=3D"1"><u>antony.ma=
rtineau@lippi.fr</u></font></a><font color=3D"blue" size=3D"3"><u><br></u><=
/font><a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"h=
ttp://www.lippi.fr/" target=3D"=5Fblank"><font color=3D"blue" face=3D"Arial=
" size=3D"1"><u>http://www.lippi.fr</u></font></a><font color=3D"#004080" f=
ace=3D"Arial" size=3D"1"> </font></td></tr></tbody></table><br><font face=
=3D"sans-serif" size=3D"3"><br><br><br></font><font size=3D"3"><br></font><=
font face=3D"Lucida Sans" size=3D"3"><br></font><font size=3D"3"><br></font=
><font face=3D"Lucida Sans" size=3D"2"><br><br><br>Ce message et toutes les=
 pieces jointes sont etablis a l'attention exclusive de ses destinataires e=
t sont strictement confidentiels. </font><a onclick=3D"return top.js.OpenEx=
tLink(window,event,this)" href=3D"http://www.lippi.fr/disclaimer.php" targe=
t=3D"=5Fblank"><font color=3D"blue" face=3D"Lucida Sans" size=3D"2"><u>Pour=
 en savoir plus cliquer ici</u></font></a><font face=3D"Lucida Sans" size=
=3D"2"><br><br>This message and any attachments are confidential to the ord=
inary user of the e-mail address to which it was addressed and may also be =
privileged. </font><a onclick=3D"return top.js.OpenExtLink(window,event,thi=
s)" href=3D"http://www.lippi.fr/disclaimer.php" target=3D"=5Fblank"><font c=
olor=3D"blue" face=3D"Lucida Sans" size=3D"2"><u>More information</u></font=
></a><font size=3D"3"><br><br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>linux-lvm mailing list</font><font color=3D"=
blue" size=3D"3"><u><br></u></font><a onclick=3D"return top.js.OpenExtLink(=
window,event,this)" href=3D"mailto:linux-lvm@redhat.com" target=3D"=5Fblank=
"><font color=3D"blue" size=3D"3"><u>linux-lvm@redhat.com</u></font></a><fo=
nt color=3D"blue" size=3D"3"><u><br></u></font><a onclick=3D"return top.js.=
OpenExtLink(window,event,this)" href=3D"https://www.redhat.com/mailman/list=
info/linux-lvm" target=3D"=5Fblank"><font color=3D"blue" size=3D"3"><u>http=
s://www.redhat.com/mailman/listinfo/linux-lvm</u></font></a><font size=3D"3=
"><br>read the LVM HOW-TO at </font><a onclick=3D"return top.js.OpenExtLink=
(window,event,this)" href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"=
=5Fblank"><font color=3D"blue" size=3D"3"><u>http://tldp.org/HOWTO/LVM-HOWT=
O/</u></font></a> <br><tt><font size=3D"2">=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>linux-lvm mailing list<br><a onclic=
k=3D"return top.js.OpenExtLink(window,event,this)" href=3D"mailto:linux-lvm=
@redhat.com" target=3D"=5Fblank">linux-lvm@redhat.com</a><br></font></tt><a=
 onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"https://w=
ww.redhat.com/mailman/listinfo/linux-lvm" target=3D"=5Fblank"><tt><font siz=
e=3D"2">https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><t=
t><font size=3D"2"><br>read the LVM HOW-TO at </font></tt><a onclick=3D"ret=
urn top.js.OpenExtLink(window,event,this)" href=3D"http://tldp.org/HOWTO/LV=
M-HOWTO/" target=3D"=5Fblank"><tt><font size=3D"2">http://tldp.org/HOWTO/LV=
M-HOWTO/</font></tt></a> <br><br><font face=3D"sans-serif" size=3D"3"><br><=
br><br></font><br><font face=3D"Lucida Sans" size=3D"3"><br></font><img src=
=3D""><font face=3D"Lucida Sans" size=3D"3"><br></font><font face=3D"Lucida=
 Sans" size=3D"2"><br><br>Ce message et toutes les pieces jointes sont etab=
lis a l'attention exclusive de ses destinataires et sont strictement confid=
entiels. </font><a onclick=3D"return top.js.OpenExtLink(window,event,this)"=
 href=3D"http://www.lippi.fr/disclaimer.php" target=3D"=5Fblank"><font colo=
r=3D"blue" face=3D"Lucida Sans" size=3D"2"><u>Pour en savoir plus cliquer i=
ci</u></font></a><font face=3D"Lucida Sans" size=3D"2"><br><br>This message=
 and any attachments are confidential to the ordinary user of the e-mail ad=
dress to which it was addressed and may also be privileged. </font><a oncli=
ck=3D"return top.js.OpenExtLink(window,event,this)" href=3D"http://www.lipp=
i.fr/disclaimer.php" target=3D"=5Fblank"><font color=3D"blue" face=3D"Lucid=
a Sans" size=3D"2"><u>More information</u></font></a><font face=3D"Lucida S=
ans" size=3D"3"><br></font><br></span></div><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>linux-lvm mailing list<br><a onc=
lick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"mailto:linux-=
lvm@redhat.com">linux-lvm@redhat.com</a><br><a onclick=3D"return top.js.Ope=
nExtLink(window,event,this)" href=3D"https://www.redhat.com/mailman/listinf=
o/linux-lvm" target=3D"=5Fblank">https://www.redhat.com/mailman/listinfo/li=
nux-lvm</a><br>read the LVM HOW-TO at <a onclick=3D"return top.js.OpenExtLi=
nk(window,event,this)" href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"=
=5Fblank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br><f=
ont face=3D"Courier New,Courier,monospace" size=3D"3">=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>linux-lvm mailing list<br>=
linux-lvm@redhat.com<br><a href=3D"https://www.redhat.com/mailman/listinfo/=
linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read th=
e LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.or=
g/HOWTO/LVM-HOWTO/</a></font></blockquote><br></div></FONT><font face=3D"sa=
ns-serif"><HEAD>
    <STYLE type=3D"text/css">
      BODY { font-family: "Lucida Sans"}
    </STYLE>
  </HEAD>
<body>
<img src=3D'http://www.lippi.fr/img/eco.jpg'><br>
 <font size=3D"2">=20
  Ce message et toutes les pieces jointes sont etablis a l'attention exclus=
ive de ses destinataires et sont strictement confidentiels. <a href=3D"http=
://www.lippi.fr/disclaimer.php">Pour en savoir plus cliquer ici</a><br>
  This message and any attachments are confidential to the ordinary user of=
 the e-mail address to which it was addressed and may also be privileged. <=
a href=3D"http://www.lippi.fr/disclaimer.php">More information</a>
 </font>
</body></font>

--=_related 00672C3EC1257460_=
Content-Type: image/gif; name="Image._1_07B3149007B310BC004FF3CCC1257460.gif"
Content-Disposition: inline;
	filename="Image._1_07B3149007B310BC004FF3CCC1257460.gif"
Content-ID: <_1_07B3149007B310BC004FF3CCC1257460>
Content-Transfer-Encoding: base64

R0lGODlhkAEoAIcAAQA+XFyitAByjLTK1ER+lIyuvCRyjABadESSpNTm7CSGnBxmfHSirJTGzGSW
pCR+lABmfMza5HyyxIy6xOzu9FSSpESKnHSqvBR2jLzW3DR2jDSGnKTCzHSarABObBRadGSqvDR+
lBRmfJy6xCxuhGSerABuhPT6/1SarDSOpKzK1CR6lABifBxuhNzi7FSKnISqvGyitMTS3OTq7Mzi
5FySpBR6lKzCzABGZAx6lLzS1ESGnIy2xCxyhAxadEyerHymtGyWrCx+lAxmfOz29HyqtMTe5DyG
nABWdKS+zGSitAxyjEySpCRqhIS6xJS6xMTW3Dx6lDx+lJy+xFyOpFyWpLzO1ESClIyyvNzm7CyG
nBxqhHSmtJzCzGSarABqhNTe5IS2xEyKnBxyjDR6jDSKnKTGzHSerABSbBRifGyqvGyerAxujP/6
/zyOpCRuhFSOnOTu7NTi5Bx6lKzGzABKZCx2jAxedCyClPT29HyuvEyWrMTa3ABCZFymtAB2jLTO
1FyarCx6lAxifEyGnJS2xAxWdABefCSCnIy+zFSWrESOpBRefDSCnKzO3AxqhJS+zDyCnCR2jMze
5Hy2xOzy9HSuvISuvGymtGyarDyKnGSmtAx2jNzq7CyKnJzGzBx2jGyuvP///zySpBx+lBxmhHSi
tGSWrABmhJy6zABujBxujFySrLzS3CxyjHymvHyqvEySrJy+zFyWrESCnIyyxDR6lDSKpKTG1HSe
tABSdGyetFSOpOTu9NTi7KzG1ABKbAxefCyCnPT2/8Ta5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACwAAAAAkAEoAAcI/gBFCRxI
sKDBgwgTKlzIsKHDhxAjSpxIsaLFixgzatzIsaPHjyBDihxJsqTJkyhTqlzJsqXLlzBjypxJs6bN
mzhfzpDjS46cNg873fj1i04rm8SGqrgxKWIbFRzMROXQq2ErDljNyIqQs6vXryJpeTiABImch0/6
ePCAo4lNMWo9APAS8cSaGnhrwHnCsFPeGlVeyAJLuLDGAVgK8Sg0TOYVYGXRnHUoa+wBNBps1rAM
zFRdU17WZBrtoNPCJ1VEZ1pThYPh17Aj8uDloIaDSo49RJ7cUBawAwc82LFZ4feBzp9PeVmeqUYh
hZ2UL/fS3HXs69gPol4Tmkju3Q9H/uBAg6bOG5svxqPpsyb59OUOEiR8UiPT9OrZ8+enb38N7phX
6IaEZA9VAsWBUDRVUxYH8gGFaRCdYIp001WBBULRvUddDdbp5+Fr/IXWGEOTEGMiMXxkUUkCNPjU
YidZtChHi0A5FCB4I/UiRwL/SUREFnLMIJKEFDJXBW8EhXgfhwgNM8MkrQCiggpWpDgiQidUomUl
NVYSwQBRAeJLQytCYcWUgLQySVUP9QLFLxzQAYgcJ4iyJZcKnZBAK3ByAAgxPR50Z52iDDMJmGYA
Ip9BbkJlRitZFDgJIFIZRWdCw9w5UCXEOKrDogcRwUMV/XVy55YFGcHCIWSh4QEX/hOUMccKkrQQ
CSaagGKAAVtIQWhDNw6I5EKVmHKGKZn8UhAfHZhiSgfyQXEKCXeUlUYUhfxa0CXHnvFcJVhIkQZZ
PjRxioIG8ZGJs5kMyxCRmThwyYSZVHGJQRkuxwNzTBYECAwTVvEXXg6YMoKQB/3iwBqi9dLJE3f9
VQUQXB00Aw9AxDswYF5ckgGJBXgxcBWmTMHAaqdUbFAedJhS28CZFBIpvqGx1sowHJgysANF8CZH
LSL/5QAMoCLkSy3NjWzKL9oOxMHCDFeSRSFJ58UzugPJMdp7DHfN3WAEOfHFF6sisQUHtbjhiTBC
SIICJimwLUgLXEAULIEO+eJB/h1yOVBQIQB4AEwfpsAhuAe6RLZ3D+6eEAwOHvTRBBZp8I1GWbqU
hwYMBwG+Vh/KRkhvDbLoUF9zWItSSH01YBHB6f0SBEQNzHktmhen1HDKUQaZQftyQNO+mmoaA3IQ
FHAwN3zX9tWGRR4ItTECx8uLlvt0NRBzUBYM6D789yI7YHxBnTgA3yVcCM/waBpDQQRqVVC3/mhV
OABGQr9UEf/36+fOBcIEkQXtTpGJfalPNV6oDe8EIiHzaeg9E2uaEjAgALIhYQcDuMQs3KAFPAhh
E5tAwNqEsIrx2UhAeGtIFsjlgfYQZAQe8AESLqMb4JTFhsFhRNFEcYImoMGG/h74IVluOEMk4MAz
BamMDy5jQofAqwZPaAO9hkaQDDUHSLDr0EAucQruvCwv+7NP9gxCh/osJ35eJBhzRDamghBjYZk4
hcD+QsDR1OBeB8HC6eIoMerwS3sFyUICR5M72wjMAVurwQIFUr7pOKCLCVQjdQios9V4YY7SiWMu
rkSQMvpRYPXDC3Xq5Z8kmvGSobmkJJs3M1E8gRdFSqADZumAKrRSIJXwwg7mUMFDwAIQPDBFINyg
ADeoARO7EKEH2XRCHKnwhnVw4UBG8JuyzLA8ukEDMAR0HA3UiIFbuBwRBXc5wVkTCcAYQEGmUAey
eECdoiOgc0QBCNgBUnX1/rGXKIiRRYMUgRe0A0IhODAlDmAhgZM0RdPKaJ9J1ucSTyhEERxYrwst
ixf1MwUWZDElMzzBFPELTQ0+VhAO1IA7IjNYQbGwBoqOkSDDcJkYufCLCPhiUpcI6XKYKYpGrpF2
MHjCE2DgwOVA8qERBYJLmyiQ1zXUAVhohU8iwIGWbqgWpmwoH9cA0UIAIaTNeY4osgAEGMAApcsp
AgxgAQMgwJMgWXiFFyxACgGwAReA+EUtTKEIT/wgFE8oQDIRgYKI3M1dCckCNKUpEGoOUZulOMMA
JjEJDkiBm3WYAkFOEE5rQoYQT+CDHFphCh+I0wM9+KYo2OnOtzpxdM+J/ikBHQAEoGTBfPVqCh/6
WZAnYAEKPB1IJ4CgHNQVhKHLqYEpBhAoab2HAgWZBBBUkICm8dAMpKpoQRJAqjNygJOiIEL+NnRP
gZhUjEmw7nibAzZGFtV8HACgKJzLrzWooEdtyF/z8DgQeC1HZZuaKHWqUDQBNlS5gAhUKyhUym+G
qJQKkUMqZhcJE9wCCoAARBJ4oAdMhCIUYeiwEhDQBcOiELEIUewMo1kQxyJBF2nAgncKQgUBeYAM
m+3siwkBYIFkwBDW9EATWYuEdyYnrAKppx0/xoN8WtSp+IlIFrJbAxUc14ynkAX0DMIf40bkEog8
hUIJ0mQ70gEhcrAn/kEqwZ3m8AUhYI7jmN1rVBhAqCBY6O4pChGogXCBgCIiSCvMWIXUiQIoVoyd
KAyMu+8eZFT2OVJvzbiGGSskDzqCAi5UEAEZWGEAuOjCEyRgiVCAQA1qUEIbH3LYh6j4ACx+YTWB
0d6CVCIN4kRCKzn7Qw+44iBA4UI7YZ0JghDZyPFEMg+nCAs5FLcKbYSyoi9diU74Agr2ifJAkHuK
4A5k0HZcZEKy1Asg5bk/PapEQ0/BBdUSZBJqHkgGKG3dgfCTlcLFrSIRogLY3ZIgq2soT+NMOoWc
W14BPGWfB6Lk5kBh0v2x9EE6wYQKVIAXLyCEmnhgiQtgogQXmMAm/tywCAscwQILX0irHfLqWE9z
1losSA2q6YEzg7PXmUFz4oqM44Ec27UNeaJYRQHu5bS5BjwYiLRjTpBeZEAWlwACSmvJr5hz+87R
pTJT+ysHFUjUFNyRI4Uy0SNp2/wg8LYjINvAhzjTFkV8iLvcocCHXxS3BiprZHO2LhBwe9kgjPYC
m3oBiDY7QBYOkvvc+YCFMJvim4H3tkB2u2SId0chiTjAIQZUhzvIAQqL8AQiHgCKGMhiDw94wApa
UAGJrPyZK2asKFwMDKYPpBDGqQN/eR2cnB/kBKW4HBpK8aufH3meDPyzhhzQyqUfJAEHxUsVMrm1
DVkdy1gniBz2/leDrZ/gFyAFDEUteZ8eNRzvCUl7cwDJAV5oaGN93NAC9d59hEABdoYWCHIFH16d
veeL8CcdYnYlkYcQ6jdSlldpChEAqqAKqMACusAL+eUFe5ACWrABQoUCFigMY/BmdnNirrZYLQZz
CTEANVQHSMRD4dR7CqEB2RQMVQEUxpdsyOdjp6RsTcVbBKECAiM/uFNLeVF1V2Yfp5B9WcN9TNUJ
OkNAtwOEeDF2PeI7kYZionCAfDBfqaEho2E7xMM++0Zne4cQlPd3BfELp1QVo4JWo1Q985NtXmAK
BHiGaEZlJDUQDyZxBTEMrPAAf/AFqIAEg8EBQFACseAJe/AL/oWwCxWoBSuQfyoHgiwngrJGFrWX
EK1wgtLEex7gewdxWQMCg4e2Wu1UZED3LrBVEEo1HUVIEM5HEAMgPHz0hpdQCLJgBmYghJ2EfXO4
IU3EZt0VPmtQBFjwBAQFC4hEHT1yXpdEhQc4CXEgSRWiP9I4jdLoALwwf/rGd6IwhjXgiGbYUJWg
AnBwCkVSS9R4jrWRCXEocHNYeUlCaXgIV5nAC8LACWPTCflVCK9QAm5gCQMAdYqoBaNQb4/oTAzR
crJHe7aXZCeYgprIiQZhCy8Yg6LYWsc3dAJxfwxTBR6Yg3akRb0AQUDQCr2gLSeQbdN2dbsYhtN0
UkYlC3Kw/mUDwWhkNxD9ZkeOWIX41wsR8HnZZiFyMAlgMJREWZRgEJQ9Qn/ayI3eeEpxEJRyIAvd
5QADEJRGeZWTgCQFeBDb5452CI8JEQGXkAlisAKoUAaFAgV0UAtcEAgcMAADkASXEANuQAkT8XoH
KYkvR4kLuWiQAWu7t4KbmBBt4EMDQnw+N4rI9hBCZxBAAFBVIF+i0IpJZkZQVW/qZn1DiDtGKBDb
x4sDMQxq6IghUpN9Bzvi9m7xJhD0YiEToZRiiH8I8Y07NRBWOBFbaRBd2Rx1KBB3mBAGgoiwgAAN
IBBtQAEuEAGtsJygJgtPoAc5qRB4uRAIOYJ8mRCZoJhv/vWQiRVkUmBs2nmRBpEAdPALD1cQlDl7
lvlvm4KS10eEnSkKn8mSPXV3HdliZmSa8olbVZB0aLaaonButRkRsHkQTDmbcigQcWAk/hkRuVkQ
u4mA7xhx0ZMAPeETYJAlnWBtygkFVzEChYAFl3ABKccQ06kQ1TmJ6LSQwHc5ugCKN8eCBgEUlzBs
dQAE4GmRNIiRDJGeAbccJXqSmpmL8LmS9eeZVGYGCTEF+dkjJ8AAqsieAsGDakcQ51drCcFTBZou
spkwCSoQApZAVDgQeRAoD6p9dIif2VaijnAIq0IWwUADD8ACgxAMwYAGWHABhzAEh3AIaDAcd4lC
O4Si/nrZWLNmZe4mCqYAGej0AjnWaz1nEFnACOKEBveTmDrKmKf4EOnJpHZ0hQZRCSNwd+/JmUZq
QlaEcMezC5lkplhmCkiSB23nUuWVmWdUilXEUleypcvSpQZBm/zHcK8an4eGbVp0pkfolQIhhbmF
EGqACmRzCB5ACEYwNmWDBK3gBqiACn3aQhRxN8SQB0SQB+RaruZapmNVqLNHc0AgkwKRB6YgIEUG
qjc3IE2wagMBBU1QQ8AgBusUnjsKEelZdGIWASNyAllQVb+jbfqni1yJhP01IfBBFZsCBZegO+XX
dO9xCjxTCE9wCXdxjOR1ZSjVn3LASRQABViQO2uw/qvZGJs4iaDsGLHHqBy/EAeblQUq8FWKhqxI
qqzzhWVAgDBt0AutIB+KwAkCgAoQ4AGFYAZLUEEQgAQhIAeNwAkm8IC6oI0mKq9psAAisABiO7Zi
KwJb8AGeIQfq6mIDsgBwAAQi6gClwKgHgAN08aiRgQRRwFUYQwDkERk+8G8zqKnyxKMLkZ5EgFZy
ZApsNSG0g1IMKwoq+bCgORC+g1L1UVZSZxsNxRx9Nm9+FEkcYz1/VBBtAAP5qT+mcAlYgAUZwzGB
BoZHyqUx66UzmzW4lVxeALci6rhd1BoJd7sQmqZr1rnmo1YZAwcq0AmzcAQ24ICHYAQFEAl19QVI
/gALEUAIV2sCLPAIJdq11kQe4ju+4usBjFAVCbC21RQZwFAHwPC+4lS3vlIQvHZOe+O+fHNDrmJl
/5qprxUaHCmwpHIXMXd/fhRHs8SEcrSF02aGtxOfcoBId9FEwzA7bkhLoVEvoQthVkp1W3g70wcE
pVsQRIC6a8ix+oNbomE+u8qEs7ss2VUFl/qrJzUa3hYBl8Q+uJPCyqEavFBrJqUakrefq1ED50kQ
v8ALOpzA8QIIEUBczvsFD9ALlzBXpPAHLEAMrbAGFdAIOYAKCFARYjFEwFHGZlzGlThW5AIMCbm+
QXQAPhDHS1RkdfAC4KWClfpDcrxEZFEHjMC//klkHEJWF3dxCryAVQ/BB7RhjVgqClZQG8rTPMr1
C+HzwyVFGwIDwYvMC0xVCUWAsezDRzUwBZdAG7aRclkQfX/RMUHpqwTRBnTQHNO3hvABGKbAAd/k
F7PEC7g6X5vsiO1XSw4geZ2QU7axhkTYg0WANVOAycOMZpucmosGu6rIC5w2AqbAC42ACn6QB6kA
CzUQCapgA8PQCrWwC2Iwp4lQEVIQF2vxzvD8zjhwBQORAGuxHne7ly/mCmnQvnXwz3zTA0mAJZ2F
BmngCvcL0MDgAw4gmXbYB66CA4DsRL5VC5cw0QwhB6wrotI8NS1FMJlwCYAAPa0rojpQEK2w/tFY
MMTF3LqXUF4MpAJ/Jn1iNgJn8S8l7a4F0QvEAAgD0AoRwCbzhm8IUQmAgAWgwbHkuAYwwAGTAF5U
7NL0CqEbfQlSKgoZoNLfG5VFsAbk+EhviAWAYISAoNUYUtWOGAEsNR1rALcnOwNg4KGfIB9P0goD
AAmOYCfXRikTMMQNwQcqAJeCPdiE/QvMNAyC/QvDQnt0UAmCeEiXcMS/J5g4prJJwwAcgLMJMQO/
AJcq4NctUQlyQAyT4AvfGxJt0AklMgkzQJATMT39odMHMQzllgVZMAPxGBPVZttZUJInQdszEAen
fR0KKRHc+SEe0gayDVdGgsjI/dwzUdyupz3ZOAfd+YHDtaAoMtkGRu3VG9Jj1h3eKlHcdSGYECne
hcFPtbEwQHAJUdcc/GJR6D3fKEHeEWLe9P0aEQBHzVNLxWVHXDDc+T3gGQFDwOEBfTluPnQZkUrg
XsEHL1A/kVzLVVAIue3gGI4RhRAXfdDI75IGkIMD55HhXRGOXhV25BgaRSAL+EriLn4RUBAE6xOd
CVEEq5EJ8v3iOVFtPiEHKqLjKxEQADs=


--=_related 00672C3EC1257460_=
Content-Type: image/gif; name="Image._1_07A1E0E807A1DD14004FF3CCC1257460.gif"
Content-Disposition: inline;
	filename="Image._1_07A1E0E807A1DD14004FF3CCC1257460.gif"
Content-ID: <_1_07A1E0E807A1DD14004FF3CCC1257460>
Content-Transfer-Encoding: base64

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
CVEEq5EJ8v3iOVFtPiEHKqLjKxEQADs=


--=_related 00672C3EC1257460_=--
