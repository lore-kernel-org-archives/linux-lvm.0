From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] where do i find the device mapper/LVM2 documentation?
Message-ID: <20030528090643.GB449@fib011235813.fsnet.co.uk>
References: <3ED32F3E.9000009@silicide.dk> <20030527100801.GB646@fib011235813.fsnet.co.uk> <3ED33DA4.3090803@silicide.dk> <20030527104959.GC646@fib011235813.fsnet.co.uk> <20030527220901.GA32508@gw.silicide.dk> <20030527225055.GE646@fib011235813.fsnet.co.uk> <3ED478E1.1020509@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ED478E1.1020509@silicide.dk>
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
Date: Wed May 28 04:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 28, 2003 at 10:52:49AM +0200, Jon Bendtsen wrote:
> Okay? thats not the impression i got from reading what documentation i 
> could find (INTRO and dmsetup.8).

The driver is very different, but the userland tools still have
exactly the same concepts of extents, PVs, LVs and VGs.  The LVM2
tools have a few extra features, but other than that they are
identical in use to the LVM1 ones.

- Joe
