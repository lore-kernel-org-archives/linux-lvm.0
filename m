Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5A5KF012039
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 01:20:15 -0400
Subject: Re: [linux-lvm] software raid or lvm?
References: <40C48905.80608@blocked.name> <20040607153809.GM31405@kluge.net>
	<40C4B0AF.9030007@blocked.name>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 10 Jun 2004 07:19:48 +0200
In-Reply-To: <40C4B0AF.9030007@blocked.name>;
	from philip on Mon, 07 Jun 2004 20:15:11 +0200
Message-ID: <m2fz94t2ff.fsf@isnogud.escape.de>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

philip <mail@blocked.name> writes:

> so i've to use software raid and i didn't find the way how to put
> lvm on top of software raid. or how can i do it?

You can do software RAID on your drives, which gives you a device like
/dev/md0.  To put LVM on top of software RAID you create a phyiscal
volume in /dev/md0 (or several PVs in /dev/md<n>), create a volume
group from these PVs, etc.

> however, in suse admin guide is written about lvm: 'several hard disks
> can be used with improved performance in the raid0 (striping) mode.'
> any idea? can i use lvm as raid0?

You can do software RAID0 and LVM on top of it as described above.
However, LVM can also do striping over PVs of one VG, so for striping
you don't need software RAID, but can do LVM directly on your drives.


urs
