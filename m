Subject: Re: [linux-lvm] Can not boot: unable to mount root fs:
From: Jayson Garrell <kyi@kyi.sytes.net>
In-Reply-To: <3F5626D7.3070405@redshift.com>
References: <3F54CEFE.2080203@redshift.com>
	 <20030902224216.GB9145@DUK2.13thfloor.at>  <3F5626D7.3070405@redshift.com>
Message-Id: <1062616151.2988.9.camel@jayson.NTSERVER1>
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
Date: Wed Sep  3 14:16:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: Herbert Poetzl <herbert@13thfloor.at>

On Wed, 2003-09-03 at 10:37, Samuel A. Rogers wrote:
> Herbert,
> 
> I could send you a boot log but there is no information in it (to this problem) because the system 
> locks up before it mounts the root (or other) partitions. Sorry your right that I should have 
> included the boot loader, as it is grub. I am not sure what your wanting here, if it is a file or 
> for me to discribe what I selected in the configuration. If it is a file please let me know what 
> directory it is in and I will be happy to include it. I did select LVM and ext3 in the configuration.
> 
> Thank you for your help,
> 
> 	Sam.
> 
> Herbert Poetzl wrote:
> > On Tue, Sep 02, 2003 at 10:10:22AM -0700, Samuel A. Rogers wrote:
> > 
> >>So far I can not compile and boot any kernel from 2.4.19 - 2.4.21. I get 
> >>the below error message:
> >>
> >>VFS: cannot open device 3a:00
> >>kernel panic: VFS: unable to mount root fs 3a:00
> > 
> > 
> > send some more information, like a complete
> > bootup log, your boot loader and your kernel
> > configuration ...

I have had nothing but problems trying to get grub to boot a lvm root
fs. I use lilo and have no problems at all. Below is the section of my
lilo.conf.

image = /boot/bzImage
        root = /dev/vg0/lv0
        ramdisk = 8192
        initrd = /boot/initrd-lvm-2.4.20-gaming-r5.gz
        label = shadow
        read-only

I don't know about grub but in lilo I always had to give the ramdisk
size. 

Jayson Garrell
