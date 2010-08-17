Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7HJQn1I018350
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2010 15:26:49 -0400
Received: from mckesson.com (mail5.mckesson.com [143.112.68.14])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7HJQbGH007991
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2010 15:26:38 -0400
From: "Allen, Jack" <Jack.Allen@mckesson.com>
Content-class: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CB3E42.0D8B8A0D"
Content-class: urn:content-classes:message
Date: Tue, 17 Aug 2010 15:26:09 -0400
Message-ID: <230ED15F81AFD3409345FFA4E565F0E50CE525BF@NDHV3000.na.corp.mckesson.com>
Subject: [linux-lvm] pvmove hangs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01CB3E42.0D8B8A0D
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello:

        I posted this in the Dm-devel list yesterday afternoon, but so
far I have not gotten any responses, so I thought I would ask the same
questions here since the command that hang is pvmove.

        I had a customer that tried to do a pvmove and it hung. So we
setup a test system to try and duplicate the problem and were able to.

        A little history and why I am asking the question in this list.
The customer needed to move from an existing SAN to a new SAN and =
wanted
as little as possible down time for the Application. So they zoned the
new SAN for access by the system and then added the new LUNs to the
existing Volume Group. Then ran the pvmove commands. It worked with no
problem on one of the PVs, but on the second one all the I/O hung at =
the
Application and any commands that access the LVM information such as
vgdisplay.

        On our test system we only have 1 SAN (EMC CX700). We put X
number of LUNs in a Volume Group and allocated Logical Volumes for the
Application. Added some more LUNs to the Volume Group to simulate a
second SAN. Started the Application with a test program to generate =
I/O.
Ran pvmove with no problems on one PV, but on the second PV, it hung
just like on the customer's system.

        The reason I am posting to this list is because the same type =
of
move was done earlier on the test system running PowerPath and did not
have any problems. The OS is Red Hat EL 5.5 32 bit. The same version of
LVM was used on both tests. I can provide other details if needed.

        Below is part of the messages file when this happen.

Aug 13 14:18:14 mss121 multipathd: dm-25: add map (uevent)

Aug 13 14:18:14 mss121 multipathd: dm-19: add map (uevent)

Aug 13 14:18:14 mss121 multipathd: dm-22: add map (uevent)

Aug 13 14:19:53 mss121 multipathd: dm-25: add map (uevent)

Aug 13 14:19:53 mss121 multipathd: dm-19: add map (uevent)

Aug 13 14:19:53 mss121 multipathd: dm-22: add map (uevent)

Aug 13 14:21:26 mss121 multipathd: dm-25: add map (uevent)

Aug 13 14:21:26 mss121 multipathd: dm-19: add map (uevent)

Aug 13 14:21:26 mss121 multipathd: dm-22: add map (uevent)

Aug 13 14:21:26 mss121 multipathd: dm-25: remove map (uevent)

Aug 13 14:22:47 mss121 multipathd: dm-25: add map (uevent)

Aug 13 14:22:47 mss121 multipathd: dm-17: add map (uevent)

Aug 13 14:22:47 mss121 multipathd: dm-20: add map (uevent)

Aug 13 14:22:47 mss121 multipathd: dm-23: add map (uevent)

Aug 13 14:27:22 mss121 kernel: INFO: task mpdsk:22158 blocked for more

than 120 seconds.

Aug 13 14:27:22 mss121 kernel: "echo 0>

/proc/sys/kernel/hung_task_timeout_secs" disables this message.

Aug 13 14:27:22 mss121 kernel: mpdsk         D 00000BD7  1784 22158

22151         22159 22157 (NOTLB)

Aug 13 14:27:22 mss121 kernel:        f3025e04 00000082 bde60e11

00000bd7 f3025e50 c045d1a9 f3025e50 0000000a

Aug 13 14:27:22 mss121 kernel:        f7c60000 bde67e2a 00000bd7

00007019 00000000 f7c6010c c8612700 f6ec4e40

Aug 13 14:27:22 mss121 kernel:        00000000 00000000 00000000

c12b8dc0 018dc6f2 c042cbd1 f6cb3f0c ffffffff

Aug 13 14:27:22 mss121 kernel: Call Trace:

Aug 13 14:27:22 mss121 kernel:  [<c045d1a9>] =
__pagevec_release+0x15/0x1d

Aug 13 14:27:22 mss121 kernel:  [<c042cbd1>] getnstimeofday+0x30/0xb6

