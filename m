From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] syncing with snapshots takes forever?
Message-ID: <20030124111515.O12662@schatzie.adilger.int>
References: <F59HdlQgdYXSVvR0Wss000091d0@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F59HdlQgdYXSVvR0Wss000091d0@hotmail.com>; from benew666@hotmail.com on Fri, Jan 24, 2003 at 10:07:31PM +0900
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Jan 24 12:16:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Jan 24, 2003  22:07 +0900, Sean Oh wrote:
> I am having difficult with LVM snapshots and syncing.
> I have tested LVM 1.0.6 and also LVM2. Both generate the same problem.
> 
> My testing environment is as follows:
> 
> VG vg01 Size 100GB
> LV lv01 Size 50GB
> LV lv01_snapshot1 size 10GB
> LV lv01_snapshot2 size 10GB
> LV lv01_snapshot3 size 10GB
> 
> as you can see above, there 4 LVs, one LV and 3 snapshots for the LV
> and also the system has SCSI raid controller(Mylex) and 1024GB of RAM, 
> though these does not seem to matter, since the problem happens to other 
> systems, also.
> The FS does not matter here, since Reiserfs and XFS both produce the same 
> syncing problem.
> 
> After copying a file with 1GB size to lv01 and typing 'sync' takes more 30 
> minitus or sometime forever. During these time period, access to lv01 is 
> neary blocked, producing very slow performance(0 ~ 400B/s). If I remove the 
> snapshots, sync returns normally. So it is the issue with LVM making the 
> changes in LV to 3 snapshots while locking the LV.

The problem is that when you type "sync" you are actually writing (most of)
your file to disk 4 times - once for the initial LV (which was mostly still
in RAM I'm guessing), and once for each snapshot.  Since you now have 4x
the write load and it is not streaming, but random I/O it causes your disks
to thrash badly.  Add to that the fact that you are writing to a RAID which
needs to seek _every_ disk for each write, and you are in really bad shape.

I'm guessing that if you put each snapshot on its own physical disk (maybe
only keeping the original LV on the RAID device) you will see a lot of
improvement.  Also, it would be interesting to know what the real performance
of even the single 1GB write is (i.e. write + sync) because I'm guessing
most of the data is still in memory.  At, say, 50MB/s to disk you are still
talking 3 or 4 minutes to write out 1GB, so even an ideal LV snapshot case
would take 9-15 minutes to write out 4GB.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
