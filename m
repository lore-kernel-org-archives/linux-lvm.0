From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] root fs on a LVM cause kernel panic
Message-ID: <20011116171922.M1308@lynx.no>
References: <01111617512007.02805@dirac.cids.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01111617512007.02805@dirac.cids.ca>; from dsavard@videotron.ca on Fri, Nov 16, 2001 at 05:19:47PM -0500
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
Date: Fri Nov 16 18:18:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Savard <dsavard@videotron.ca>
Cc: linux-lvm@sistina.com

On Nov 16, 2001  17:19 -0500, Daniel Savard wrote:
> While booting I am ending with a kernel panic message. The few last lines of
> the boot message are as follow:
> 
> VFS: Cannot open root device "3a01" or 3a:01
> Please append a correct "root=" boot option
> Kernel panic: VFS: Unable to mount root fs on 3a:01

Hmm, you only get that message when the initial boot is done, so two 
possibilities (I'm not an initrd guru, mind you):

1) you need to change the root= line in your lilo.conf to say "root=/dev/ram0"
   so that it will boot into the initrd.  Then do the real-root-dev trick
   (or try pivot_root if running a 2.4 kernel) after configuring the LVM
   stuff via vgscan; vgchange -a y.

2) You didn't re-run lilo after changing lilo.conf (yes, you probably did,
   but you can never tell from here, and always safe to ask).

> I also tested with ramdisk_size=X, where X is the size returned by the
> lvmcreate_initrd script for the ramdisk.

As long as this is larger than the size of the uncompressed ramdisk, you
should be OK.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