Aug 13 14:27:22 mss121 kernel:  [<c061c156>] io_schedule+0x36/0x59

Aug 13 14:27:22 mss121 kernel:  [<c04569c0>] sync_page+0x38/0x3b

Aug 13 14:27:22 mss121 kernel:  [<c061c32d>] __wait_on_bit+0x33/0x58

Aug 13 14:27:22 mss121 kernel:  [<c0456988>] sync_page+0x0/0x3b

Aug 13 14:27:22 mss121 kernel:  [<c0456a48>] wait_on_page_bit+0x5b/0x62

Aug 13 14:27:22 mss121 kernel:  [<c043642c>] wake_bit_function+0x0/0x3c

Aug 13 14:27:22 mss121 kernel:  [<c04573cf>]

wait_on_page_writeback_range+0x4d/0xf1

Aug 13 14:27:22 mss121 kernel:  [<c04934a0>]
generic_osync_inode+0x93/0xbf

Aug 13 14:27:22 mss121 kernel:  [<c0457618>]

sync_page_range_nolock+0x68/0x93

Aug 13 14:27:22 mss121 kernel:  [<c0458930>]

generic_file_aio_write_nolock+0x71/0x83

Aug 13 14:27:22 mss121 kernel:  [<c047b301>] blkdev_file_write+0x0/0x1e

Aug 13 14:27:22 mss121 kernel:  [<c0458c8d>]

generic_file_write_nolock+0x86/0x9a

Aug 13 14:27:22 mss121 kernel:  [<c04566fe>]
find_get_pages_tag+0x30/0x75

Aug 13 14:27:22 mss121 kernel:  [<c0457428>]

wait_on_page_writeback_range+0xa6/0xf1

Aug 13 14:27:22 mss121 kernel:  [<c04363ff>]

autoremove_wake_function+0x0/0x2d

Aug 13 14:27:22 mss121 kernel:  [<c061c408>] mutex_lock+0xb/0x19

Aug 13 14:27:22 mss121 kernel:  [<c0449c52>]
audit_syscall_entry+0x15a/0x18c

Aug 13 14:27:22 mss121 kernel:  [<c047b31b>] =
blkdev_file_write+0x1a/0x1e

Aug 13 14:27:22 mss121 kernel:  [<c0474d53>] vfs_write+0xa1/0x143

Aug 13 14:27:22 mss121 kernel:  [<c0475345>] sys_write+0x3c/0x63

Aug 13 14:27:22 mss121 kernel:  [<c0404f17>] syscall_call+0x7/0xb

Aug 13 14:27:22 mss121 kernel:  =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Aug 13 14:27:22 mss121 kernel: INFO: task mpdsk:22161 blocked for more

than 120 seconds.

Aug 13 14:27:22 mss121 kernel: "echo 0>

/proc/sys/kernel/hung_task_timeout_secs" disables this message.

Aug 13 14:27:22 mss121 kernel: mpdsk         D 00000BD7  1884 22161

22151         22162 22160 (NOTLB)

Aug 13 14:27:22 mss121 kernel:        f34e2e04 00000082 baebd585

00000bd7 f34e2e50 c045d1a9 f34e2e50 0000000a

Aug 13 14:27:22 mss121 kernel:        f6eb1550 baec5e00 00000bd7

0000887b 00000000 f6eb165c c8612700 f723f040

Aug 13 14:27:22 mss121 kernel:        00000000 00000000 00000000

c12e1f80 018dc68e c042cbd1 f6cb3bdc ffffffff

Aug 13 14:27:22 mss121 kernel: Call Trace:

Aug 13 14:27:22 mss121 kernel:  [<c045d1a9>] =
__pagevec_release+0x15/0x1d

Aug 13 14:27:22 mss121 kernel:  [<c042cbd1>] getnstimeofday+0x30/0xb6

Aug 13 14:27:22 mss121 kernel:  [<c061c156>] io_schedule+0x36/0x59

Aug 13 14:27:22 mss121 kernel:  [<c04569c0>] sync_page+0x38/0x3b

Aug 13 14:27:22 mss121 kernel:  [<c061c32d>] __wait_on_bit+0x33/0x58

Aug 13 14:27:22 mss121 kernel:  [<c0456988>] sync_page+0x0/0x3b

Aug 13 14:27:22 mss121 kernel:  [<c0456a48>] wait_on_page_bit+0x5b/0x62

Aug 13 14:27:22 mss121 kernel:  [<c043642c>] wake_bit_function+0x0/0x3c

