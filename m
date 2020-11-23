Received: from localhost.localdomain (unknown [10.33.36.184])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 804151001E73
	for <linux-lvm@redhat.com>; Mon, 23 Nov 2020 13:04:14 +0000 (UTC)
Date: Mon, 23 Nov 2020 13:04:12 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20201123130412.GB2229389@localhost.localdomain>
References: <CAMaziXsY6vpQdD+QQzW_1Km+Ltf41tz0G1WG5xAUiMARFWHoyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMaziXsY6vpQdD+QQzW_1Km+Ltf41tz0G1WG5xAUiMARFWHoyw@mail.gmail.com>
Subject: Re: [linux-lvm] What is the use of thin snapshots if the external
 origin cannot be set to writable ?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Nov 21, 2020 at 08:40:44AM +0530, Sreyan Chakravarty wrote:
> I am looking into thin snapshots since the older COW snapshots delay my
> boot enormously.
> 
> My normal root fs is on a normal "non-thin" volume.
> 
> So to make a snapshot I have boot into a live cd environment then set my
> root fs volume to read-only and then set it to inactive.

OK - I understand what's going on in your environment now, thanks!

Unfortunately it's not possible to have a writable external origin when
using device-mapper thin provisioned snapshots. To be able to write to
the origin while snapshots exist the origin device must also be a thin
provisioned logical volume.

This is explained in more detail in the kernel documentation for the
thin provisioning targets.

Documentation/admin-guide/device-mapper/thin-provisioning.rst:

    External snapshots
    ------------------
    
    You can use an external **read only** device as an origin for a
    thinly-provisioned volume.  Any read to an unprovisioned area of the
    thin device will be passed through to the origin.  Writes trigger
    the allocation of new blocks as usual.
    
    One use case for this is VM hosts that want to run guests on
    thinly-provisioned volumes but have the base image on another device
    (possibly shared between many VMs).
    
    You must not write to the origin device if you use this technique!
    Of course, you may write to the thin device and take internal snapshots
    of the thin volume.

This allows a few niche use cases (like the VM example given), but it's
not the conventional way of using snapshots with thinp and it does
restrict what you can do.

This means that to use thinp snapshots most effectively you must set the
system up with a thin pool from the start (e.g. using the distro's
installer to set up the VG).

>             Command on LV vgfedora/fedora uses options that are invalid
> with LV parameters: lv_is_external_origin.

This is correct: currently you cannot make the origin writable since it
is an external snapshot.

There is some work going on at the moment that would make device-mapper
type features more flexible and available in other device types, but
with the features provided by current tools and the thinp kernel
support you need to use a thinp device for the snapshot origin too.
 
> Is there some sort of resolution ?

It means re-installing but if the system is set up to use a thin pool
and thin provisioned logical volumes from the start then you can use
snapshots without any of the limitations that you've bumped into with
external origin devices.

Regards,
Bryn.
