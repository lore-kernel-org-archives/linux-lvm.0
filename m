Message-ID: <38C5C23F.10C2F1AF@msede.com>
Date: Wed, 08 Mar 2000 04:00:15 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshot documentation
References: <Pine.OSF.4.21.0003071740130.28917-100000@lazy.accessus.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jay Weber <jay@lazy.accessus.net>
Cc: linux-lvm@msede.com

Jay Weber wrote:
> Been playing with snapshots and am noticing I can create a snapshot with
> less PE's than my source LV that I'm snapshotting, with the small side
> effect of:
> 
> lvcreate -- WARNING: all snapshots will be disabled if more than 12 MB are
> changed

For now snapshots use a COW model at the block level. Each modified 
block gets saved (once) to the snapshot area. If the space dedicated 
to the snapshot area is exhausted the snapshot is discarded (and the
the saved blocks are simply discarded). Otherwise the fs would become
inconsistent.

When/if LVM once has persistent snapshots this might need to change.

> Is the above message implying that if I change more than 12MB of data on
> my source LV that the snapshot is then defunct/useless?  Does that include
> deletes, etc?

Yes. Though deletes should only affect the inode and lists of indirect
blocks (if any) so deleting a 12MB files does not necessarily result 
in 12MB of changes.


Hope this helps
Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
