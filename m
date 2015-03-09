Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t29GZ2x5000357
	for <linux-lvm@redhat.com>; Mon, 9 Mar 2015 12:35:02 -0400
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t29GZ0AU010523
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 9 Mar 2015 12:35:01 -0400
Received: by igal13 with SMTP id l13so22874370iga.0
	for <linux-lvm@redhat.com>; Mon, 09 Mar 2015 09:35:00 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 9 Mar 2015 17:35:00 +0100
Message-ID: <CAE8gLhnhRM+Lvna8qHZ27XYDS_A+HsDfi_7o18KNAVh5fmgDcQ@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Subject: [linux-lvm] Can't split VG which contains a thin pool
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

I was trying to split a VG which has a thin pool in it. All data of
the thin pool was residing a PV which stays in the VG. The PV I
intended to split down only contained one LV which had no relation to
the thin pool whatsoever.

When I tried to use vgsplit, first it was telling me to deactivate the
thin pool, and when I did that, I got this:

root@thinkpad:~# vgsplit --verbose thinkvg adatavg /dev/sdb1
    Checking for new volume group "adatavg"
    Checking for volume group "thinkvg"
    Archiving volume group "thinkvg" metadata (seqno 143).
    Writing out updated volume groups
    Archiving volume group "adatavg" metadata (seqno 0).
  LV thinpool: segment 1 has inconsistent LV area 0
  Internal error: LV segments corrupted in thinpool.

After playing with it for a time with no success, I decided to
forcefully remove the PV from the VG, and just disconnected the drive.
On the origin machine, I could use "vgreduce --removemissing --force
thinkvg" to get rid of the disconnected PV without any problem. Then I
moved the disconnected PV to another system, which is now missing the
other PV. I also tried vgreduce to get rid of the other PV, but I got
this:

root@blackpad:~# vgreduce --removemissing --force thinkvg
  Couldn't find device with uuid wlyc2h-ob6Y-zZae-SIo1-JhCn-aKwG-eq2fn2.
  Removing partial LV thinpool.
  Cannot activate thinkvgthinpool_tmeta: pool incomplete.
  Failed to update pool thinkvg/thinpool.

It seems LVM can't really handle to split or reduce VGs which has thin pools.

Any suggestions what should I do now to remove the missing PV on the other host?

  LVM version:     2.02.111(2) (2014-09-01)
  Library version: 1.02.90 (2014-09-01)
  Driver version:  4.29.0


Regards,
MegaBrutal
