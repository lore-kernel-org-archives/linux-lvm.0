From: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20031205065522.GA28825@thunk.org>
References: <3FCB4AFB.3090700@backtobasicsmgmt.com> <20031201141144.GD12211@suse.de> <3FCB4CFA.4020302@backtobasicsmgmt.com> <20031201155143.GF12211@suse.de> <3FCC0EE0.9010207@backtobasicsmgmt.com> <20031202082713.GN12211@suse.de> <Pine.LNX.4.58.0312021009070.1519@home.osdl.org> <20031204011236.GA5622@simulated.ca> <Pine.LNX.4.58.0312031721210.2055@home.osdl.org> <20031204043106.GA19017@netnation.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031204043106.GA19017@netnation.com>
Subject: [linux-lvm] Re: Reproducable OOPS with MD RAID-5 on 2.6.0-test11
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
Date: Fri Dec  5 07:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Kirby <sim@netnation.com>
Cc: Linus Torvalds <torvalds@osdl.org>, Linux-raid maillist <linux-raid@vger.kernel.org>, Jens Axboe <axboe@suse.de>, Neil Brown <neilb@cse.unsw.edu.au>, "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>, LKML <linux-kernel@vger.kernel.org>, linux-lvm@sistina.com

On Wed, Dec 03, 2003 at 08:31:06PM -0800, Simon Kirby wrote:
> 
> Without the patches, the box gets as far as assembling the array and
> activating it, but dies on "mke2fs".  Running mke2fs through strace shows
> that it stops during the early stages, before it even tries to write
> anything.  mke2fs appears to seek through the whole device and do a bunch
> of small reads at various points, and as soon as it tries to read from an
> offset > 2 TB, it hangs.

It sounds like mke2fs tried using BLKGETSIZE ioctl, but given that
this returns the number of 512 byte sectors in a device in a 4 byte
word, the BLKGETSIZE ioctl quite rightly threw up its hands and said,
"sorry, I can't tell you the correct size."

The mke2fs fell back to its backup algorithm, which uses a modified
binary search to find the size of the device.  It started to see if
the device was at least 1k, and checks to see if the device is at
least 2k, 4k, 8k, 16k, 32k, 64k, 128k, etc.  So it sounds like it's
dieing when it tries to seek past 2TB using llseek(). 

It would probably be worthwhile to write a little test program which
opens the disk, llseeks to 2TB+1, and then tries reading a byte.  If
that fiailes, then there's definitely a bug somewhere in the device
driver....

						- Ted
