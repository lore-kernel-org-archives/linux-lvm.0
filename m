Subject: Re: [linux-lvm] syncing with snapshots takes forever?
Message-ID: <20030124182629.GA3406@fib011235813.fsnet.co.uk>
References: <F59HdlQgdYXSVvR0Wss000091d0@hotmail.com> <20030124111515.O12662@schatzie.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030124111515.O12662@schatzie.adilger.int>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Fri Jan 24 12:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 24, 2003 at 11:15:15AM -0700, Andreas Dilger wrote:
> The problem is that when you type "sync" you are actually writing (most of)
> your file to disk 4 times - once for the initial LV (which was mostly still
> in RAM I'm guessing), and once for each snapshot.  Since you now have 4x
> the write load and it is not streaming, but random I/O it causes your disks
> to thrash badly.  Add to that the fact that you are writing to a RAID which
> needs to seek _every_ disk for each write, and you are in really bad shape.

30 minutes still seems _far_ too long for LVM2, although totally
reasonable for LVM1.  At the risk of sounding patronising; when you
tried LVM2 are you certain you were not running LVM1 by mistake ?
(eg. was the LVM1 kernel driver present? did your volumes appear in
/dev/mapper/ ?).

- Joe
