From: pll+lvm@lanminds.com
Subject: Re: [linux-lvm] How to best use LVM? 
References: <20020814165938.152D1F90D@tater> <20020814174547.GB898@fib011235813.fsnet.co.uk>
In-reply-to: Your message of "Wed, 14 Aug 2002 18:45:47 BST."
             <20020814174547.GB898@fib011235813.fsnet.co.uk> 
Message-Id: <20020814184728.61BCEF90D@tater>
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
Date: Wed Aug 14 13:48:01 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In a message dated: Wed, 14 Aug 2002 18:45:47 BST
Joe Thornber said:

>device-mapper is the kernel driver used by LVM2, there should be a
>debian package for this too.

I've tried that, and even installing the device-mapper from sources.

For some reason the devmap_mknod.sh script is unable to create the
/dev/device_mapper/control file.  It appears that the problem is an 
inability to find the minor number from /proc/misc, which happens to 
be empty.

Did I forget to configure something in my kernel which should be 
appearing in my /proc/misc file?

Thanks,
-- 

Seeya,
Paul
--
	It may look like I'm just sitting here doing nothing,
   but I'm really actively waiting for all my problems to go away.

	 If you're not having fun, you're not doing it right!
