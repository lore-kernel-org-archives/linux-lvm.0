From: Andreas Dilger <adilger@home.com>
Message-Id: <200004110245.e3B2jp210917@webber.adilger.net>
Subject: Re: [linux-lvm] lvm'ing root fs
In-Reply-To: <E3A1ACFEDE71D3118C000020352285A03882E5@nbsjexm2.nbtel.nb.ca>
 "from Shaw, Marco at Apr 10, 2000 09:59:11 pm"
Date: Mon, 10 Apr 2000 20:45:51 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Marco writes:
> Twice I get the same results:
> 
> # cd /
> # cp -a * /mnt/root_vg
> cp: /mnt/root_vg/proc/kcore_elf: Invalid argument
> cp: proc/sys/net/ipv4/route/flush: Invalid argument

You should'nt try to copy /proc over.  The kcore file is actually the
copy of all of your RAM contents, and it can crash your system to read
from some parts of your memory (hardware ports and such).

Either limit the copy to a single partition (I don't know if "cp" has a
flag to do that), or unmount /proc before starting your copy.  You probably
also want to unmount your other filesystems as well (keeping only /) so
that your root LV only has files from / in it.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
