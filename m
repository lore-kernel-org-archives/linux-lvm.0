From: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>
Subject: Re: [linux-lvm] Block-Level Backup
Message-ID: <20030807163228.GC5036@ti19>
References: <1060247670.28307.37.camel@rocky> <20030807093631.GE381@fib011235813.fsnet.co.uk> <1060260466.4360.2.camel@chtephan.cs.pocnet.net> <20030807134451.GA30494@www.13thfloor.at> <20030807151127.GB5036@ti19> <20030807155421.GK381@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030807155421.GK381@fib011235813.fsnet.co.uk>
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
Date: Thu Aug  7 11:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 07, 2003 at 04:54:21PM +0100, Joe Thornber wrote:
> This scheme only works if you don't use the device while you are
> taking an incremental backup.  I think the real solution will be based
> around snapshots.

Right.  But I think the point is this: one won't mind keeping multiple
(tower of hanoi) long-lived (week or more) block change indices, because
the performance impact should be very low.

When it it time to do an actual backup, we simultaneously create a
new block change index, take a regular snapshot, and freeze (or copy)
the block-change index of interest.  Then we just back up the blocks
from the snapshot volume indicated in the frozen block-change index and
then delete the frozen block-change index and the snapshot volume.

For a typical filesystem, the snapshot volume persists for seconds to
minutes while the data is copied, not the tens of minutes to hours often
required to traverse the whole device with a tool like dump(8).

Regards,

	Bill Rugolsky
