From: Jason Smith <jhs@openenterprise.biz>
References: <200302251751.19856.jhs@openenterprise.biz> <20030225145733.GB3207@fib011235813.fsnet.co.uk>
In-Reply-To: <20030225145733.GB3207@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200302260152.07244.jhs@openenterprise.biz>
Subject: [linux-lvm] Re: RAID5 + LVM stillborn
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
Date: Tue Feb 25 13:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tuesday 25 February 2003 09:57 pm, Joe Thornber wrote:
> As far as I'm aware the only reason LVM doesn't have raid5 is that
> nobody has written it.  What is the serialisation problem ?

Software RAID in 2.4 maintains a stripe cache that must be the same size as 
the incoming reads and writes.  Usually this is 4k for standard filesystem 
io.  But e.g. if you do a mkfs, then it can change.  When md gets a request 
for a different sized read or write, it flushes the cache and rebuilds for 
the new size.

That's a bad feature in LVM's case, because once you make a snapshot, you get 
a barrage of requests coming in at different sizes: filesystem (4096), 
snapshots (512) and I think syncs (0), so in effect there is no cache since 
it's syncing several times per second.

Like I said, the perfomance is very bad.  I oopsed a machine today by 
snapshotting an incoming FTP directory.  Sorry, I sort of threw up my hands 
earlier.  But tomorrow morning I'm going to see how repeatable it is and post 
to -dev.

Thanks.

-- 
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
