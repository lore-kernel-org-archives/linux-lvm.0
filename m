Message-Id: <00e301c1e7b2$4f501d90$f42cb69d@cerc.wvu.edu>
From: "Ning Ye" <nye@csee.wvu.edu>
MIME-Version: 1.0
Content-Type: multipart/alternative;
    boundary="----=_NextPart_000_00E0_01C1E790.C1B9CA10"
Subject: [linux-lvm] Howto Make LVM Work With NBD/ENBD?
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
Date: Fri Apr 19 09:58:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_00E0_01C1E790.C1B9CA10
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!,

    I want to make them work together, which makes me crazy these days.  =


    I can initialize the disks and partitions exported by ENBD, but when =
trying to create a volume group on it, vgcreate fails.
# vgcreate my_volume /dev/ndb
vgcreate -- ERROR "pv_read(): read" reading physical volumes
    After examine the debug output, it looks to me lvm trying to =
enumerate all physical disks present to the system.  These disks include =
SCSI disks(sda...), IDE disks(hda...) and loops(loop0...).  However, the =
LVM will not recognize the exported disk as a physical one.

    Did any one ever make it work before?  I would like to know before I =
am trying to look into the code.  Combining these two great packages =
would be wonderful.  But how?  Help needed.  Thanks.

                Ning


------=_NextPart_000_00E0_01C1E790.C1B9CA10
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2715.400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi!,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I want to make them =
work=20
together, which makes me crazy these days.&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I can initialize the =
disks and=20
partitions exported by ENBD, but when trying to create a volume group on =
it,=20
vgcreate fails.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># vgcreate my_volume =
/dev/ndb<BR>vgcreate -- ERROR=20
"pv_read(): read" reading physical volumes<BR>&nbsp;&nbsp;&nbsp; After =
examine=20
the debug output, it looks to me lvm trying to enumerate all physical =
disks=20
present to the system.&nbsp; These disks include SCSI disks(sda...), IDE =

disks(hda...) and loops(loop0...).&nbsp; However, the LVM will not =
recognize the=20
exported disk as a physical one.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Did any one ever =
make it work=20
before?&nbsp; I would like to know before&nbsp;</FONT><FONT face=3DArial =
size=3D2>I=20
am trying to look into the code.&nbsp; Combining these two great =
packages would=20
be wonderful.&nbsp; But how?&nbsp; Help needed.&nbsp; =
Thanks.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Ning</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_00E0_01C1E790.C1B9CA10--
