Message-ID: <002301c2c47e$b54fbb60$3200a8c0@COMPAQ>
From: "Sean Oh" <oh@storageone.co.kr>
References: <F59HdlQgdYXSVvR0Wss000091d0@hotmail.com> <20030124111515.O12662@schatzie.adilger.int>
Subject: Re: [linux-lvm] syncing with snapshots takes forever?
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Sat Jan 25 08:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

----- Original Message -----
From: "Andreas Dilger" <adilger@clusterfs.com>
To: <linux-lvm@sistina.com>
Sent: Saturday, January 25, 2003 3:15 AM
Subject: Re: [linux-lvm] syncing with snapshots takes forever?

> The problem is that when you type "sync" you are actually writing (most
of)
> your file to disk 4 times - once for the initial LV (which was mostly
still
> in RAM I'm guessing), and once for each snapshot.

I understand that it is writing from memory to disk 4 times.(Yes, the data
is kept in memery until kernel dumps to disk, since the application I am
using does _async_ operation)

> Since you now have 4x
> the write load and it is not streaming, but random I/O it causes your
disks
> to thrash badly.  Add to that the fact that you are writing to a RAID
which
> needs to seek _every_ disk for each write, and you are in really bad
shape.


I do not think the RAID is one of the significant factor for the slowdown
here, since systems without RAID have the pretty much same problem.

> I'm guessing that if you put each snapshot on its own physical disk (maybe
> only keeping the original LV on the RAID device) you will see a lot of
> improvement.

I did.. see below

> Also, it would be interesting to know what the real performance
> of even the single 1GB write is (i.e. write + sync) because I'm guessing
> most of the data is still in memory.

Well, I have tested on the different system than my orignal posting. This
system has 4GB of RAM  and FC external RAID5 system, composing 4 RAID5
volumes with 5 FC disks each.

By doing 'sync ; time dd if=/dev/zero of=1G bs=1024k count=1000 ; time sync'
.

The dd write + sync speed on LV without snapshots was about110MB/s.
The dd write + sync speed on LV with 1 snapshots was about 5MB/s,too
The dd write + sync speed on LV with 2 snapshots was about 3.5MB/s,too
The dd write + sync speed on LV with 3 snapshots was about 3.2MB/s.

After putting the snapshot PVs on the different RAID volume:
The dd write + sync speed on LV with 1 snapshots was about 12MB/s,too
The dd write + sync speed on LV with 2 snapshots was about 9MB/s,too
The dd write + sync speed on LV with 2 snapshots was about 7MB/s,too

When I test with NFS(async mode) and SAMBA,they go fast until let's say a
few hundreds of MB is filled up in the memory, needed to be flushed and then
the trasfer suffers, nearly _STOPPED_ responding, producing 0 to a few
hundred _bytes_ for the transfer speed.

 > At, say, 50MB/s to disk you are still
> talking 3 or 4 minutes to write out 1GB, so even an ideal LV snapshot case
> would take 9-15 minutes to write out 4GB.


> Cheers, Andreas

Well, even with 1 snapshot, the throughput goes down to 1/10.

For my purpose, I would like to have NFS and SAMBA to transfer data
consistently with async mode. It seems to me that some logic in lvm snapshot
or kernel is causing those apps to stoped for a few tens of minutes when
memory is full and synced.
Do you know any patches to kernel or lvm that does not block(?) the I/O
operations while syncing or do something smarter for handling above issues?
