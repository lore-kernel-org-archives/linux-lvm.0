From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] root fs on a LVM cause kernel panic
Message-ID: <20011114230449.B5739@lynx.no>
References: <01111500471301.02493@dirac.cids.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01111500471301.02493@dirac.cids.ca>; from dsavard@videotron.ca on Thu, Nov 15, 2001 at 12:41:28AM -0500
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
Date: Thu Nov 15 00:03:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Savard <dsavard@videotron.ca>
Cc: linux-lvm@sistina.com

On Nov 15, 2001  00:41 -0500, Daniel Savard wrote:
> I read the lvmcreate_initrd man page and followed the instructions to create
> the kernel image with LVM support. However, I am unsuccessful to make it
> working properly. The system boot and is showing its messages, including the
> message about LVM support in the kernel and while it is trying to mount the
> root filesystem, I am getting a kernel panic message saying the "root=" stanza
> should be provided with a valid device for the root filesystem.
> 
> What am I doing wrong? Is there anything missing? Any way to get extra
> debugging messages?

Did you add the initrd image to the kernel stanza in lilo.conf and re-run
lilo?  It sounds like your kernel is booting, but the VGs are not active.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
