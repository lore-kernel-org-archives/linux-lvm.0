Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAHEXLPF002105
	for <linux-lvm@redhat.com>; Fri, 17 Nov 2006 09:33:21 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAHEXDJG007420
	for <linux-lvm@redhat.com>; Fri, 17 Nov 2006 09:33:18 -0500
Received: from wolverine (unknown [192.168.1.127])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 5138B12EE1
	for <linux-lvm@redhat.com>; Fri, 17 Nov 2006 14:32:46 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Contents of read-only LVM snapshot change when bothLV
	and SNAP are Read-Only - SOLVED
Date: Fri, 17 Nov 2006 14:34:35 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20061114220931.C3F1B12EDE@bluewhale.planbit.co.uk>
Message-Id: <20061117143246.5138B12EE1@bluewhale.planbit.co.uk>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi All,

The problem was nothing to do with LVM but was a RAID error.  I moved the two disks in the RAID-1 array between three different
machines - two were identical and one was a totally different motherboard.  The problem occurred on all of the machines so I tried
removing one of the disks and brought the array up in degraded mode.  When I re-ran the test, I consistently received the first data
sequence.  I powered off the machine and swapped the disks.  I then powered the machine up so that it was running off the other
disk, again in degraded mode.  When I re-ran the test, I consistently received the other data sequence.

What it looks like is happening is that, at some point in time, a write to the RAID array failed and wrote slightly different data
to one of the disks or one of the disks generated a bit error.  Since I was running in RAID-1 and the disks were not failing with a
hardware error, the MD driver seemed happy to return data from whichever disk completed the read first.  Since the disks were
identical, it was pretty random which one would get the data back first, hence the apparent inconsistency.

I don't know why it seemed that the main disk was stable but the snapshot wasn't, but I suspect that this is again down to the race
condition or some caching somewhere.

Thank you to everyone in the LVM team who has helped investigate this for me - I apologise for wasting your time with a false goose
chase.

BR,

Roger
