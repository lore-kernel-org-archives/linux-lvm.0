Message-Id: <3.0.6.32.20011102135055.00803100@mail.doorpi.net>
From: Brent Harding <bharding@doorpi.net>
Subject: Re: [linux-lvm] pvmove root filesystem?
In-Reply-To: <20011102100135.F746@lynx.no>
References: <3.0.6.32.20011102104459.008053f0@mail.doorpi.net>
 <20011102003346.Q21136@pc.ilinx>
 <20011101233119.P21136@pc.ilinx>
 <20011101221529.W16554@lynx.no>
 <20011102003346.Q21136@pc.ilinx>
 <20011101235041.B746@lynx.no>
 <3.0.6.32.20011102104459.008053f0@mail.doorpi.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Date: Fri Nov  2 13:47:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Wow, never was an option when I installed, do I do it to my lv that I
already have? I'm using initrd to get lv mounted as root, but still have my
old partition not in the volume group, able to be booted, if I change
/etc/fstab and take initrd out of lilo.
At 10:01 AM 11/2/01 -0700, you wrote:
>On Nov 02, 2001  10:44 -0600, Brent Harding wrote:
>> Is redhat 7.1 using ext3 already automatically? How does one upgrade from
>> ext2 to ext3?
>
>It is an option, AFAIK.  To upgrade, you obviously need a kernel with ext3
>support, and then run "tune2fs -h <dev>" to convert the devices.  Also
>change /etc/fstab to use ext3 for the filesystem type.  You should have
>the latest e2fsprogs installed.
>
>Cheers, Andreas
>--
>Andreas Dilger
>http://sourceforge.net/projects/ext2resize/
>http://www-mddsp.enel.ucalgary.ca/People/adilger/
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
