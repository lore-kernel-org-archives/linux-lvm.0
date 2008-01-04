Received: from [172.16.45.118] (dhcp-118.brisbane.redhat.com [172.16.45.118])
	by pobox.brisbane.redhat.com (8.13.1/8.13.1) with ESMTP id
	m048If2G014875
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 18:18:41 +1000
Message-ID: <477DEB7B.7050100@gmail.com>
Date: Fri, 04 Jan 2008 18:16:59 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to 'copy' a volume?
References: <477D7E55.3050003@soe.ucsc.edu>
In-Reply-To: <477D7E55.3050003@soe.ucsc.edu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Erich Weiler wrote:
> Greetings all-
> 
> I have a problem I'm trying to solve, was hoping someone would know how 
> to get around it...
> 
> I have a 2TB volume group, and one 500GB volume in it.  There is a Xen 
> VM in that volume group.  What I'd like to do is 'copy' the volume and 
> name it something else so I can use it as a 'template' for other VMs.
> 
> I know that LVM has the 'snapshot' capability.  But this doesn't look 
> like it's what I need, as I don't want my duplicate volume to have any 
> affiliation with the original at all.  I actually want to duplicate VM 
> to take up just as much space as the first and be completely independent 
> of any changes on the first.  Is there a way of achieving this?  Could I 
> maybe simply make sure the volume is unmounted and not in use, then copy 
> the /dev/mapper/myvolume file to something else?  I bet it's more 
> involved than that...  :)

I find 'dd' is the simplest way of doing this. Unmount the volume, 
create a new logical volume of equal or greater size, then 'dd' from one 
to the other:

lvcreate -L 500G -n clone volgroup00
dd if=/dev/volgroup00/original of=/dev/volgroup/clone

Rather than copying VMs I snapshot them. I create a template system, 
create a snapshot of it, then modify the VMs config so it uses the 
snapshot as its disk (so the original is unmodified). If I need another 
copy of the VM its only a matter of creating another snapshot of the 
template LV, then copying and modifying the config. I usually set the 
extent size low so that modifications within the VMs don't chew up lots 
of space too.

--Dave
