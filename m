Date: Fri, 12 Oct 2001 18:18:56 -0600
Message-ID: <20011012.181856.-303677.1.james.cromie@juno.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary=--__JNP_000_4f4d.0ab2.7be5
From: Jim N Cromie <james.cromie@juno.com>
Subject: [linux-lvm] pv recovery after trashing partition table.
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This message is in MIME format.  Since your mail reader does not understand
this format, some or all of this message may not be legible.

----__JNP_000_4f4d.0ab2.7be5
Content-Type: text/plain; charset=us-ascii  
Content-Transfer-Encoding: 7bit


Q:  how is 'dd' like motorcycles ?
A:  there are 2 types of users, those who have crashed, and those who
will.

Well, Ive now joined the ranks of folks who have.  I blew away the hda
partition table.

/dev/hda4 used to have a good PV.

Miraculously, Ive successfully recovered hda[1-3], by a combination of
luck,
a simple partition table (1=vfat, 2=swap, 3=ext2, 4=lvm, on cylinder
boundaries), good notes (I had the cylinder numbers mostly written down),
and perseverance with fdisk.  I wrote experimental partition-tables
untill I was able to mount them.

Just imagine my glee when hda3 fsck'd good !


So now, Im trying to recover hda4 now, with LVM volumes intact;

vgcfgrestore -l -l -v -d -n _vgb, reports 2 PVs,  hdb2, hda4,  both are
available, with some unusable, ( I cant cut-paste here, different
computer, cant boot clean without /var

pvscan however reports 2 different PVs,  hdb2, and hdc9

Im guessing that I did a pvcreate /dev/hdc9 after some snapshot/backup,
since hdc9 isnt there.  This suggests that my chances of recovery are
poorer than otherwize.  I never actually did a vgcfgsave - Ive only been
a couple of weeks with LVM, and it was only /tmp...

anyway, pvdata /dev/hda4 shows bogus (ie unfavorable, not wrong) data in
the PV, it also segfaults, $? is 139

PV size                8 / Not usable 262 GB [LVM 3.71 GB]
PV#                     0
PE Size(KB)        250
uuid                    none

btw - 3.71 GB is reasonable, the hda4 has ~3.9 GB

$> pvdisplay /dev/hda4
-- no physical volume identifier


vgcfgrestore gives error when I try above:

ERROR: pv_read(): PV identifer invalid" reading physical volume
/dev/hda4

I should mention; I dont understand how sectors in hda4 got corrupted,
at least by my dd ( I did have bs=512 count=1, and hda[1-3] are ok).
Something else may be missing..


SO, WHAT IF ANY ARE MY OPTIONS ?

1) Would a carefully considered set of 'dd' commands possibly
restore it?   I have nothing to lose in hda4 at this point.

2) IS IT POSSIBLE THAT DESPITE MY SUCCESS MOUNTING hda 1-3, particularly
hda3, since thats ext2, (ie a real filesystem, with a real fsck).  Ive
somehow got the partitions wrong, and thus pvdata is looking in the wrong
disk sector for its meta-data  ?

3) is it possible to use fdisk to change partition type to Linux, then do
an fsck ?
Im theorizing that fsck will find 3 different ext2 super-blocks somewhere
within the previously mountable LVM partition ?

I think I can claim enough space elsewhere, and make a file-clone of the
partition, if so, I can let fsck do all its repair attempts w/o trashing
the possibility
of using approaches 1,2


tia
jimc
----__JNP_000_4f4d.0ab2.7be5
Content-Type: text/html; charset=us-ascii  
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR></HEAD>
<BODY bottomMargin=3D0 leftMargin=3D3 topMargin=3D0 rightMargin=3D3>
<DIV>&nbsp;</DIV>
<DIV>Q:&nbsp; how is 'dd' like motorcycles ?</DIV>
<DIV>A:&nbsp; there are 2 types of users, those who have crashed, and those=
 who=20
