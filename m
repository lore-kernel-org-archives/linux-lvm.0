Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed;
    boundary="----=_NextPartTM-000-909faf7e-1cff-48cb-974c-8e468cfa6bd6"
Message-Id: <1BD922A62552D411B48A00D0B74723751120A947@kecmsg04.ad.infosys.com>
From: "ASHISH GUPTA" <ashish_gupta@infy.com>
Subject: [linux-lvm] Does LVM work with NBD?
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
Date: Wed Mar 20 04:34:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPartTM-000-909faf7e-1cff-48cb-974c-8e468cfa6bd6
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C1CFFA.DFC28388"

------_=_NextPart_001_01C1CFFA.DFC28388
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,
=20
1) I'm using NBD and LVM . I have mounted the remote device=20
using NBD(version 2.4.27). When I do pvcreate on mounted disk,it is =
successful.
=20
#pvcreate /dev/nb0
pvcreate -- physical volume "/dev/nb0" successfully created
=20
But when we try out other commands such as pvdisplay, vgcreate etc. it =
gives the
following error.=20
=20
 #pvdisplay /dev/nb0
pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID =
physical volume "/d
ev/nb0"
=20
# ./vgcreate /dev/nb0
vgcreate -- please enter physical volume name(s)
=20
pvcreate uses the information from /proc/partitions.=20
It  works although the /proc/partitions is not updated with the remote =
device information.
However the other LVM commands like "vgcreate", "pvdisplay" look for =
remote device
information in /proc/partition and as the entry is not there in =
dir_cache, it fails.
=20
To make it run, I have added a entry for nb0 in the file lvm_dir_cache.c =
in _noprocdir.
/* devices *not* showing up in /proc/partitions must be scanned anyway =
*/
static char *_noprocdir[] =3D {
        LVM_DIR_PREFIX "loop",
        LVM_DIR_PREFIX "nb0",
        NULL
};
=20
After doing,I am able to do pvcreate, vgcreate and so.Is it right way to =
do this?
=20
2)As per some mail in lvm-linux archieve, if I make an entry for nbd =
device in _devdir[] in file lvm_dir_cache.c
 and just modify this following check by replacing _cache_size with =
'1'.Still pvcreate fails.And it gives the following error.
=20
if(!_cache_size)
                        _scan_devs( TRUE);
                else
                        _scan_devs( FALSE);
        }
=20
=20
# pvcreate /dev/nb0
"/dev/nb0 has a partition table"
=20
=20
3) Is there any patch available to make NBD working with LVM?
=20
=20
=20
Regards,
Ashish
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20

------_=_NextPart_001_01C1CFFA.DFC28388
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 5.00.3103.1000" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>Hi All,</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>1) I'm using NBD and LVM .&nbsp;I have =
mounted&nbsp;the=20
remote device </SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>using NBD(version 2.4.27). When&nbsp;I do =
pvcreate on=20
mounted disk,it is successful.</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>#pvcreate /dev/nb0</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>pvcreate -- physical volume "/dev/nb0" =
successfully=20
created</SPAN></FONT></DIV></SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>But when we try out other commands such as =
pvdisplay,=20
vgcreate etc. it gives the</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>following error. </SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>&nbsp;#pvdisplay /dev/nb0<BR>pvdisplay -- =
ERROR=20
"pv_read(): pv_create_name_from_kdev_t" no VALID physical volume=20
"/d<BR>ev/nb0"</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002># ./vgcreate /dev/nb0<BR>vgcreate -- please =
enter=20
physical volume name(s)</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>pvcreate uses the information=20
from&nbsp;/proc/partitions. </SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>It&nbsp; works although the /proc/partitions =
is not=20
updated with the remote device information.</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>However the other LVM commands like =
"vgcreate",=20
"pvdisplay" look for remote device</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>information in /proc/partition and as the =
entry is not=20
there in dir_cache, it fails.</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>To make it run, I have added a entry for nb0 =
in the=20
file lvm_dir_cache.c in _noprocdir.</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>/* devices *not* showing up in =
/proc/partitions must be=20
scanned anyway */<BR>static char *_noprocdir[] =3D=20
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LVM_DIR_PREFIX=20
"loop",<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LVM_DIR_PREFIX=20
"nb0",<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
NULL<BR>};</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>After doing,I am  able to do pvcreate, =
vgcreate and=20
so.Is it right way to do this?</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>2)As per some mail in lvm-linux archieve, if =
I make an=20
entry for nbd device in _devdir[] in file =
lvm_dir_cache.c</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>&nbsp;and just modify this following  =
check&nbsp;by=20
replacing _cache_size with '1'.Still pvcreate fails.And it gives the =
following=20
error.</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>if(!_cache_size)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
_scan_devs(=20
TRUE);<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
else<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
_scan_devs( FALSE);<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
}</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>&nbsp;</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002># pvcreate /dev/nb0</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>"/dev/nb0 has a partition =
table"</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>3) Is there any patch available to make NBD =
working=20
with LVM?</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>Regards,</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>Ashish</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002></SPAN></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3D"Trebuchet MS" size=3D2><SPAN=20
class=3D482470510-19032002>&nbsp;</SPAN></FONT></DIV></BODY></HTML>

------_=_NextPart_001_01C1CFFA.DFC28388--

------=_NextPartTM-000-909faf7e-1cff-48cb-974c-8e468cfa6bd6--
