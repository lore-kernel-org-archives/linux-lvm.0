Subject: Re: [linux-lvm] final LVM2 utilities for 2.6 kernel don't seem to
	work
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <Pine.LNX.4.53.0307191135240.1519@localhost.localdomain>
References: <Pine.LNX.4.53.0307191135240.1519@localhost.localdomain>
Message-Id: <1058632137.22596.3.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Sat Jul 19 11:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Am Sa, 2003-07-19 um 17.38 schrieb Robert P. J. Day:

>   after having configured a kernel with device mapper support,
> and installed both the libdevmapper and LVM2 tools, when i ran
> just the command:
> 
>   # pvcreate --version
> 
> what i got was:
> 
>   /dev/mapper/control: open failed: No such file or directory
>   Is device-mapper driver missing from kernel?
>   /dev/mapper/control: open failed: No such file or directory
>   Is device-mapper driver missing from kernel?
>   Incompatible libdevmapper 1.00.02-ioctl (2003-07-12)(compat) and kernel driver 
>   LVM version:     2.00.05 (2003-07-18)
>   Library version: 1.00.02-ioctl (2003-07-12)
> 
> i was working with the 2.6.0-test1-ac2 version of the kernel, which
> i'm assuming i didn't need to patch any further since it already
> had the config options for device mapper and v4 ioctl.
> 
> did i assume incorrectly?  or did i mess up something else?  i
> build device mapper support directly into the kernel.

You're not too familiar with the concept of device files? If you don't
use devfs you'll have to create them (if they don't come with your
distro). Well. I'm just looking at the INSTALL file in the device-mapper
tar file: "Device Mapper installation" ... point 4)

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html
