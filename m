Message-Id: <3C5D5140.8070505@wanadoo.fr>
From: Francis SOUYRI <francis.souyri@wanadoo.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Root fs on LV on software RAID
References: <Pine.LNX.4.40.0202020226580.695-100000@phobos.internal.parmastocks.com>
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
Date: Sun Feb  3 09:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hello Georges,

    Yes it is possible. I have a hardware raid 5 system and two systems 
without raid where all the filesystem are on lv's (also /boot, I used a 
patched lilo). You can find some informations in the LVM mail archive.

Best regards.

Francis

George Karaolides wrote:

>Hi all,
>
>I'm a new subscriber to this list, learning how to use LVM on Debian
>woody with kernel version 2.4.17.
>
>So far, I've managed to build filesystems (ext2) in logical volumes on
>top of software RAID-1, mount them and copy data into them.
>
>I'd like to know if it is possible to have the root filesystem on an LV on
>top of software RAID (provided, of course, that /boot is on a separate
>partition readable by lilo).  I've searched the past few months' worth of
>list archives and have found no reference to whether this is actually
>possible or not.  Has anyone done this?
>
>Thanks in advance and best regards,
>
>|      George Karaolides       8, Costakis Pantelides St.,         |
>|      tel:   +357 99 68 08 86                  Strovolos,         |
>|      email: george@karaolides.com       Nicosia CY 2057,         |
>|      web:   www.karaolides.com      Republic  of Cyprus          |
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
