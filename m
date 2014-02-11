Received: from [10.34.131.133] (dhcp131-133.brq.redhat.com [10.34.131.133])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1BA6Rgc010606
	for <linux-lvm@redhat.com>; Tue, 11 Feb 2014 05:06:28 -0500
Message-ID: <52F9F623.1090205@redhat.com>
Date: Tue, 11 Feb 2014 11:06:27 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CA+VDVVVtkYVDNJP4f=oUiDTzhht60t-nDM3u5g5wezzv=tvzYg@mail.gmail.com>
In-Reply-To: <CA+VDVVVtkYVDNJP4f=oUiDTzhht60t-nDM3u5g5wezzv=tvzYg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cancelling snapshot merge
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

Dne 10.2.2014 14:14, Alexander Meshcheryakov napsal(a):
> Hello,
>
> I had created snapshot of my /var logical volume a while ago and recently It
> occured to me that I don't need saved state anymore and I would like to
> reclaim disk space. But I have issued wrong lvconvert --merge command by
> mistake instead of proper lvremove.
>
> $ sudo lvconvert --merge VolGroup00/var_snap0
>    Can't merge over open origin volume
>    Merging of snapshot var_snap0 will start next activation.
>
> I have figured out at this point that I made mistake. Luckily merge is
> postponed as volume is used (mounted) now. But how do I prevent merge from
> running upon next reboot? Here is what I have tried:
>
> $ sudo lvremove VolGroup00/var_snap0
>    Can't remove merging snapshot logical volume "var_snap0"
>
> $ sudo lvchange -an VolGroup00/var_snap0
> Change of snapshot var_snap0 will also change its origin LogVol01. Proceed?
> [y/n]: n
>    Logical volume var_snap0 not changed.
>
>
> I even could not create snapshot of current state to roll back to it after merge
>
>
> $ sudo lvcreate --size 2G --snapshot -n var_snap1 /dev/mapper/VolGroup00-LogVol01
>
>    Snapshots of an origin that has a merging snapshot is not supported
>
>
> Is there a way to cancel postponed snapshot merge?


vgcfgrestore  - you could go via archive to the previous state of metadata.

There is no support for merge aborting - since it might have other 'side' 
effects on metadata.

If you know what you are doing - vgcfgrestore is your rescue tool.

Zdenek
