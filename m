Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Ellis Whitehead" <lists@ellisw.net>
Message-Id: <20030526032356.20922.h022.c007.wm@mail.ellisw.net.criticalpath.net>
Subject: [linux-lvm] vgscan -f created duplicate block devices
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
Date: Mon May 26 05:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi Heinz,

> have you removed _all_ /dev/-Entries for LVs and retried 
> "vgscan -f" without success so far ?

I'm using devfs, and removal of the /dev/{VG}/{LV} entries isn't permitted.  The
VG and LVs show up under /dev if the VG is active, and otherwise they aren't
present.  Once the VG is active, the LV entries cannot be modified by the usual
command line tools, as far as I've seen...

Since vgscan can only works on active volumes, and since active volumes are
already immutably set in /dev, I'm afraid this solution won't work.

Is there any way to manually set the block device?  Or is there any way to get
vgscan to start anew without the block device numbers in /dev?

Thanks!
Ellis