Aug 13 14:27:22 mss121 kernel:  [<c04573cf>]

wait_on_page_writeback_range+0x4d/0xf1

Aug 13 14:27:22 mss121 kernel:  [<c04934a0>]
generic_osync_inode+0x93/0xbf

Aug 13 14:27:22 mss121 kernel:  [<c0457618>]

sync_page_range_nolock+0x68/0x93

Aug 13 14:27:22 mss121 kernel:  [<c0458930>]

generic_file_aio_write_nolock+0x71/0x83

Aug 13 14:27:22 mss121 kernel:  [<c047b301>] blkdev_file_write+0x0/0x1e

Aug 13 14:27:22 mss121 kernel:  [<c0458c8d>]

generic_file_write_nolock+0x86/0x9a

Aug 13 14:27:22 mss121 kernel:  [<c04566fe>]
find_get_pages_tag+0x30/0x75

Aug 13 14:27:22 mss121 kernel:  [<c0457428>]

wait_on_page_writeback_range+0xa6/0xf1

Aug 13 14:27:22 mss121 kernel:  [<c04363ff>]

autoremove_wake_function+0x0/0x2d

Aug 13 14:27:22 mss121 kernel:  [<c061c408>] mutex_lock+0xb/0x19

Aug 13 14:27:22 mss121 kernel:  [<c0449c52>]
audit_syscall_entry+0x15a/0x18c

Aug 13 14:27:22 mss121 kernel:  [<c047b31b>] =
blkdev_file_write+0x1a/0x1e

Aug 13 14:27:22 mss121 kernel:  [<c0474d53>] vfs_write+0xa1/0x143

Aug 13 14:27:22 mss121 kernel:  [<c0475345>] sys_write+0x3c/0x63

Aug 13 14:27:22 mss121 kernel:  [<c0404f17>] syscall_call+0x7/0xb

Aug 13 14:27:22 mss121 kernel:  =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Aug 13 14:29:22 mss121 kernel: INFO: task mpdsk:22158 blocked for more

than 120 seconds.

Aug 13 14:29:22 mss121 kernel: "echo 0>

/proc/sys/kernel/hung_task_timeout_secs" disables this message.

Aug 13 14:29:22 mss121 kernel: mpdsk         D 00000BD7  1784 22158

22151         22159 22157 (NOTLB)

Aug 13 14:29:22 mss121 kernel:        f3025e04 00000082 bde60e11

00000bd7 f3025e50 c045d1a9 f3025e50 0000000a

Aug 13 14:29:22 mss121 kernel:        f7c60000 bde67e2a 00000bd7

00007019 00000000 f7c6010c c8612700 f6ec4e40

Aug 13 14:29:22 mss121 kernel:        00000000 00000000 00000000

c12b8dc0 018dc6f2 c042cbd1 f6cb3f0c ffffffff

Aug 13 14:29:22 mss121 kernel: Call Trace:

Aug 13 14:29:22 mss121 kernel:  [<c045d1a9>] =
__pagevec_release+0x15/0x1d

Aug 13 14:29:22 mss121 kernel:  [<c042cbd1>] getnstimeofday+0x30/0xb6

Aug 13 14:29:22 mss121 kernel:  [<c061c156>] io_schedule+0x36/0x59

Aug 13 14:29:22 mss121 kernel:  [<c04569c0>] sync_page+0x38/0x3b

Aug 13 14:29:22 mss121 kernel:  [<c061c32d>] __wait_on_bit+0x33/0x58

Aug 13 14:29:22 mss121 kernel:  [<c0456988>] sync_page+0x0/0x3b

Aug 13 14:29:22 mss121 kernel:  [<c0456a48>] wait_on_page_bit+0x5b/0x62

Aug 13 14:29:22 mss121 kernel:  [<c043642c>] wake_bit_function+0x0/0x3c

Aug 13 14:29:22 mss121 kernel:  [<c04573cf>]

wait_on_page_writeback_range+0x4d/0xf1

Aug 13 14:29:22 mss121 kernel:  [<c04934a0>]
generic_osync_inode+0x93/0xbf

Aug 13 14:29:22 mss121 kernel:  [<c0457618>]

sync_page_range_nolock+0x68/0x93

Aug 13 14:29:22 mss121 kernel:  [<c0458930>]

generic_file_aio_write_nolock+0x71/0x83

Aug 13 14:29:22 mss121 kernel:  [<c047b301>] blkdev_file_write+0x0/0x1e

Aug 13 14:29:22 mss121 kernel:  [<c0458c8d>]

