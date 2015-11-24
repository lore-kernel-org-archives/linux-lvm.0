Received: from [10.34.130.160] (dhcp130-160.brq.redhat.com [10.34.130.160])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAOBKDRP017367
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2015 06:20:14 -0500
References: <CAO_L6qELj-F7Z3-MqM=_mhwmTnHEA1ZYe=Cc72cRGNCZ=h3K4A@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <565447ED.4010808@redhat.com>
Date: Tue, 24 Nov 2015 12:20:13 +0100
MIME-Version: 1.0
In-Reply-To: <CAO_L6qELj-F7Z3-MqM=_mhwmTnHEA1ZYe=Cc72cRGNCZ=h3K4A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Request for Feature: Disk space usage by a LVM
	snapshot
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

Dne 23.11.2015 v 17:47 shankha napsal(a):
> Hi,
>
> Goal: We are trying to calculate actual disk usage of  LVM Snapshots
> created from a thin logical volume.
>
> Method:
> Currently we use thin_dump to dump metadata information of all the LVM
> snapshots and logical volumes.
>
> Check what are the blocks unique to the snapshot and that gives you
> the size of the snapshot.
>
> The problem is while one is dumping data on the snapshot the metadata
> information which you get from thin dump is incorrect. That is what I noticed.
> Sometimes the tool will fail and it will ask you to repair your lvm metadata.
>
> ---
> Is there a way we can have a separate tool which will give us the disk
> usage of a LVM Snapshot.
>

Hi

Your most obvious bug here is - you try to use metadata from 'active' 
thin-pool which you cannot (i.e. accessing  /dev/mapper/vg-pool-tmeta -
which really IS private volume)

For now you need to take metadata snapshot (via dmsetup message - see kernel 
target doc) as LVM2 doesn't yet expose this to user.

And in fact you should open  "RFE" BZ entry to enhance thin tools to provide 
you this needed info - since doing that on your own is just time waste,
as tools may easily calc this for you....

Zdenek
