Date: Tue, 5 Apr 2011 11:25:27 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110405112527.367a0bff@bettercgi.com>
In-Reply-To: <4D947048.8060006@redhat.com>
References: <20110329124814.7fd059c7@bettercgi.com>
	<784dab.9d29.12f01ad2e6f.Coremail.ooolinux@163.com>
	<5fe2faea.20827.12f07068fe6.Coremail.ooolinux@163.com>
	<20110330132837.07e8d0ea@bettercgi.com>
	<alpine.LRH.2.00.1103302019060.412@bmsred.bmsi.com>
	<4D947048.8060006@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] copy lv from lv?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: zkabelac@redhat.com

> Isn't this already done in a better way by 'dd' using 'zero' copy
> mechanism ?? (assuming it is already using either  'mmap()' ->
> 'write()' or 'splice()'  as your proposed piped copy is doing a lot
> of pointless memory copies and cache trashing.

No, with directio there isn't "a lot of pointless memory copies 
and cache trashing". There are in fact fewer mempoy copies than 
there would be with a simple:
dd if=thing of=thing

See:
http://www.ukuug.org/events/linux2001/papers/html/AArcangeli-o_direct.html

The proof of the pudding is in the eating, and in fact that 
recipe is extremely fast, for this application (sequential 
copy of GBs from one device to another). I spent a couple 
of hours testing before spending hundreds of hours copying.
My bottom line was speed, so I didn't even look at memory
usage or CPU.  I would't mind using an extra 64 MB in order
to get my copying done 30 hours faster.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Thu, 31 Mar 2011 14:15:04 +0200
Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 31.3.2011 02:27, Stuart D. Gathman napsal(a):
> > On Wed, 30 Mar 2011, Ray Morris wrote:
> > 
> >>> 1..how to pipe two copy  together
> >>
> >> This is what I use after some experimenting.  I've found
> >> it's often far faster than the more obvious use of dd:
> >>
> >> nice -5 dd if=/dev/clones/from bs=64M iflag=direct |
> >>        dd of=/dev/scratch/to bs=64M oflag=direct
> >>
> >> I use 64 MB extents. For smaller extents, a matching dd
> >> block size might be good.
> > 
> > Thanks for that recipe.  It ought to be in lvm2 as an lvcopy utility
> > (dynamically determining extent size, etc).
> > 
> 
> 
> Isn't this already done in a better way by 'dd' using 'zero' copy
> mechanism ?? (assuming it is already using either  'mmap()' ->
> 'write()' or 'splice()'  as your proposed piped copy is doing a lot
> of pointless memory copies and cache trashing.
> 
> If it's still faster - then your kernel setting for buffering are
> most probaly not tuned for the best performance.
> 
> Zdenek
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
