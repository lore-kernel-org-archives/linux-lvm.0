Received: from [10.34.130.169] (dhcp130-169.brq.redhat.com [10.34.130.169])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5L97Jhj019870
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2016 05:07:20 -0400
References: <5768578E.2010608@windriver.com>
	<CAFTDQfCQpX18TEnu3i4BwnPuzn_ZyY=b3JJ_qWC2EzE3309wqA@mail.gmail.com>
	<576865BC.4020400@windriver.com> <57687182.8030309@windriver.com>
	<57687891.1090001@windriver.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4094fb9b-01d7-8358-8a91-fa65719af0e4@redhat.com>
Date: Tue, 21 Jun 2016 11:07:19 +0200
MIME-Version: 1.0
In-Reply-To: <57687891.1090001@windriver.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] what creates the symlinks in /dev/<volgroup> ?
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

Dne 21.6.2016 v 01:13 Chris Friesen napsal(a):
> It appears that "vgscan --mknodes" also creates this symlink, and creates it
> pointing to /dev/mapper/<name> instead of to /dev/dm-X like udev does.
>
> controller-1:/dev# vgscan -v --mknodes
>     Wiping cache of LVM-capable devices
>     Wiping internal VG cache
>   Reading all physical volumes.  This may take a while...
>     Using volume group(s) on command line.
>   Found volume group "nova-local" using metadata type lvm2
>   Found volume group "cgts-vg" using metadata type lvm2
>   Found volume group "cinder-volumes" using metadata type lvm2
>     Using logical volume(s) on command line.
>   The link /dev/cinder-volumes/cinder-volumes-pool should have been created by
> udev but it was not found. Falling back to direct link creation.
>
> controller-1:/dev# ls -l /dev/cinder-volumes/
> total 0
> lrwxrwxrwx 1 root root  7 Jun 20 22:43 anchor-lv -> ../dm-9
> lrwxrwxrwx 1 root root 49 Jun 20 23:09 cinder-volumes-pool ->
> /dev/mapper/cinder--volumes-cinder--volumes--pool
>
>
> This is a bad thing, because running the above or "vgmknodes" and then running
> "vgchange -an cinder-volumes" will leave the /dev/cinder-volumes directory
> with a dangling symlink in it.
>
> This in turn breaks /usr/lib/ocf/resource.d/heartbeat/LVM, which (perhaps
> erroneously) uses the existence of a non-empty /dev/<volume_group> directory
> as a test to see if the volume group is active or not.
>


This whole thread is presentint  one continues sets of bugs and misunderstandings.


On modern Linux system - it should be ONLY udev to create any links in /dev 
dir. So  lvm2 does not create ANY links unless forced to do.

So the clear answer here is   'it is udev rule that creates links'


Now the second part - you system is likely misconfigured.
It's admin responsibility to filter out devices in a way lvm2 does not get any 
duplicates.  If the same device (same UUID) is seen multiple times,
lvm2 has no way to know which of them is the right one to use.

Since you have not even shown the version of lvm2 in use and whather lvmetad 
is in use - there is no way to give you any more hints...

Regards

Zdenek
