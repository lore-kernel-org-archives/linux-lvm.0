Message-Id: <200111141522.fAEFM3K00305@pcx4168.holstein.com>
From: "Todd M. Roy" <troy@holstein.com>
In-Reply-To: <20011113030010.62924.qmail@web13605.mail.yahoo.com> (message
	from Todd Roy on Mon, 12 Nov 2001 19:00:10 -0800 (PST))
Subject: Re: [linux-lvm] 1.0.1rc4 tools don't like me!
References: <20011113030010.62924.qmail@web13605.mail.yahoo.com>
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
Date: Wed Nov 14 09:21:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Well, I found out what the problem is with the LVM
tools at least 1.0.1rc4 and cvs version.

It appears that /proc must be mounted for at least vgscan
and vgchange to work.  This was *NOT* the case for tools version 1.0.

Naturally my juryrigged slackware rc.S script does
a vgchange -a y before the mount -a.... which stopped working
because /proc wasn't mounted yet.  Similarly rc.0 had the
vgchange -a n after the umount -a.

This was all on "stock" 2.4.15-pre3/4 kernels without any patches.

Thanks to all who emailed my with ideas and tips.

If anybody has fairly recent slackware rc. scripts I'd love to
see them.  They are no doubt way better than mine.

-- todd --


>  From: Todd Roy <todd_m_roy@yahoo.com>
>  Sender: linux-lvm-admin@sistina.com
>  Reply-To: linux-lvm@sistina.com
>  X-Original-Date: Mon, 12 Nov 2001 19:00:10 -0800 (PST)
>  Date: Mon, 12 Nov 2001 19:00:10 -0800 (PST)
>  
>  Well, with lvm in the kernel at 1.0.1rc4(ish), I
>  decided that it might be nice to actually update
>  my tools from 1.0 to 1.0.1rc4.  So I did...
>  
>  On the next reboot
>  vgchange -a y in rc.d/rc.S couldn't find my volume
>  group.
>  
>  Manually, once I logged in as root, vgchange -a y and
>  mount -a
>  voila... everything just fine...
>  
>  I shrugged, did another vgscan and rebooted.  Same
>  problem.  I reverted to 1.0 tools, all is well and I'm
>  breathing easier.
>  
>  The only thing I know is that I did upgrade my
>  pvversion -2 some time ago...
>  
>  Oh yeah, in the latest stuff in cvs (hoping that would
>  bail me out) pv_move.c is badly broken (doesn't
>  compile).
>  
>  Thanks,
>  
>  -- todd --
>  
>  
>  __________________________________________________
>  Do You Yahoo!?
>  Find the one for you at Yahoo! Personals
>  http://personals.yahoo.com
>  
>  _______________________________________________
>  linux-lvm mailing list
>  linux-lvm@sistina.com
>  http://lists.sistina.com/mailman/listinfo/linux-lvm
>  read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>  
