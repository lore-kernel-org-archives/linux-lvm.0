Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1QDm8819919
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2004 08:48:08 -0500
Received: from isbox.insidesystems.net (verbotenplanet.net [209.123.232.30])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1QDm7b23325
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2004 08:48:07 -0500
Received: from [65.204.53.10] (helo=grayskies.net)
	by isbox.insidesystems.net with asmtp (Exim 4.30; FreeBSD)
	id 1AwLry-0005XF-LR
	for linux-lvm@redhat.com; Thu, 26 Feb 2004 08:48:06 -0500
Message-ID: <403DF916.9060808@grayskies.net>
From: David Powers <david@grayskies.net>
MIME-Version: 1.0
References: <2F75AEE4E86FDE44BF97709D289BAA7C719649@vega.voltaire.com>
In-Reply-To: <2F75AEE4E86FDE44BF97709D289BAA7C719649@vega.voltaire.com>
Content-Type: multipart/alternative;
 boundary="------------090007070109000506020201"
Subject: [linux-lvm] snapshots with XFS and 2.6 kernel
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 26 08:46:05 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------090007070109000506020201
Content-Type: text/plain; charset=windows-1255; format=flowed
Content-Transfer-Encoding: 7bit

I was attempting to implement a quick snapshot backup solution using 
lvm2, XFS, and snapshots on a 2.6 kernel.  After some very odd hangs I 
started hunting around in the lists and came across some posts that 
snapshots were not yet properly implemented in 2.6.  These were from a 
few months ago and a quick scan of the lvm2 tarball (in particular 
WHATS_NEW and README) doesn't seem to indicate that snaphots should be 
avoided.  So the question is, are snapshots usable?  And if they aren't 
where would I find more current information about when they will be?  as 
it stands now creating a snapshot tends to produce:

disk1 snapshots # lvcreate -L5G -nsnaptest -s /dev/filestore/archive
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'filestore-snaptest'.
  Problem reactivating origin archive

an lvscan afterwards shows the snapshot:

disk1 snapshots # lvscan
  ACTIVE   Original '/dev/filestore/archive' [60.00 GB] next free (default)
  ACTIVE            '/dev/filestore/groups' [50.00 GB] next free (default)
  ACTIVE            '/dev/filestore/personal' [50.00 GB] next free (default)
  ACTIVE   Snapshot '/dev/filestore/snaptest' [5.00 GB] next free (default)

but the device isn't actually created and it takes hard rebooting and a 
lot of fiddling and poking to delete it.  Any help or insight is 
appreciated.

-David

--------------090007070109000506020201
Content-Type: text/html; charset=windows-1255
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content=3D"text/html;charset=3Dwindows-1255"
 http-equiv=3D"Content-Type">
  <title></title>
</head>
<body>
<small><font face=3D"Helvetica, Arial, sans-serif">I was attempting to
implement a quick snapshot backup solution using lvm2, XFS, and
snapshots on a 2.6 kernel.=A0 After some very odd hangs I started hunting=

around in the lists and came across some posts that snapshots were not
yet properly implemented in 2.6.=A0 These were from a few months ago and
a quick scan of the lvm2 tarball (in particular WHATS_NEW and README)
doesn't seem to indicate that snaphots should be avoided.=A0 So the
question is, are snapshots usable?=A0 And if they aren't where would I
find more current information about when they will be?=A0 as it stands
now creating a snapshot tends to produce:<br>
<br>
disk1 snapshots # lvcreate -L5G -nsnaptest -s /dev/filestore/archive <br>=

=A0 device-mapper ioctl cmd 9 failed: Invalid argument<br>
=A0 Couldn't load device 'filestore-snaptest'.<br>
=A0 Problem reactivating origin archive<br>
<br>
an lvscan afterwards shows the snapshot:<br>
<br>
disk1 snapshots # lvscan<br>
=A0 ACTIVE=A0=A0 Original '/dev/filestore/archive' [60.00 GB] next free
(default)<br>
=A0 ACTIVE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 '/dev/filestore/groups' [50.0=
0 GB] next free
(default)<br>
=A0 ACTIVE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 '/dev/filestore/personal' [50=
=2E00 GB] next free
(default)<br>
=A0 ACTIVE=A0=A0 Snapshot '/dev/filestore/snaptest' [5.00 GB] next free
(default)<br>
<br>
but the device isn't actually created and it takes hard rebooting and a
lot of fiddling and poking to delete it.=A0 Any help or insight is
appreciated.<br>
<br>
-David<br>
</font></small>
</body>
</html>

--------------090007070109000506020201--
