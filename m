From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011061933.eA6JXtF17815@webber.adilger.net>
Subject: Re: [linux-lvm] scsi/fc multipath failover patch
In-Reply-To: <20001106180134.U751@jadzia.josv.com> "from Jos Visser at Nov 6,
 2000 06:01:34 pm"
Date: Mon, 6 Nov 2000 12:33:55 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jos Visser <josv@osp.nl>
Cc: Michael E Brown <Michael_E_Brown@dell.com>, linux-lvm@msede.com

Joe Visser writes:
> Does anyone know whether md, lvm and likeminded drivers are resistant
> against this alternate pathing solution? I mean, when you connect a SCSI
> (or FC disk for that matter) through two controllers, any application or
> driver that does scanning of the attached disks and partitions will
> encounter the same disk/partitions twice. 

Heinz has said that in the upcoming 0.9 release of LVM, there will be
PVIDs (actually DCE UUIDs) so LVM will remove duplicate PVs from its
lists.  This can happen for reasons other than multipath, such as
/dev/md and /dev/{hd,sd} access to the same PV.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
