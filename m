From: Andreas Dilger <adilger@home.com>
Message-Id: <200004071749.e37Hnax05005@webber.adilger.net>
Subject: Re: [linux-lvm] Seg fault on vgscan
In-Reply-To: <E3A1ACFEDE71D3118C000020352285A01E73C0@nbsjexm2.nbtel.nb.ca>
 "from Shaw, Marco at Apr 7, 2000 11:30:18 am"
Date: Fri, 7 Apr 2000 11:49:36 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

You write:
> Not knowing the exact procedure for using lvm's with filesystems already
> mounted and in use (/usr, in my case).  I proceeded with the following
> commands:
> 
> --changed /dev/hda1 (/usr) to 0x8e
> --pvcreate /dev/hda1 /dev/hda8
> --vgcreate usr_dg /dev/hda8 /dev/hda1

This is very bad.  You should not use LVM on existing partitions.  Does it
not say anything in this regard in the documentation?  Probably, as a
safety measure, the LVM commands should verify that a partition is not
mounted before doing a pvcreate/vgcreate on it.

> This didn't restore the size expected so rebooted, and the /usr complained
> badly about requiring an fsck, which I did, and all appears to be back to
> normal.

It probably isn't.  I would suspect that files in the first 200kB of your
/usr partition are corrupted.  I'm surprised that the whole system didn't
just crash when it was overwritten.  Have you had any problems since then?
If you are using Red Hat or other RPM-based system, you should check the
files in all installed against their signatures in the original RPMs.

> For now, I'm going to familarize myself more with lvm by using partitions
> that are not in use

Probably a very good idea.

> but I think I need to fix my vgscan problem that
> appears to have been caused by my messing around above.
> 
> /etc/lvmtab no longer exists, but /etc/lvmconf/usr_dg.conf is still there.

Delete it.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
