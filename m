Message-ID: <002301c350c0$a6b182e0$bbf6c150@world>
From: "Blueyonder" <abs1@blueyonder.co.uk>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0020_01C350C9.084B3160"
Subject: [linux-lvm] redhat 8 booting problem: Message=dropping to shell command
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
Date: Wed Jul 23 08:31:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0020_01C350C9.084B3160
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all

Having problems booting RH8, after creating a logical volume.
Bootup goes normally till it gets to displaying message =3D dropping you
to a  shell command.

The system already had working lv's, that were visible with df -h.
They remained mounted after rebooting. Appropriate entries for them
were found in /etc/fstab.

Below is what was attempted:

1. LV created & formatted with mke2fs -j /dev/vg1/varlv

2. Mounted: mount /dev/vg1/varlv   /var

3. Checked: df -h. Seen to be mounted.

4. After reboot, did, df -h  Not mounted now.

5. edited /etc/fstab to include the line for /dev/vg1/varlv:

/dev/vg1/varlv        /var      ext3     defaults   1 2

6. Rebooted:=20
Got to the point in bootup where message =3D dropping you to a  shell
command.

7. Typed root password and hit enter.

8. Repeated message: Init d:x respawning too fast, disabling for 5
mins.

I can see the message=3Ddropping you to a  shell command appears in
rc.sysinit. I understand that ext3 is handled by initrd ram disk.

Help much appreciated

thanks
abs.
------=_NextPart_000_0020_01C350C9.084B3160
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4926.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV>Hi all<BR><BR>Having problems booting RH8, after creating a logical =

volume.<BR>Bootup goes normally till it gets to displaying message =3D =
dropping=20
you<BR>to a&nbsp; shell command.<BR><BR>The system already had working =
lv's,=20
that were visible with df -h.<BR>They remained mounted after rebooting.=20
Appropriate entries for them<BR>were found in /etc/fstab.<BR><BR>Below =
is what=20
was attempted:<BR><BR>1. LV created &amp; formatted with mke2fs -j=20
/dev/vg1/varlv<BR><BR>2. Mounted: mount /dev/vg1/varlv&nbsp;&nbsp;=20
/var<BR><BR>3. Checked: df -h. Seen to be mounted.<BR><BR>4. After =
reboot, did,=20
df -h&nbsp; Not mounted now.<BR><BR>5. edited /etc/fstab to include the =
line for=20
/dev/vg1/varlv:<BR><BR>/dev/vg1/varlv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;=20
/var&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext3&nbsp;&nbsp;&nbsp;&nbsp;=20
defaults&nbsp;&nbsp; 1 2<BR><BR>6. Rebooted: <BR>Got to the point in =
bootup=20
where message =3D dropping you to a&nbsp; shell<BR>command.<BR><BR>7. =
Typed root=20
password and hit enter.<BR><BR>8. Repeated message: Init d:x respawning =
too=20
fast, disabling for 5<BR>mins.<BR><BR>I can see the message=3Ddropping =
you to=20
a&nbsp; shell command appears in<BR>rc.sysinit. I understand that ext3 =
is=20
handled by initrd ram disk.<BR><BR>Help much=20
appreciated<BR><BR>thanks<BR>abs.</DIV></DIV></BODY></HTML>

------=_NextPart_000_0020_01C350C9.084B3160--
