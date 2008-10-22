Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9MJbeQ3008548
	for <linux-lvm@redhat.com>; Wed, 22 Oct 2008 15:37:40 -0400
Received: from mail-gx0-f15.google.com (mail-gx0-f15.google.com
	[209.85.217.15])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id m9MJbUU9010769
	for <linux-lvm@redhat.com>; Wed, 22 Oct 2008 15:37:30 -0400
Received: by gxk8 with SMTP id 8so26900gxk.3
	for <linux-lvm@redhat.com>; Wed, 22 Oct 2008 12:37:30 -0700 (PDT)
Message-ID: <61f78fbe0810221237u7ed9ad8cjf551936f605c7061@mail.gmail.com>
Date: Wed, 22 Oct 2008 15:37:29 -0400
From: "Larry K" <lunchtimelarry@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_20246_6901391.1224704249653"
Subject: [linux-lvm] Need help with lost XFS file system
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
To: linux-lvm@redhat.com

------=_Part_20246_6901391.1224704249653
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have an LVM2 xfs file system that spans two partitions:  /dev/sda4
(150GB)  and /dev/sdb1 (300GB).   /dev/sda also hosts my O/S (/dev/sda1 is
/boot and /dev/sda2 is root).

Apparently, something went amiss with the /dev/sda disk, and the first
indication was a hung system, followed by the loss of certain O/S files in
the /lib directory following a reboot.  I was hopeful that the damage was
limited to the O/S files, so, after much troubleshooting and fschk attempts,
I just reinstalled the O/S.  After the O/S reinstall, I was finally able to
reboot the machine and try to run an xfs_check and xfs_repair -L.  Anyway,
vgscan, pvscan, and lvscan all look good.  Nothing seems wrong from this
standpoint.  The file system mounts, but it takes forever to do so.  And
when I try to ls the files, I get an Input/output error.  If I unmount and
run an xfs_repair, I get a bad magic number or some such message.

Even if /dev/sda4 is a total loss, I am pretty certain that all the files
stored on the  /dev/sdb1 are in tact, but the xfs file system just won't
mount properly.  Is there anything I can do, or am I just screwed?  Of
course, if I had a backup I would just use that, but there is none.

Larry

------=_Part_20246_6901391.1224704249653
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have an LVM2 xfs file system that spans two partitions:&nbsp; /dev/sda4
(150GB)&nbsp; and /dev/sdb1 (300GB). &nbsp; /dev/sda also hosts my O/S (/dev/sda1
is /boot and /dev/sda2 is root).&nbsp; <br><br>Apparently, something went
amiss with the /dev/sda disk, and the first indication was a hung
system, followed by the loss of certain O/S files in the /lib directory
following a reboot.&nbsp; I was hopeful that the damage was limited to the
O/S files, so, after much troubleshooting and fschk attempts, I just
reinstalled the O/S.&nbsp; After the O/S reinstall, I was finally able to
reboot the machine and try to run an xfs_check and xfs_repair -L.&nbsp;
Anyway, vgscan, pvscan, and lvscan all look good.&nbsp; Nothing seems wrong
from this standpoint.&nbsp; The file system mounts, but it takes forever to
do so.&nbsp; And when I try to ls the files, I get an Input/output error.&nbsp;
If I unmount and run an xfs_repair, I get a bad magic number or some
such message.<br>
<br>Even if /dev/sda4 is a total loss, I am pretty certain that all the
files stored on the&nbsp; /dev/sdb1 are in tact, but the xfs file system
just won&#39;t mount properly.&nbsp; Is there anything I can do, or am I just
screwed?&nbsp; Of course, if I had a backup I would just use that, but there
is none.<br>
<br>Larry

------=_Part_20246_6901391.1224704249653--
