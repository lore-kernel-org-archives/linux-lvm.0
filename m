From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] pvmove root filesystem?
Message-ID: <20011102100135.F746@lynx.no>
References: <20011102003346.Q21136@pc.ilinx> <20011101233119.P21136@pc.ilinx> <20011101221529.W16554@lynx.no> <20011102003346.Q21136@pc.ilinx> <20011101235041.B746@lynx.no> <3.0.6.32.20011102104459.008053f0@mail.doorpi.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3.0.6.32.20011102104459.008053f0@mail.doorpi.net>; from bharding@doorpi.net on Fri, Nov 02, 2001 at 10:44:59AM -0600
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
Date: Fri Nov  2 11:01:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Nov 02, 2001  10:44 -0600, Brent Harding wrote:
> Is redhat 7.1 using ext3 already automatically? How does one upgrade from
> ext2 to ext3?

It is an option, AFAIK.  To upgrade, you obviously need a kernel with ext3
support, and then run "tune2fs -h <dev>" to convert the devices.  Also
change /etc/fstab to use ext3 for the filesystem type.  You should have
the latest e2fsprogs installed.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
