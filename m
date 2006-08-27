Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7R5KkQE001827
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 01:20:46 -0400
Received: from smtp-send.myrealbox.com (smtp-send.myrealbox.com
	[151.155.5.143])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7R5KjWe002709
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 01:20:46 -0400
Message-Id: <7.0.1.0.2.20060827131640.00fdf818@myrealbox.com>
Date: Sun, 27 Aug 2006 13:20:26 +0800
From: Jim Morgan <peripatetic@myrealbox.com>
Subject: Re: [linux-lvm] Best way to image devices in an LVM environment
In-Reply-To: <20060827044208.GL1011@strugglers.net>
References: <20060827044208.GL1011@strugglers.net>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

At 27/08/2006 12:42, you wrote:
>So how would you accomplish the task of replacing sda and sdb with
>larger disks in the least amount of effort?  Downtime is not a
>problem, taking backups of the data is not a problem, booting off a
>live cd is not a problem; the goal is to find the least
>labour-intensive way to do this.

As I understand it -- and as I've proved before in this list, my 
understanding is fundamentally flawed :-) -- there is a way to do this.

Basically you have to force one disk to fail using the raid 
administration software. You then remove the disk, replace it with 
the bigger disk, and rebuild it from the first one. The partition 
sizes may need adjusting. Then you force the other disk to fail, and 
replace it with the larger one, and then rebuild it from the other large disk.

Hopefully someone can flesh this out for me, or you may now have a 
starting point for some googling.

Jim
