From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] mount reiserfs snapshot failed
Message-Id: <20020418130718.GA30701@tiger.bigcats.invalid>
References: <3CBE92EB.89FB2B07@mc-lindinger.de>
    <20020418094402.GA1233@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020418094402.GA1233@fib011235813.fsnet.co.uk>
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
Date: Thu Apr 18 08:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Joe!

Joe Thornber (joe@fib011235813.fsnet.co.uk) wrote 31 lines:

> On Thu, Apr 18, 2002 at 11:33:31AM +0200, Markus Bartl wrote:
> > Im using the original kernel 2.4.18 with the locking patch and the
> > lvm-patch applied. I use the lvm in Version 1.1rc1.

> > In some cases mounting the snapshot volume fails with error 32 (wrong fs
> > type or bad superblock).

> Do version 1.0.3 tools fail in the same way ?

I am running a similar configuration: 
Kernel 2.4.18-rc4 
    + LVM 1.0.3
    + linux-2.4.18-VFS-lock.patch
    + sched-O1-2.4.18-pre8-K3.patch
I use ext3, and the LVM 1.0.3-tools + LVM-1.0.3-pmove-patch 

Snapshots work.

I upgrade to 2.4.19-pre6, must merge the VFS-lock.patch by hand
and drop the sched-O1-* patch; and use the LVM 1.1rc1-Tools:

Snapshots get generated, but first some (depending on the
order of generation!), later all of them are unreadable (even
a simple cat fails complaining about that), so mount fails.

I decide this might be due to a bad merge on my side or a
kernel problem, so I downgrade to:

Kernel 2.4.18-rc4 
    + LVM 1.1rc1 
    + linux-2.4.18-VFS-lock.patch
    + sched-O1-2.4.18-pre8-K3.patch
LVM 1.1rc1-Tools.

Snapshots still unreadable.

I downgrade the Kernel to LVM 1.0.3:

Kernel 2.4.18-rc4 
    + LVM 1.0.3
    + linux-2.4.18-VFS-lock.patch
    + sched-O1-2.4.18-pre8-K3.patch
but still with LVM 1.1rc1-Tool

Snapshots still show the same problems as before.

Downgrading to LVM 1.0.3-tools on the running system:
everything works again.

-Wolfgang
