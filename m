From: pll+lvm@lanminds.com
Subject: Re: [linux-lvm] How to best use LVM? 
References: <20020814165938.152D1F90D@tater> <20020814174547.GB898@fib011235813.fsnet.co.uk> <20020814184728.61BCEF90D@tater> <20020814193754.GA16344@chunk.voxel.net>
In-reply-to: Your message of "Wed, 14 Aug 2002 15:37:54 EDT."
             <20020814193754.GA16344@chunk.voxel.net> 
Message-Id: <20020814195039.22829F90D@tater>
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
Date: Wed Aug 14 14:51:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andres Salomon <dilinger@mp3revolution.net>
Cc: linux-lvm@sistina.com

In a message dated: Wed, 14 Aug 2002 15:37:54 EDT
Andres Salomon said:

>The debian packages are pretty out of date (since 2.4.19 took _forever_),
>I'll be uploading new ones tonight.

Oh. okay.  I guess I can wait until tomorrow to play then :)

Thanks.

>/proc/misc should definitely not be empty; is the device mapper driver
>loaded in the kernel?  (lsmod |grep dm, if it's compiled as a module).

Well, that's the interesting part.  I'm not using modules, so I don't 
know how to tell.  Here are the steps I took to build the 
device-mapper:

	1. cd device-mapper.0.96.03
	2. ./configure --prefix=/usr/local
	3. ( Using 2.4.18, no applicaple patches that I could find )

	   cd /usr/src/linux && configure/build/install new kernel

	   cd device-mapper.0.96.03/kernel
	   make symlinks

	4. cd .. (back to top directory
	   make
	   make install
	   
	5. cp scripts/devmap_mknod.sh /etc/init.d
	   update-rc.d devmap_mknod.sh defaults 10

	6. reboot using new kernel

	7. test using dmsetup:

		# dmsetup version
		Library version:   0.96.03-ioctl (2002-06-27)
		Couldn't open device-mapper control device
		Command failed

Which I've since traced to the fact that /proc/misc is empty, and 
therefore contains no minor number to use for the creation of
/dev/device_mapper/control.

I guess the point I'm a little confused about is this.  What is
/proc/misc ?  What's supposed to be in there, and why isn't it :)

I've never heard of /proc/misc before today.  That may be because 
it's primarily used with modular kernels and I tend to stay away from 
modules, preferring to compile everything directly in.

Thanks!

-- 

Seeya,
Paul
--
	It may look like I'm just sitting here doing nothing,
   but I'm really actively waiting for all my problems to go away.

	 If you're not having fun, you're not doing it right!