generic_file_write_nolock+0x86/0x9a

Aug 13 14:29:22 mss121 kernel:  [<c04566fe>]
find_get_pages_tag+0x30/0x75

Aug 13 14:29:22 mss121 kernel:  [<c0457428>]

wait_on_page_writeback_range+0xa6/0xf1

Aug 13 14:29:22 mss121 kernel:  [<c04363ff>]

autoremove_wake_function+0x0/0x2d

Aug 13 14:29:22 mss121 kernel:  [<c061c408>] mutex_lock+0xb/0x19

Aug 13 14:29:22 mss121 kernel:  [<c0449c52>]
audit_syscall_entry+0x15a/0x18c

Aug 13 14:29:22 mss121 kernel:  [<c047b31b>] =
blkdev_file_write+0x1a/0x1e

Aug 13 14:29:22 mss121 kernel:  [<c0474d53>] vfs_write+0xa1/0x143

Aug 13 14:29:22 mss121 kernel:  [<c0475345>] sys_write+0x3c/0x63

Aug 13 14:29:22 mss121 kernel:  [<c0404f17>] syscall_call+0x7/0xb

Aug 13 14:29:22 mss121 kernel:  =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Aug 13 14:29:22 mss121 kernel: INFO: task mpdsk:22161 blocked for more

than 120 seconds.

        The mpdsk processes above are part of the Application which is =
a
MUMPS database (not a RDB) that does the writing of data blocks to raw
Logical Volume (no file system involved). It would have been doing
writes during both pvmoves. I know pvmove is part ofLVM2, but because =
it
worked with PowerPath and not when using Multipath and all other things
are the same is the reason I am asking the questions here.

_____

Jack Allen


------_=_NextPart_001_01CB3E42.0D8B8A0D
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>

<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7655.4">
<TITLE>pvmove hangs</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT =
FACE=3D"Calibri">Hello:</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN></P>

<P DIR=3DLTR><SPAN =
LANG=3D"en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
FACE=3D"Calibri">I posted this in the Dm-devel list yesterday =
afternoon, but so far I have not gotten any</FONT></SPAN><SPAN =
LANG=3D"en-us"> <FONT FACE=3D"Calibri">responses</FONT></SPAN><SPAN =
LANG=3D"en-us"><FONT FACE=3D"Calibri">, so I thought I would ask the =
same questions here since the command that hang is =
pvmove.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"></SPAN></P>

<P DIR=3DLTR><SPAN =
LANG=3D"en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
FACE=3D"Calibri">I had a customer that tried to do a pvmove and it =
hung. So we setup a test system to try and duplicate the problem and =
were able to.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN =
LANG=3D"en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
FACE=3D"Calibri">A little history and why I am asking the question in =
this list. The customer needed to move from an existing SAN to a new =
SAN and wanted as little as possible down time for the Application. So =
they zoned the new SAN for access by the system and then added the new =
LUNs to the existing Volume Group. Then ran the pvmove commands. It =
worked with no problem on one of the PVs, but on the second one all the =
I/O hung at the Application and any commands that access the LVM =
information such as vgdisplay.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN =
LANG=3D"en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
FACE=3D"Calibri">On our test system we only have 1 SAN (EMC CX700). We =
put X number of LUNs in a Volume Group and allocated Logical Volumes =
for the Application. Added some more LUNs to the Volume Group to =
simulate a second SAN. Started the Application with a test program to =
generate I/O.&nbsp; Ran pvmove with no problems on one PV, but on the =
second PV, it hung just like on the customer's =
system.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN =
LANG=3D"en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
FACE=3D"Calibri">The reason I am posting to this list is because the =
same type of move was done earlier on the test system running PowerPath =
and did not have any problems. The OS is Red Hat EL 5.5 32 bit. The =
same version of LVM was used on both tests. I can provide other details =
if needed.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN =
LANG=3D"en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
FACE=3D"Calibri">Below is part of the messages file when this =
happen.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"><FONT =
SIZE=3D2 FACE=3D"Arial">Aug 13 14:18:14 mss121 multipathd: dm-25: add =
map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:18:14 mss121 multipathd: dm-19: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:18:14 mss121 multipathd: dm-22: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:19:53 mss121 multipathd: dm-25: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:19:53 mss121 multipathd: dm-19: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:19:53 mss121 multipathd: dm-22: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:21:26 mss121 multipathd: dm-25: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:21:26 mss121 multipathd: dm-19: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:21:26 mss121 multipathd: dm-22: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:21:26 mss121 multipathd: dm-25: remove map =
(uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:22:47 mss121 multipathd: dm-25: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:22:47 mss121 multipathd: dm-17: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:22:47 mss121 multipathd: dm-20: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:22:47 mss121 multipathd: dm-23: add map (uevent)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel: INFO: task mpdsk:22158 blocked for =
more</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">than =
120 seconds.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel: &quot;echo 0&gt;</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">/proc/sys/kernel/hung_task_timeout_secs&quot; disables =
this message.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel: =
mpdsk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D 00000BD7&nbsp; =
1784 22158</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">22151&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
22159 22157 (NOTLB)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
f3025e04 00000082 bde60e11</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">00000bd7 f3025e50 c045d1a9 f3025e50 =
0000000a</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
f7c60000 bde67e2a 00000bd7</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">00007019 00000000 f7c6010c c8612700 =
f6ec4e40</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
00000000 00000000 00000000</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">c12b8dc0 018dc6f2 c042cbd1 f6cb3f0c =
ffffffff</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel: Call Trace:</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c045d1a9&gt;] =
__pagevec_release+0x15/0x1d</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c042cbd1&gt;] =
getnstimeofday+0x30/0xb6</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c061c156&gt;] =
io_schedule+0x36/0x59</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c04569c0&gt;] =
sync_page+0x38/0x3b</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c061c32d&gt;] =
__wait_on_bit+0x33/0x58</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0456988&gt;] =
sync_page+0x0/0x3b</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0456a48&gt;] =
wait_on_page_bit+0x5b/0x62</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c043642c&gt;] =
wake_bit_function+0x0/0x3c</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c04573cf&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">wait_on_page_writeback_range+0x4d/0xf1</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c04934a0&gt;] =
generic_osync_inode+0x93/0xbf</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0457618&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">sync_page_range_nolock+0x68/0x93</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0458930&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">generic_file_aio_write_nolock+0x71/0x83</FONT></SPAN></P>=


