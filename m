Date: Tue, 24 Oct 2000 00:49:53 +0200
From: Ingo Oeser <ingo.oeser@informatik.tu-chemnitz.de>
Subject: Re: [linux-lvm] 2.4.0-test10-pre4 oops with LVM
Message-ID: <20001024004953.H727@nightmaster.csn.tu-chemnitz.de>
References: <Pine.LNX.4.21.0010191857290.20436-200000@uyema.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0010191857290.20436-200000@uyema.net>; from myles@puck.nether.net on Thu, Oct 19, 2000 at 07:07:52PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Myles Uyema <myles@puck.nether.net>
Cc: linux-kernel@vger.kernel.org, linux-lvm@msede.com

On Thu, Oct 19, 2000 at 07:07:52PM -0700, Myles Uyema wrote:
> This kernel panic occurred when I attempted to dump my ext2 filesystem
> /home onto /mnt/ide/backup.  My exact dump command was:
> 
> dump -0 -u -M -f /mnt/ide/backup/home -B 2096128 /home
> 
> I believe dump managed to start reading directories before the oops
> occurred...Haven't been able to duplicate the oops on 2.4.0-test9.

Content-Description: 2.4.0-test10pre4 oops log
> Oct 19 17:58:13 uyema kernel: kernel BUG at vmscan.c:102!

Remove lines 101-104 in mm/vmscan.c of linux-2.4.0-test10-pre4.

Someone was a bit too paranoid in MM handling ;-)

MM guys and even Linus would tell you the same[1].

Regards

Ingo Oeser

[1] As they did already for other people facing this problem.
-- 
Feel the power of the penguin - run linux@your.pc
<esc>:x
