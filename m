From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 4 Oct 2001 00:04:51 -0600
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
Message-ID: <20011004000451.T8954@turbolinux.com>
References: <20011003213353.Q8954@turbolinux.com> <009101c14c87$3705fdc0$836788cf@industry>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <009101c14c87$3705fdc0$836788cf@industry>
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
To: linux-lvm@sistina.com

On Oct 03, 2001  23:46 -0400, Jason A. Lixfeld wrote:
> Wow!  Lots and LOTS of stuff!!  Didn't think it was ever going to end!!

Some of it is even useful.  Maybe you can include some of the stuff at
the end, or put it on a web page somewhere.

> Here's what yer looking for:
> 
> #0  lv_create (vg=0x8, lv=0xbffffb74, 
>     lv_name=0xbffffb98
> "????????????????????????????????\002???!???,???<???D???T???b???s???\201
> ???\214???\227???????")
>     at lv_create_remove.c:42
> #1  0x0804b03d in strcpy () at ../sysdeps/generic/strcpy.c:31

So it is dereferencing an uninitialized string (or so it appears).  It may
be that the string is corrupted elsewhere, however.  I'm surprised that
lv_check_name() in lv_create_remove() didn't catch this.  However, this
may also be a red herring, since sometimes GDB shows junk.

It is also suspicious because the lv and lv_name pointers are 0x24 apart,
which shouldn't be the case since lv_name is the first item in lv_t.

> #2  0x4006c177 in __libc_start_main (main=0x8049390 <strcpy+384>,
> argc=8, ubp_av=0xbffffb74, init=0x8048e88 <_init>, 
>     fini=0x804b4d0 <_fini>, rtld_fini=0x4000e184 <_dl_fini>,
> stack_end=0xbffffb6c) at ../sysdeps/generic/libc-start.c:129

If you try running with "export MALLOC_CHECK_=2 gdb <path>/lvcreate",
it may give more indication as to where the actual corruption is happening.

I just recompiled the tools, and did not have any problems with lvcreate,
so it must be something strange.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