<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c047b301&gt;] =
blkdev_file_write+0x0/0x1e</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0458c8d&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">generic_file_write_nolock+0x86/0x9a</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c04566fe&gt;] =
find_get_pages_tag+0x30/0x75</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0457428&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">wait_on_page_writeback_range+0xa6/0xf1</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c04363ff&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">autoremove_wake_function+0x0/0x2d</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c061c408&gt;] =
mutex_lock+0xb/0x19</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0449c52&gt;] =
audit_syscall_entry+0x15a/0x18c</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c047b31b&gt;] =
blkdev_file_write+0x1a/0x1e</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0474d53&gt;] =
vfs_write+0xa1/0x143</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0475345&gt;] =
sys_write+0x3c/0x63</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0404f17&gt;] =
syscall_call+0x7/0xb</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</F=
ONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel: INFO: task mpdsk:22161 blocked for =
more</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">than =
120 seconds.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel: &quot;echo 0&gt;</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">/proc/sys/kernel/hung_task_timeout_secs&quot; disables =
this message.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel: =
mpdsk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D 00000BD7&nbsp; =
1884 22161</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">22151&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
22162 22160 (NOTLB)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
f34e2e04 00000082 baebd585</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">00000bd7 f34e2e50 c045d1a9 f34e2e50 0000000a</FONT></SPAN=
></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
f6eb1550 baec5e00 00000bd7</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">0000887b 00000000 f6eb165c c8612700 =
f723f040</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
00000000 00000000 00000000</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">c12e1f80 018dc68e c042cbd1 f6cb3bdc =
ffffffff</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel: Call Trace:</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c045d1a9&gt;] =
__pagevec_release+0x15/0x1d</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c042cbd1&gt;] =
getnstimeofday+0x30/0xb6</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c061c156&gt;] =
io_schedule+0x36/0x59</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c04569c0&gt;] =
sync_page+0x38/0x3b</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c061c32d&gt;] =
__wait_on_bit+0x33/0x58</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0456988&gt;] =
sync_page+0x0/0x3b</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0456a48&gt;] =
wait_on_page_bit+0x5b/0x62</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c043642c&gt;] =
wake_bit_function+0x0/0x3c</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c04573cf&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">wait_on_page_writeback_range+0x4d/0xf1</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c04934a0&gt;] =
generic_osync_inode+0x93/0xbf</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0457618&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">sync_page_range_nolock+0x68/0x93</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0458930&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">generic_file_aio_write_nolock+0x71/0x83</FONT></SPAN></P>=


