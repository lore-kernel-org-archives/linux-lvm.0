Received: from [10.40.200.28] (ovpn-200-28.brq.redhat.com [10.40.200.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u39Hq81l023635
	for <linux-lvm@redhat.com>; Sat, 9 Apr 2016 13:52:09 -0400
References: <20160409101245.GB31040@nicku.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57094147.202@redhat.com>
Date: Sat, 9 Apr 2016 19:52:07 +0200
MIME-Version: 1.0
In-Reply-To: <20160409101245.GB31040@nicku.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Shrinking LVM partition at beginning
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

Dne 9.4.2016 v 12:12 Nick Urbanik napsal(a):
> Dear Folks,
>
> I want to shrink an LVM partition and expand a preceding, non-LVM
> partition.  The LVM partition contains three logical volumes.  I
> shrank the larger, middle home volume at the volume's end successfully
> with a command something like this:
>
> sudo lvresize --verbose --resizefs -L -40G /dev/fedora/home
>
> and then used pvmove to move all the pysical extents towards the end
> of the disk, using some commands something like this:
>
> sudo pvmove --alloc anywhere /dev/sda6:24387-34626 /dev/sda6:34627-44866
>
> until all the extents are towards the end of the disk, and there are
> 10240 unused at the beginning of the volume.
>
> So: can anyone suggest how I can shrink the volume group by that 10240
> physical extents, so that I can shrink the partition, and expand the
> previous partition?

Hi

Unsupported - requires very good understanding about lvm2 metadata format
and very good precision in all calculations if you would do it by hand...

Basically you need to recreate PV header at different position,
and recompute all 'PV' extents in use.

IMHO easiest&safest for a normal user is to just 'copy' disk elsewhere, 
reformat with new layout and copy data back (yeah - takes some time,
but with significantly less probability of data loose...)

lvm2 is not meant to be used with other volume manager (like partitions)
so do not expect it will support such sort of operations...

Regards

Zdenek
