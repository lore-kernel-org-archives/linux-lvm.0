Date: Tue, 10 May 2005 13:50:02 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM minor number allocation policy
Message-ID: <20050510125002.GM20004@agk.surrey.redhat.com>
References: <e4fec31a05050923534f3bdaea@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4fec31a05050923534f3bdaea@mail.gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aditya Kulkarni <aditya.r.kulkarni@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

These answers are for lvm2 not lvm1.

On Tue, May 10, 2005 at 12:23:02PM +0530, Aditya Kulkarni wrote:
> [1] Suppose I create two LVs named vol1 and vol2. They have the
> following (major, minor) no.s. vol1 = (major=X, minor=0) and vol2 =
> (major=X, minor=1). Now I reboot the system. Is it guaranteed that
> vol1 and vol2 will retain their minor no.s?
 
No.

> [2] Are there some options while creating LVs that we can use so that
> LVs are created with a particular minor number?
 
Yes.  lvcreate/lvchange -My --major 254 --minor 200

Minor numbers normally allocated lowest first, so best to choose
higher numbers for persistent ones.  [2.6 kernel currently ignores 
the --major option]

> The issue of minor number remaining same is relevant to services being
> "highly available". In my case, it happens to be the NFS exported file
> system. The NFS file handle includes, among other things, the minor
> no. of the device on which the exported file system resides. 

These days, that's configurable.
See 'man exports' fsid=num.

+ This option forces the filesystem identification portion of the file handle
+ and file attributes  used  on the  wire  to  be  num instead of a number
+ derived from the major and minor number of the block device on which the
+ filesystem is mounted.  Any 32 bit number can be used, but it must be unique
+ amongst  all  the exported filesystems.

+ This  can  be  useful for NFS failover, to ensure that both
+ servers of the failover pair use the same NFS file handles for the shared
+ filesystem thus avoiding stale file handles after failover.

Alasdair
-- 
agk@redhat.com
