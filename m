Message-Id: <00a001c19eca$aca6cec0$38c8a8c0@caladanxp>
From: "Don Williams" <dwilliams@garfield.storage.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
    boundary="----=_NextPart_000_009D_01C19EA0.C3A45F90"
Subject: [linux-lvm] Problem copying device files to an LVM volume
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Jan 16 14:17:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_009D_01C19EA0.C3A45F90
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello all,

 When I copy device driver files files via NFS to a LVM volume they are =
"interpreted" instead of copied.  The
result is that when the copy hits the sda driver it starts copying the =
entire contents of /dev/sda drive!  Instead
fo the /dev/sda file itself. =20

 The file that it's trying to copy is from Tom's Rescue CD kit.   The =
dev files are sources files for creating a
bootable rescue CD. =20

 My configuration is:=20

 debian linux 3.0,  Kernel v2.4.17    Using ReiserFS 3.6.x  (I also =
tried using the EXT2 fs with identical results)


The SOURCE dir is about 5GB in size.  I'm trying to copy that to a 50GB =
LVM volume via the network
(NFS) .  However it consumes the whole 50GB.   If I remove the offending =
directories it returns to the proper size.
  Suggestions?

  Regards,

   Don Williams

   Storage Computer Corporation

   (603)880-3005 x115



  The output of the copy looks like this:

=20
cp: writing `/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdb': No space =
left on device

`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdc' -> =
`/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdc'

cp: cannot open `/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdc' for =
reading: No such device or address

`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdd' -> =
`/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdd'

cp: cannot open `/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdd' for =
reading: No such device or address

`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sde' -> =
`/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sde'

cp: cannot open `/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sde' for =
reading: No such device or address

`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdf' -> =
`/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdf'

cp: cannot open `/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdf' for =
reading: No such device or address

`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdg' -> =
`/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdg'

cp: cannot open `/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdg' for =
reading: No such device or address

`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdh' -> =
`/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdh'