<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c047b301&gt;] =
blkdev_file_write+0x0/0x1e</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0458c8d&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">generic_file_write_nolock+0x86/0x9a</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c04566fe&gt;] =
find_get_pages_tag+0x30/0x75</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0457428&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">wait_on_page_writeback_range+0xa6/0xf1</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c04363ff&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">autoremove_wake_function+0x0/0x2d</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c061c408&gt;] =
mutex_lock+0xb/0x19</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0449c52&gt;] =
audit_syscall_entry+0x15a/0x18c</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c047b31b&gt;] =
blkdev_file_write+0x1a/0x1e</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0474d53&gt;] =
vfs_write+0xa1/0x143</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0475345&gt;] =
sys_write+0x3c/0x63</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; [&lt;c0404f17&gt;] =
syscall_call+0x7/0xb</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:27:22 mss121 kernel:&nbsp; =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</F=
ONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel: INFO: task mpdsk:22158 blocked for =
more</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">than =
120 seconds.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel: &quot;echo 0&gt;</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">/proc/sys/kernel/hung_task_timeout_secs&quot; disables =
this message.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel: =
mpdsk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D 00000BD7&nbsp; =
1784 22158</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">22151&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
22159 22157 (NOTLB)</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
f3025e04 00000082 bde60e11</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">00000bd7 f3025e50 c045d1a9 f3025e50 =
0000000a</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
f7c60000 bde67e2a 00000bd7</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">00007019 00000000 f7c6010c c8612700 =
f6ec4e40</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
00000000 00000000 00000000</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">c12b8dc0 018dc6f2 c042cbd1 f6cb3f0c =
ffffffff</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel: Call Trace:</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c045d1a9&gt;] =
__pagevec_release+0x15/0x1d</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c042cbd1&gt;] =
getnstimeofday+0x30/0xb6</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c061c156&gt;] =
io_schedule+0x36/0x59</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c04569c0&gt;] =
sync_page+0x38/0x3b</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c061c32d&gt;] =
__wait_on_bit+0x33/0x58</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c0456988&gt;] =
sync_page+0x0/0x3b</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c0456a48&gt;] =
wait_on_page_bit+0x5b/0x62</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c043642c&gt;] =
wake_bit_function+0x0/0x3c</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c04573cf&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">wait_on_page_writeback_range+0x4d/0xf1</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c04934a0&gt;] =
generic_osync_inode+0x93/0xbf</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c0457618&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">sync_page_range_nolock+0x68/0x93</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c0458930&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">generic_file_aio_write_nolock+0x71/0x83</FONT></SPAN></P>=


<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c047b301&gt;] =
blkdev_file_write+0x0/0x1e</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c0458c8d&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">generic_file_write_nolock+0x86/0x9a</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c04566fe&gt;] =
find_get_pages_tag+0x30/0x75</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c0457428&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">wait_on_page_writeback_range+0xa6/0xf1</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c04363ff&gt;]</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">autoremove_wake_function+0x0/0x2d</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c061c408&gt;] =
mutex_lock+0xb/0x19</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c0449c52&gt;] =
audit_syscall_entry+0x15a/0x18c</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c047b31b&gt;] =
blkdev_file_write+0x1a/0x1e</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c0474d53&gt;] =
vfs_write+0xa1/0x143</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c0475345&gt;] =
sys_write+0x3c/0x63</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; [&lt;c0404f17&gt;] =
syscall_call+0x7/0xb</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel:&nbsp; =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</F=
ONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Aug 13 =
14:29:22 mss121 kernel: INFO: task mpdsk:22161 blocked for =
more</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">than =
120 seconds.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"></SPAN></P>

<P DIR=3DLTR><SPAN =
LANG=3D"en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
FACE=3D"Calibri">The mpdsk processes above are part of the Application =
which is a MUMPS database (not a RDB) that does the writing of data =
blocks to raw Logical Volume (no file system involved). It would have =
been doing writes during both pvmoves. I know pvmove is part ofLVM2, =
but because it worked with PowerPath and not when using Multipath and =
all other things are the same is the reason I am asking the questions =
here.</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT =
FACE=3D"Calibri">_____</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"><FONT FACE=3D"Calibri">Jack =
Allen</FONT></SPAN></P>

<P DIR=3DLTR><SPAN LANG=3D"en-us"></SPAN></P>

</BODY>
</HTML>
------_=_NextPart_001_01CB3E42.0D8B8A0D--
