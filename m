Message-ID: <3919F8A0.1F7A318C@msede.com>
Date: Thu, 11 May 2000 02:02:40 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] raid & LVM
References: <3919F2D5.50FBDADE@mobilestor.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Jeffrey E. Mast" <jmast@mobilestor.com>
Cc: linux-lvm@msede.com

"Jeffrey E. Mast" wrote:
> 
> I have been playing around with the kernel linux-2.3.99-pre7-8
> (0.8final) and attempting to try out
> using software raid0 with LVM. The problem I am having is that
> apparently /proc/partitions
> reports /dev/mda instead of /dev/md0 and pvcreate cannot find /dev/md0.

IMHO this might be an inconsistency between devfs and your current
device files (probably non devfs based?). When devfs is compiled in 
the kernel /proc/partitions returns the devfs names.
To save scanning all block device files in /dev, lvm tries to make
use of /proc/partitions in vgscan.

> Anyway, I made a link from /dev/md0 to /dev/mda and pvcreate works.
> However, doing
> a vgscan segfaults. The segfault occurs in pv_read_all_pv.c during the
> check for MD and
> clear out doubles.

Looks like a bug.


Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
