Message-ID: <3CE48E38.40605@wanadoo.fr>
From: Francis SOUYRI <francis.souyri@wanadoo.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Some suggestions about lvminitrd_create
References: <E177uaF-0000ja-00@jelly.buzzard.org.uk> <20020516162341.A25098@sistina.com> <008c01c1fceb$e29f7660$3b00a8c0@aplabwp0368359> <20020516152200.GP1248@tykepenguin.com>
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
Date: Fri May 17 00:04:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Patrick Caulfield wrote:

>On Thu, May 16, 2002 at 05:10:58PM +0200, Bas wrote:
>  
>
>>>>Just a couple of suggestions firstly it would be nice if it checked
>>>>for /boot/System.map-'uname -r' rather than for just /boot/System.map.
>>>>When you have more than one kernel floating about this is handy.
>>>>        
>>>>
>>>Yep, that's what the "-F" option aims to support.
>>>
>>>      
>>>
>>>>Second suggestion it would be nice if a -t option existed to allow a
>>>>choice in the type of filesystem the initrd is created in. Not everyone
>>>>is using ext2 these days :)
>>>>        
>>>>
>>>Well, why do you want to use a different filesystem on a relatively tiny
>>>and little populated ram disk?
>>>      
>>>
>>Because once you choose to use XFS, you don't need ext2 utils anymore, so
>>why would you want to install ext2utils ?
>>    
>>
>
>You really want to use XFS for an initrd??
>
><fx tests:>
>
># dd if=/dev/zero of=disk bs=1024 count=8192
># mkfs.xfs disk
># mount -oloop disk /mnt
># df /mnt
>Filesystem           1k-blocks      Used Available Use% Mounted on
>/root/disk                3392        32      3360   1% /mnt
>
>OK you could tune that up a bit but I think ext2 is more approriate for an
>initrd and the ext2 utils don't take up /that/ much space: probably much less
>than your XFS journals in fact :-)
>
>patrick
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>  
>
Hello,

    I use "romfs" for the 'initrd" it take less place in the kernel than 
"ext2" (I use "reiserfs" for "normal" filesystems), the only problem is 
that "romfs" is a read only filesytem but you can use the "tmpfs" like 
this in your "linuxrc" script:

#!/bin/sh
mount -t tmpfs none /etc
mount -t proc none /proc
echo "Scanning for Volume Group..."
/sbin/vgscan
echo "Activating 'root' Volume Group"
/sbin/vgchange -a y /dev/vgroot
umount /proc
umount /etc

I use the "nash" shell from redhat, it take few place and have builtin 
the mount/umount commands.

The LVM is compiled in the kernel and I have these files in my "initrd":

/bin/nash
/bin/sh -> nash
/lib/ld-linux.so.2
/lib/libc.so.6
/lib/liblvm-10.so.1
/sbin/vgchange
/sbin/vgscan

Best regards.

Francis