cp: cannot open `/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdh' for =
reading: No such device or address

`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/rtc' -> =
`/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/rtc'



  corpnas:~# df

Filesystem 1k-blocks Used Available Use% Mounted on

/dev/sda1 2667848 634816 2033032 24% /

/dev/sda3 1776120 124360 1651760 8% /var

/dev/sda4 4254908 68664 4186244 2% /local/home

/dev/raid7/lvm2 51198432 51196436 1996 100% /lvm2   ** DESTINATION ***

garfield-int:/home 24409984 3448808 20961176 15% /home

garfield-int:/nas 37100944 5842216 31258728 16% /nas  *** SOURCE =
DIRECTORY ***

/dev/raid7/lvm1 51198432 2153480 49044952 5% /lvm1

corpnas:~#=20


------=_NextPart_000_009D_01C19EA0.C3A45F90
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2712.300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DCourier size=3D2>Hello all,</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;When I copy device driver files =
files via=20
NFS to a LVM volume&nbsp;they are "interpreted" instead of copied.&nbsp; =

The</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>result is that when&nbsp;the =
copy&nbsp;hits the=20
sda driver it starts copying the entire contents of&nbsp;/dev/sda =
drive!&nbsp;=20
Instead</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>fo the /dev/sda file itself.&nbsp; =
</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;The file that it's trying to =
copy is from=20
Tom's Rescue CD kit.&nbsp;&nbsp; The dev files are sources files for =
creating=20
a</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>bootable rescue CD.&nbsp; =
</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;My configuration is: =
</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;debian linux 3.0,&nbsp; Kernel=20
v2.4.17&nbsp;&nbsp;&nbsp; Using ReiserFS 3.6.x&nbsp; (I also tried using =
the=20
EXT2 fs with identical results)</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>The SOURCE dir is about 5GB in =
size.&nbsp; I'm=20
trying to copy that to a 50GB LVM volume via the network</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>(NFS) .&nbsp; However </FONT><FONT =
face=3DCourier=20
size=3D2>it consumes the whole 50GB.&nbsp;&nbsp; If I remove the =
offending=20
directories it returns to the proper size.</FONT></DIV>
<P><FONT face=3DCourier size=3D2>&nbsp; Suggestions?</FONT></P>
<P><FONT face=3DCourier size=3D2>&nbsp; Regards,</FONT></P>
<P><FONT face=3DCourier size=3D2>&nbsp;&nbsp; Don Williams</FONT></P>
<P><FONT face=3DCourier size=3D2>&nbsp;&nbsp; Storage Computer=20
Corporation</FONT></P>
<P><FONT face=3DCourier size=3D2>&nbsp;&nbsp; (603)880-3005 =
x115</FONT></P>
<P><FONT face=3DCourier size=3D2></FONT>&nbsp;</P>
<P><FONT face=3DCourier size=3D2>&nbsp;&nbsp;The output of the copy =
looks like=20
this:</FONT></P>
<DIV><FONT face=3DCourier size=3D2>&nbsp;</FONT></DIV>
<DIV>
<P><FONT face=3DCourier size=3D2>cp: writing=20
`/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdb': No space left on=20
device</FONT></P>
<P><FONT face=3DCourier =
size=3D2>`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdc'=20
-&gt; `/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdc'</FONT></P>
<P><FONT face=3DCourier size=3D2>cp: cannot open=20
`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdc' for reading: No such =
device or=20
address</FONT></P>
<P><FONT face=3DCourier =
size=3D2>`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdd'=20
-&gt; `/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdd'</FONT></P>
<P><FONT face=3DCourier size=3D2>cp: cannot open=20
`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdd' for reading: No such =
device or=20
address</FONT></P>
<P><FONT face=3DCourier =
size=3D2>`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sde'=20
-&gt; `/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sde'</FONT></P>
<P><FONT face=3DCourier size=3D2>cp: cannot open=20
`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sde' for reading: No such =
device or=20
address</FONT></P>
<P><FONT face=3DCourier =
size=3D2>`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdf'=20
-&gt; `/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdf'</FONT></P>
<P><FONT face=3DCourier size=3D2>cp: cannot open=20
`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdf' for reading: No such =
device or=20
address</FONT></P>
<P><FONT face=3DCourier =
size=3D2>`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdg'=20
-&gt; `/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdg'</FONT></P>
<P><FONT face=3DCourier size=3D2>cp: cannot open=20
`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdg' for reading: No such =
device or=20
address</FONT></P>
<P><FONT face=3DCourier =
size=3D2>`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdh'=20
-&gt; `/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/sdh'</FONT></P>
<P><FONT face=3DCourier size=3D2>cp: cannot open=20
`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/sdh' for reading: No such =
device or=20
address</FONT></P>
<P><FONT face=3DCourier =
size=3D2>`/nas/src/trccs-0.8.1r2/_system/_cd/var/dev/rtc'=20
-&gt; `/lvm2/src/trccs-0.8.1r2/_system/_cd/var/dev/rtc'</FONT></P>
<P><FONT face=3DCourier size=3D2></FONT>&nbsp;</P>
<P><FONT face=3DCourier size=3D2>&nbsp;<STRONG> </STRONG></FONT><FONT =
face=3DCourier=20
size=3D2>corpnas:~# df</FONT></P>
<P><FONT face=3DCourier size=3D2>Filesystem 1k-blocks Used Available =
Use% Mounted=20
on</FONT></P>
<P><FONT face=3DCourier size=3D2>/dev/sda1 2667848 634816 2033032 24% =
/</FONT></P>
<P><FONT face=3DCourier size=3D2>/dev/sda3 1776120 124360 1651760 8% =
/var</FONT></P>
<P><FONT face=3DCourier size=3D2>/dev/sda4 4254908 68664 4186244 2%=20
/local/home</FONT></P>
<P><FONT face=3DCourier size=3D2><STRONG>/dev/raid7/lvm2 51198432 =
51196436 1996 100%=20
/lvm2&nbsp;&nbsp; ** DESTINATION ***</STRONG></FONT></P>
<P><FONT face=3DCourier size=3D2>garfield-int:/home 24409984 3448808 =
20961176 15%=20
/home</FONT></P>
<P><FONT face=3DCourier size=3D2><STRONG>garfield-int:/nas 37100944 =
5842216 31258728=20
16% /nas&nbsp;&nbsp;*** SOURCE DIRECTORY ***</STRONG></FONT></P>
<P><FONT face=3DCourier size=3D2>/dev/raid7/lvm1 51198432 2153480 =
49044952 5%=20
/lvm1</FONT></P>
<P><FONT face=3DCourier size=3D2>corpnas:~# =
</FONT></P></DIV></BODY></HTML>

------=_NextPart_000_009D_01C19EA0.C3A45F90--
