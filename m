From: Andreas Dilger <adilger@turbolabs.com>
Date: Sun, 23 Sep 2001 22:17:29 -0600
Subject: Re: [linux-lvm] e2fsck probs with LVM and 2.4.9-ac9+
Message-ID: <20010923221729.U14526@turbolinux.com>
References: <Pine.LNX.4.21.0109221900090.23118-100000@zeke.goatskin.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0109221900090.23118-100000@zeke.goatskin.org>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sep 22, 2001  19:11 -0400, Shane Shrybman wrote:
> When I attempted to upgrade to 2.4.9-ac9 and ac14 from 2.4.9-ac6 I ran
> into a problem.
> 
> With either of these kernels (I didn't try any others between ac6 and
> ac14) the kernel boots fine and lvm-mod gets loaded ok but when the first
> filesystem that is on an lv gets mounted e2fsck complains and drops me to
> admin prompt. The error message is something like this:
> 
> The filesystem size (according to the superblock) is 524288 blocks
> the physical size of the device is 57344
> ...
> 
> When I reboot back into 2.4.9-ac6 everything is fine after e2fsck.
> 
> I have e2fsprogs version 1.19, do I need a more recent version?

That depends on how big you expect the devices to be.  I would suspect
an LVM error, but it is hard to say which one causes the problem.  If
you boot your old kernel, do lvscan, and compare to output of lvscan
on new kernel.  Likewise output of /proc/partitions and "df" to see
how big each LV should be.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