will.</DIV>
<DIV><BR>Well, Ive now&nbsp;joined the ranks of folks who have.&nbsp; I =
blew=20
away the hda partition table.</DIV>
<DIV>&nbsp;</DIV>
<DIV>/dev/hda4 used to have a good PV.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Miraculously, Ive successfully recovered hda[1-3], by a combination of=
=20
luck,</DIV>
<DIV>a simple partition table (1=3Dvfat, 2=3Dswap, 3=3Dext2, 4=3Dlvm, on=20
cylinder&nbsp;boundaries), good notes (I had the cylinder numbers mostly =
written=20
down), and perseverance with fdisk.&nbsp;&nbsp;I wrote experimental=20
partition-tables untill I was able to mount them.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Just imagine my glee when hda3 fsck'd good !</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>So now, Im trying to recover hda4 now, with LVM volumes intact;</=
DIV>
<DIV><BR>vgcfgrestore -l -l -v -d -n _vgb, reports 2 PVs,&nbsp; hdb2,=20
hda4,&nbsp; both are<BR>available, with some unusable, ( I cant cut-paste =
here,=20
different<BR>computer, cant boot clean without /var</DIV>
<DIV>&nbsp;</DIV>
<DIV>pvscan however reports 2 different PVs,&nbsp; hdb2, and hdc9</DIV>
<DIV>&nbsp;</DIV>
<DIV>Im guessing that I did a pvcreate /dev/hdc9 after some snapshot/backup=
,=20
since hdc9 isnt there.&nbsp; This suggests that my chances of recovery are=
=20
poorer than otherwize.&nbsp; I never actually did a vgcfgsave - Ive only =
been a=20
couple of weeks with LVM, and it was only /tmp...</DIV>
<DIV>&nbsp;</DIV>
<DIV>anyway, pvdata /dev/hda4 shows bogus (ie unfavorable, not wrong) data =
in=20
the PV, it also segfaults, $? is 139</DIV>
<DIV>&nbsp;</DIV>
<DIV>PV size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8 / Not usable 262 GB [LVM 3.71=
=20
GB]</DIV>
<DIV>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0</DIV>
<DIV>PE Size(KB)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
250<BR>uuid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
 none</DIV>
<DIV>&nbsp;</DIV>
<DIV>btw - 3.71 GB is reasonable, the hda4 has ~3.9 GB</DIV>
<DIV>&nbsp;</DIV>
<DIV>$&gt; pvdisplay /dev/hda4</DIV>
<DIV>-- no physical volume identifier</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>vgcfgrestore gives error when I try above:</DIV>
<DIV>&nbsp;</DIV>
<DIV>ERROR: pv_read(): PV identifer invalid" reading physical=20
volume<BR>/dev/hda4</DIV>
<DIV>&nbsp;</DIV>
<DIV>I should mention; I dont understand how sectors in hda4 got=20
corrupted,</DIV>
<DIV>at least by my dd ( I did have bs=3D512 count=3D1, and hda[1-3] are ok=
).</DIV>
<DIV>Something else may be missing..</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>SO, WHAT IF ANY ARE MY OPTIONS ?</DIV>
<DIV><BR>1) Would a carefully considered set of 'dd' commands possibly</DIV>
<DIV>restore it?&nbsp;&nbsp; I have nothing to lose in hda4 at this point.<=
/DIV>
<DIV>&nbsp;</DIV>
<DIV>2) IS IT POSSIBLE THAT DESPITE MY SUCCESS MOUNTING hda 1-3, =
particularly=20
hda3, since thats ext2, (ie a real filesystem, with a real fsck). &nbsp;Ive=
=20
somehow got the partitions wrong, and thus pvdata is looking in the wrong =
disk=20
sector for its meta-data&nbsp; ?</DIV>
<DIV>&nbsp;</DIV>
<DIV>3) is it possible to use fdisk to change partition type to Linux, then=
 do=20
an fsck ?</DIV>
<DIV>Im theorizing that fsck will find 3 different&nbsp;ext2 super-blocks=20
somewhere within the previously mountable LVM partition ?</DIV>
<DIV>&nbsp;</DIV>
<DIV>I think I can claim enough space elsewhere, and make a file-clone of =
the=20
partition, if so, I can let fsck do all its repair attempts w/o trashing =
the=20
possibility</DIV>
<DIV>of using approaches 1,2</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>tia<BR>jimc</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

----__JNP_000_4f4d.0ab2.7be5--
