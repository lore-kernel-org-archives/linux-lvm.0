From: benr@us.ibm.com
Message-ID: <8525690A.00734B32.00@d54mta02.raleigh.ibm.com>
Date: Mon, 26 Jun 2000 16:59:17 -0400
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <mkp@linuxcare.com>
Cc: linux-lvm@msede.com



Martin,

>I am advocating:
>
>1. Using existing partitioning schemes to encapsulate logical disks.
>
>   This is only relevant in the migration case and if people want to
>   test LVMS on a few disks that are already partitioned.  If your
>   system has hundreds of disks connected, you'll use a 1:1 physical
>   to logical disk mapping anyway.

What you wish to do here can be done within the LVMS Architecture.
Basically, it would require the creation of a Device Manager plug-in which
would report each partition on a device as a logical disk.  Once this is
done, all of the other LVMS Partition Management and Feature plug-ins could
be applied to the logical disk.


>2. Avoid using existing partitioning schemes to encapsulate logical
>   partitions/extents.

This could be accomplished in the LVMS Architecture by creating a Partition
Manager plug-in which implements whatever scheme you desire.  Furthermore,
it could co-exist with other Partition Manager plug-ins.  The only
constraint is that a logical disk can not be shared between multiple
Partition Manager plug-ins.

I believe that what you advocate could be implemented within the LVMS
Architecture.   Since it is not an exact match for the model underlying the
architecture, it would not be a perfect fit, but it wouldn't be a bad fit
either.  Thoughts?

Regards,

Ben
