Message-ID: <000c01c2afc9$7871b3c0$9c0d10ac@hq.iei>
From: "Kent Tsai" <kenttsai@iei.com.tw>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01C2B00C.8566D400"
Subject: [linux-lvm] snapshot problem on ext3
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
Date: Mon Dec 30 00:05:08 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0009_01C2B00C.8566D400
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="big5"

Hi All,
I have one snapshot problem on ext3 filesystem.
I use RedHat 8.0, and I use lvm tools to create one snapshot.
Then I use lvextend to extend the snapshot volume, I can no longer mount =
it
My steps are as below:
1. First I create a volume group called test, and create a volume called =
vol
2. I use lvcreate to create snapshot
    lvcreate -s -l 50 -n snap1 /dev/test/vol
3. mount snapshot
    mount /dev/test/snap1 /mnt/snap1
4. umount snapshot
    umount /dev/test/snap1
5. use lvextend to extend the snapshot size
    lvextend -l +10 /dev/test/snap1
6. mount snapshot again
    mount /dev/test/snap1 /mnt/snap1
But error occur...the error message is:
mount: block device /dev/test/snap1 is write-protected, mounting =
read-only
mount: wrong fs type, bad option, bad superblock on /dev/test/snap1,
           or too many mounted file systems

Regards,
Kent

------=_NextPart_000_0009_01C2B00C.8566D400
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset="big5"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dbig5">
<META content=3D"MSHTML 5.50.4134.100" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have one snapshot problem on ext3=20
filesystem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I use RedHat 8.0, and I use lvm tools =
to create one=20
snapshot.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Then I use lvextend to extend the =
snapshot volume,=20
I can no longer mount it</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>My steps&nbsp;are as =
below:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>1. First I create a volume group called =
test, and=20
create a volume called vol</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>2. I use lvcreate to create =
snapshot</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; lvcreate -s -l 50 -n =
snap1=20
/dev/test/vol</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>3. mount snapshot</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; mount =
/dev/test/snap1=20
/mnt/snap1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>4. umount snapshot</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; umount=20
/dev/test/snap1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>5. use lvextend to extend the snapshot=20
size</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; lvextend -l +10=20
/dev/test/snap1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>6. mount snapshot again</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; mount =
/dev/test/snap1=20
/mnt/snap1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But error occur...the error message=20
is:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mount: block device /dev/test/snap1 is=20
write-protected, mounting read-only</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mount: wrong fs type, bad option, bad =
superblock on=20
/dev/test/snap1,</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or =
too many=20
mounted file systems</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Kent</FONT></DIV></BODY></HTML>

------=_NextPart_000_0009_01C2B00C.8566D400--
