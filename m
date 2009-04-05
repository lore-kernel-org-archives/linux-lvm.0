Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n35H68XG017175
	for <linux-lvm@redhat.com>; Sun, 5 Apr 2009 13:06:08 -0400
Received: from smtp168.iad.emailsrvr.com (smtp168.iad.emailsrvr.com
	[207.97.245.168])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n35H5p9s018464
	for <linux-lvm@redhat.com>; Sun, 5 Apr 2009 13:05:51 -0400
Message-ID: <49D8E4EE.3020703@traversetechnologies.com>
Date: Sun, 05 Apr 2009 13:05:50 -0400
From: Miles Fidelman <mfidelman@traversetechnologies.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] progress, but... - re. fixing LVM/md snafu
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: debian-user <debian-user@lists.debian.org>, linux-raid@vger.kernel.org, linux-lvm@redhat.com

Hello again Folks,

So.. I'm getting closer to fixing this messed up machine.

Where things stand:

I have root defined as an LVM2 LV, that should use /dev/md2 as it's PV.
/dev/md2 in turn is a RAID1 array built from /dev/sda3 /dev/sdb3 and 
/dev/sdc3

Instead, LVM is reporting: "Found duplicate PV 
2ppSS2q0kO3t0tuf8t6S19qY3ypWBOxF: using /dev/sdb3 not /dev/sda3"
and the /dev/md2 is reporting itself as inactive (cat /proc/mdstat) and 
active,degraded (mdadm --detail)

---
I'm guessing that, during boot:

- the raid array failed to start
- LVM found both copies of the PV, and picked one (/dev/sdb3)
- everything then came up and my server is humming away

but: the md array can't rebuild because the most current device in it is 
already in use

so...  I'm looking for the right sequence of events, with the minimum 
downtime to:

1. stop changes to /dev/sdb3 (actually, to / - which complicates things)
2. rebuild the RAID1 array, making sure to use /dev/sdb3 as the starting 
point for current data
3. restart in such a way that LVM finds /dev/md2 as the right PVM 
instead of one of its components

Each of these is just tricky enough that I'm sure there are lots of 
gotchas to watch out for.

So.. any suggestions?

Thanks very much,

Miles Fidelman
