Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6LIYxt5000945
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2010 14:35:00 -0400
Received: from mail-px0-f174.google.com (mail-px0-f174.google.com
	[209.85.212.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6LIYlWG003227
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2010 14:34:47 -0400
Received: by pxi14 with SMTP id 14so3472612pxi.33
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2010 11:34:47 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 21 Jul 2010 11:34:45 -0700
Message-ID: <AANLkTikwNhMWtusJHicMya9k5IS9geQ17ss4aHurjm4z@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd258125057bb048bea0e87
Subject: [linux-lvm] [SOLVED?] rebuilding LV ext4 filesystem
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
To: linux-lvm@redhat.com

--000e0cd258125057bb048bea0e87
Content-Type: text/plain; charset=ISO-8859-1

Okay, I finally got to do what Stuart D. Gathman suggested. And it worked,
sort of.

The problem: the first PV in my LV started to die, and trashed a big portion
of the beginning of the physical drive - including the partition table,
partition info, and ext4 file structure. All I wanted at that point was to
recover what was on the rest of the other PVs in the LV. But nothing could
interpret whatever data was left. e2fsck, et al, all said they could not
find a superblock, even when I tried ones on the other PVs.

Since that original drive was really dying (SMART was spurting out messages
about that), it was somewhat difficult to read anything off of it. But
Stuart did recommend "dd_rescue" to move whatever it could from the dying
drive to a new drive. Which I did. Turns out that most of the access
problems were at the beginning of the drive (why I don't know). So I
basically copied in reverse, starting at the end of the drive. I did this
mainly hoping to find a valid superblock that I could use to bring back up
the LV and run e2fsck on it.

Long story short: dd_rescue did just that. I found a superblock, and ran
e2fsck to fix all of the problems.

NOW: I am left with a clean ext filesystem, but with about 300GB in
lost+found, and not other files. Just guessing on that amount, since that is
how much was on the LV before the crash. So the next logical and obvious
(and desperate) question is: how to I restore all (or any) of the files
under lost+found?

Most of them (that I am interested in)were either image files (jpg, png,
bmp), ISO images (DVD, CD), music files (mp3, flac, etc), and a few MS
executables. Is there a utiliity that can help restore these files, maybe
scan the lost+found files for these types?

Thanks to all for their help. I hope none of you ever have to go through
this yourself :-).

ken

--000e0cd258125057bb048bea0e87
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Okay, I finally got to do what Stuart D. Gathman suggested. And it worked, =
sort of.<br><br>The problem: the first PV in my LV started to die, and tras=
hed a big portion of the beginning of the physical drive - including the pa=
rtition table, partition info, and ext4 file structure. All I wanted at tha=
t point was to recover what was on the rest of the other PVs in the LV. But=
 nothing could interpret whatever data was left. e2fsck, et al, all said th=
ey could not find a superblock, even when I tried ones on the other PVs.<br=
>
<br>Since that original drive was really dying (SMART was spurting out mess=
ages about that), it was somewhat difficult to read anything off of it. But=
 Stuart did recommend &quot;dd_rescue&quot; to move whatever it could from =
the dying drive to a new drive. Which I did. Turns out that most of the acc=
ess problems were at the beginning of the drive (why I don&#39;t know). So =
I basically copied in reverse, starting at the end of the drive. I did this=
 mainly hoping to find a valid superblock that I could use to bring back up=
 the LV and run e2fsck on it.<br>
<br>Long story short: dd_rescue did just that. I found a superblock, and ra=
n e2fsck to fix all of the problems.<br><br>NOW: I am left with a clean ext=
 filesystem, but with about 300GB in lost+found, and not other files. Just =
guessing on that amount, since that is how much was on the LV before the cr=
ash. So the next logical and obvious (and desperate) question is: how to I =
restore all (or any) of the files under lost+found?<br>
<br>Most of them (that I am interested in)were either image files (jpg, png=
, bmp), ISO images (DVD, CD), music files (mp3, flac, etc), and a few MS ex=
ecutables. Is there a utiliity that can help restore these files, maybe sca=
n the lost+found files for these types? <br>
<br>Thanks to all for their help. I hope none of you ever have to go throug=
h this yourself :-).<br><br>ken<br><br><br><br>

--000e0cd258125057bb048bea0e87--
