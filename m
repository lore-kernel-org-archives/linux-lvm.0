Message-ID: <3BBC0A30.877C6C9D@adelaide.edu.au>
Date: Thu, 04 Oct 2001 16:35:20 +0930
From: Sean Burford <sean.burford@adelaide.edu.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
References: <20011003213353.Q8954@turbolinux.com> <009101c14c87$3705fdc0$836788cf@industry> <20011004000451.T8954@turbolinux.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

This is exactly what I was seeing.  I replaced the lv_create call with
an lv_create_remove call and it worked.

Note that not only lv_name is corrupt, but so are the vg and lv.

I was told that this was due to a buggy compiler, though I have not had
time to find and use a good compiler yet.  I guess it is only a metter
of time until something else crashes, since I comiled my kernel, modules
and LVM with the compiler :)  I'll let you know when I find a comilper
that works.  Andreas, what compiler version are you using?

Andreas Dilger wrote:
> 
> On Oct 03, 2001  23:46 -0400, Jason A. Lixfeld wrote:
> > Here's what yer looking for:
> >
> > #0  lv_create (vg=0x8, lv=0xbffffb74,
> >     lv_name=0xbffffb98
> > "????????????????????????????????\002???!???,???<???D???T???b???s???\201
> > ???\214???\227???????")
> >     at lv_create_remove.c:42
> > #1  0x0804b03d in strcpy () at ../sysdeps/generic/strcpy.c:31
> 
> So it is dereferencing an uninitialized string (or so it appears).  It may
> be that the string is corrupted elsewhere, however.  I'm surprised that
> lv_check_name() in lv_create_remove() didn't catch this.  However, this
> may also be a red herring, since sometimes GDB shows junk.
> 
> It is also suspicious because the lv and lv_name pointers are 0x24 apart,
> which shouldn't be the case since lv_name is the first item in lv_t.

-- 
Sean Burford    x34135
ITS Systems Specialist
Adelaide University
