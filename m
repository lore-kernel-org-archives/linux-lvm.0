Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1BKbxO19444
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 15:37:59 -0500
Received: from ns3.linuxquebec.com (ns3.linuxquebec.com [64.40.111.7])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1BKbrFF006009
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 15:37:53 -0500
Received: from ns2.linuxquebec.com (unknown [64.18.178.21])
	by ns3.linuxquebec.com (Postfix) with ESMTP id 49DF52B8032
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 15:45:56 -0500 (EST)
Received: from aragorn.intranet (unknown [10.10.1.116])
	by ns2.linuxquebec.com (Postfix) with ESMTP id 15E6713ED8
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 15:33:59 -0500 (EST)
Subject: RE: [linux-lvm] waah waah - disaster recovery
From: Paul Pianta <pantz@lqt.ca>
In-Reply-To: <0B834CEE3453504B82AB821DFB7047C1FF0487@enyc11p32003.corpny.csfb.com>
References: <0B834CEE3453504B82AB821DFB7047C1FF0487@enyc11p32003.corpny.csfb.com>
Date: Fri, 11 Feb 2005 15:37:39 -0500
Message-Id: <1108154259.4699.45.camel@aragorn.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2005-02-11 at 19:43 +0000, Rosenstrauch, David wrote:
> 
> > Does anyone have any ideas on how I might be able to restore/mount
> > the /dev/md2 partition - even if it is just enough to copy the data
> > elsewhere??
> > 
> > thanks
> > 
> > pantz
> 
> Basically just dd the data from the partition on the bad disk to the partition
> on the new disk (e.g., "dd if=/dev/hda2 of=/dev/hdb3").  Theoretically, you've
> now got a copy of the original partition, and theoretically LVM should be able
> to use it just like the old one.  Do fsck's on all the relevant partitions
> and/or LV's once you're done with this, as there could be glitches that
> occurred.

Wow - thanks for the quick responses guys! Wouldn't have anything to do
with mooching about on a Friday afternoon, catching up on emails coz the
work you have to do can wait until Monday ;)

I am attempting a bit of a combination of the two suggestions.

Editing /etc/fstab to not mount the dodgy partition got me to boot into
the system ok - but running fsck gives LOTS of bad looking errors and it
just loops on the same bad sector and I have to reboot the machine to
get out of it.

I am now dd'ing the dodgy partition to a new drive that I installed in
the machine.

My question now is a bit off topic but what would be the recommended way
of dd'ing my corrupt /dev/hdc5 partition to the new /dev/hda drive. 

- Should I have created a partition on /dev/hda exactly the same size
as /dev/hdc5 and then done a 'dd if=/dev/hdc5 of=/dev/hda1'?

- Will 'dd if=/dev/hdc5 of=/dev/hda' give me something mountable later?

- Should I have dd'ed the partition to a file in a partition /dev/hda1
on the new disk and loop mounted it after?

Sorry for being OT but I am just interested ...

thanks

pantz
