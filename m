From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] LVM limit on PE's/size?
Message-ID: <20011127112556.D730@lynx.no>
References: <3C03CEB1.E5D5D447@berbee.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C03CEB1.E5D5D447@berbee.com>; from pichelma@berbee.com on Tue, Nov 27, 2001 at 11:34:41AM -0600
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
Date: Tue Nov 27 12:24:08 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Nov 27, 2001  11:34 -0600, Scott P wrote:
> We are planning to add a 3 rd EXP300 array to out current server w/ 2
> EXP300's in place already!  We WILL surpass the 1 TB size, if possible?

Depends if the driver does 32-bit block numbers with signed or unsigned
values.  The absolute maximum supported by 2.4 kernels is 2TB devices.
I don't know if 2.2 will support > 1TB devices, but it is possible.

> Linux ptb3 2.2.19 #2 SMP Tue Jul 24 11:53:29 CDT 2001 i686 unknown
> 
> We are using:
> lvm_0.9.1_beta7
> reiserfsprogs-3.x.0j

Get newer LVM tools, like 1.0.1, because the old ones have lots more bugs.
Beta 7 has the PE alignment bug, so you should upgrade the tools even if
you can't upgrade the kernel.

> Here is the current filesystem and size:
> 
> /dev/exp300_2/exp300_lv2 924160464 891307744  32852720      97% /files1

> Q: Why are my logical volumes limited to 256 GB in size?
> A: This is NO absolute limit but it depends on the physical extent size
> you configured at volume group creation time.

Check what "pvdata -P /dev/whatever" tells you about the PE size.  If
it is 16386kB, then you are limited to 1TB in size.  If it is larger
than that, you _may_ be able to go past 1TB, but you may not, depending
on whether your drivers and kernel work properly or not.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
