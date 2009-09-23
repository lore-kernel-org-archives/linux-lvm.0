Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8NC7nhI002559
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 08:07:49 -0400
Received: from mail-ew0-f205.google.com (mail-ew0-f205.google.com
	[209.85.219.205])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8NC7c63023494
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 08:07:39 -0400
Received: by ewy1 with SMTP id 1so487896ewy.3
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 05:07:38 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 23 Sep 2009 14:07:37 +0200
Message-ID: <29ae894c0909230507g70719ab2ga2810256d10ae667@mail.gmail.com>
From: brem belguebli <brem.belguebli@gmail.com>
Subject: [linux-lvm] LVM mirror resync
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,


I'm trying to find an explanation on how is handled drive failure and
how to recover a LVM mirror with on disk mirror log  from this kind of
failure.


Let me explain, I have this mirrored LV composed of:

LV_mimage_0 (on /dev/mpath/mpath0p2)
LV_mimage_1 (on /dev/mpath/mpath1p2)
and
LV_mlog (on /dev/mpath/mpath0p1)

When I simulate a drive failure (echo 1 > /sys/bus/scsi/devices/
"mpath1 Lunpaths"/delete ), the PV /dev/mpath/mpath1p1 is completely
removed from the VG.
The log is also removed from the VG, though it is located on the still
present physical drive.

When disk mpath1 is back again (echo "- - -"
/sys/class/scsi_host/HOST*/scan), it appears as not belonging to any
VG:

pvs giving the following output:
...
  /dev/mpath/mpath0p1 VG   lvm2 a-    36.00M  36.00M
  /dev/mpath/mpath0p2 VG   lvm2 a-     4.95G 256.00M
  /dev/mpath/mpath1p1        lvm2 --    39.19M  39.19M
  /dev/mpath/mpath1p2        lvm2 --     4.96G   4.96G
...

LV is monitored by dmeventd.

My questions are:

1) Am I using the right method to simulate a drive failure by echoing
a scsi delete ? How would behave the scsi layer in case a disk came to
physically disappear ?

2) If the above method is correct, isn't the role of the mirror log to
keep track of region changes  in case of a drive failure to be able to
incrementally resync the mirror when the missing drive is back to
operation?
 Missing drive is not replaced, the UUID is the same, the problem
could have occured at scsi connectivity not on the physical media (SAN
failure for instance).

3) if so, why does disappear the log device from the VG though being
on a physically present device ?

4) when the missing drive is back again,
    4-1)  why does it appear as not belonging to its original VG ?

    4-2) why doesn't it get automatically resync'ed by dmeventd ? .

The recover process seems to be to reconstruct from scratch the mirror
treating the failed and back again drive as a totally new drive.

Regards
