From: Toon van der Pas <toon@hout.vanvergehaald.nl>
Subject: Re: [linux-lvm] LVM2/Device-Mapper update
Message-ID: <20031123102014.GA13148@hout.vanvergehaald.nl>
References: <20031121233558.E16901@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031121233558.E16901@uk.sistina.com>
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
Date: Sun Nov 23 04:21:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 21, 2003 at 11:35:58PM +0000, Alasdair G Kergon wrote:
> I've updated the LVM 2.0 and Device-Mapper 1.0 tarballs at
> ftp.sistina.com again to incorporate some minor bug fixes
> and enhancements.
> 
> [...yadda yadda yadda...]
> 
> If your root filesystem is on a LV, you should run 'vgmknodes' or
> 'vgscan --mknodes' to fix up the special files in /dev in your real
> root filesystem after finishing with your initrd.

Is this advice targeted at non devfs users only?
(I'm running linux-2.6-test9 in a Gentoo distribution, with devfs.)

Thanks,
Toon.

> Also, you can use 'vgchange --ignorelockingfailure' on your initrd
> if the tool fails because it can't write a lock file to a read-only
> filesystem. [A patch for mounting read-only volumes from read-only
> PVs went into CVS today - it's not in this particular release.]
