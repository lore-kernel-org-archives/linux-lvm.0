Message-ID: <3A070E00.C4FE25F9@dell.com>
Date: Mon, 06 Nov 2000 14:01:04 -0600
From: Michael E Brown <Michael_E_Brown@dell.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] scsi/fc multipath failover patch
References: <200011061933.eA6JXtF17815@webber.adilger.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Jos Visser <josv@osp.nl>, linux-lvm@msede.com

Andreas Dilger wrote:

> Joe Visser writes:
> > Does anyone know whether md, lvm and likeminded drivers are resistant
> > against this alternate pathing solution? I mean, when you connect a SCSI
> > (or FC disk for that matter) through two controllers, any application or
> > driver that does scanning of the attached disks and partitions will
> > encounter the same disk/partitions twice.
>
> Heinz has said that in the upcoming 0.9 release of LVM, there will be

Is there cvs repository or some such thing so that us mere mortals can
test/contribute to upcoming release? I've a lab full of machines that can be
used for the cause, several fibre-channel devices, lots of scsi external
storage, and lots of other neat toys I can do horrible experiments on without
whining about lost data.

>
> PVIDs (actually DCE UUIDs) so LVM will remove duplicate PVs from its
> lists.  This can happen for reasons other than multipath, such as
> /dev/md and /dev/{hd,sd} access to the same PV.
>
> Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
