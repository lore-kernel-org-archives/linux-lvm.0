Return-Path: <Evan.Day@SUMMITSITE.COM>
Message-ID: <DC5B1A21E9E7D211B0020090273AD628242BBA@summit15.corvallis.summit>
From: "Day, Evan" <Evan.Day@SUMMITSITE.COM>
Subject: RE: [linux-lvm] LVM on root, Kernel panic: "I have no root and I 
	must scream"
Date: Fri, 27 Apr 2001 13:48:23 -0700
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I've tried both setting root=/dev/vg00/lvol1 and root=0x3a00 - neither
worked.  I'm probably just going to put / as the first device (including
/boot) on RAID-1 and make the rest of the system LVM.  I've spent too many
days trying to make root on LVM work and I need my system back...

Thanks for the tip, though
-Evan

-----Original Message-----
From: Luca Berra [mailto:bluca@comedia.it]
Sent: Friday, April 27, 2001 1:48 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and
I must scream"


On Fri, Apr 27, 2001 at 12:08:31AM -0700, Evan Day wrote:
> After activating vg00 and umounting /proc (in initrd/linuxrc), the system 
> dies:
> 
> Kernel panic: I have no root and I must scream!
> 
i use lilo not grub,
but try adding either
root=0x3a00
or 
root=/dev/vg01/lvol1

to the oprions you pass to the kernel.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
