Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r93JVjqG021471
	for <linux-lvm@redhat.com>; Thu, 3 Oct 2013 15:31:45 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r93JViCs029375
	for <linux-lvm@redhat.com>; Thu, 3 Oct 2013 15:31:44 -0400
Received: from [192.168.4.12] (Athenae [192.168.4.12])
	by Ishtar.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	r93JVf3Z093062
	for <linux-lvm@redhat.com>; Thu, 3 Oct 2013 12:31:43 -0700
Message-ID: <524DC61D.9060704@tlinx.org>
Date: Thu, 03 Oct 2013 12:31:41 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] I/O accounting by partition: "-cow" & "-real" map to
	base or snapshot or ???
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm trying to display I/O data from /proc/diskstats
for regular, non-thin partitions, by lv_name.
"-cow" and "-real" bit confusing.  When I look at the
output of "dmsetup ls"  different minor devs for:
name                  minor
Home-real               2
Home                    3
Home-snapshot           5
Home-snapshot-cow       26

(snapshot=date+time snapshot was started)

I regularly see I/O on 'Home' & 'Home-real'.

write  =  "dd if=/dev/zero of=1G bs=1G count=1 oflag=direct"

A 1G write to Home shows 2GB I/O on 2 partitions:
  Home: 1G read
  Home-real: 1G read


Is this being double reported?  (i.e.
I should ignore one?)   Confusing is that they don't always
show the same amount of I/O.

A write to the same filename again showed 4GB I/O on 3 partitions:
  Home: 1G read + 1G write
  Home-real: 1G write
  Home-snap-cow: 1G write

Is there some read is copying off the
first copy to the "cow" partition? (with a 1G duplication somewhere?).

If I "overwrite"
   (dd if=/dev/zero of=1G bs=1G count=1 oflag=direct conv=nocreat)
I see the same numbers as on the initial file creation (to
both base and the "-real" partitions).

Could anyone clarify what's going on in the above scenarios?

(i.e. I would find each write being multiplied by 2 a bit
far fetched in terms of disk-BW;  Multiplied by 4... even less
likely I'd think...?  Thanks for any light-shed...;-)
