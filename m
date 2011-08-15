Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7F9YUjp002836
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2011 05:34:30 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7F9YUbw011204
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2011 05:34:30 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.sc.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p7F9YKxs019966
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2011 02:34:22 -0700
Message-ID: <4E48E81C.9040504@tlinx.org>
Date: Mon, 15 Aug 2011 02:34:20 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dmsetup -split is buggy
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




I'm told that /dev/VG/LV is the official LVM syntax for a devname,

so I passed a /dev/VG/LV, name to LVM, and it mangled the LV name,
splitting it into a LVLayer.




I gave it:

/dev/Home+Space/Home-2011.08.08-03.29.58


Which corresponds to a /home/snapdir/@GMT-2011.08.08-03.29.58
(@GMT-date-time is a required name format), so my volumes
for such snapdirs have the base-LV and the date-time.


There is nothing in the lvm spec that or device name spec, that says
"-" is to be interpreted as some layer.... 

The problem is that when this routine gets a device name, it might be
/dev/mapper/<encoded value>
or /dev/VG/LV

dmsetup splitname, should, I believe, know how to split
names in the only 'supported' name format  i.e. /dev/VG/LV -- but
instead, it's treating it as though it were under /dev/mapper and using 
that for
decoding...

I can hack around the bug, but its surprising that dmsetup doesn't support
the only official LVM names (/dev/VG/LV).

Is this bug a 'feature', or is it something that should be fixed?
