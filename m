Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] Segfault at boot with vgscan and linux 2.4.4 kernel
Date: Sun, 29 Apr 2001 19:31:56 -0400
References: <3AEBF85F.8EC404@gecpalau.com> <01042909134900.18233@oscar> <3AEC9E45.B76C4996@gecpalau.com>
In-Reply-To: <3AEC9E45.B76C4996@gecpalau.com>
MIME-Version: 1.0
Message-Id: <01042919315600.27358@oscar>
Content-Transfer-Encoding: 8bit
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

On Sunday 29 April 2001 19:05, you wrote:

I have 2.4.4 with lvm beta 7 in a module here.  Root is a reiserfs fs on a
lv mounted via initrd.  I also have swap from an LV.  It works fine from
a module here.

Ed 

> Hi there!
>
> LVM is compiled in to the kernel, not as a module.
>
> I have hand-patched the lvm.c file with the patch that was on the list. My
> kernel compiles fine.
>
> Glenn
>
> Ed Tomlinson wrote:
> > On Sunday 29 April 2001 07:17, Glenn Shannon wrote:
> > > Hi all (again!),
> > >
> > > Just got done compiling my new 2.4.4 kernel using the same options as
> > > before and now at boot vgscan is segfaulting......
> > >
> > > Anyone else have this problem?
> > >
> > > Tried recompiling the lvm tools....no dice. Still segfaulting...
> > >
> > > Tried recompiling my kernel with pgcc and no dice (wont finish
> > > compiling....complains a bunch and error 2s out on the make bzImage
> > > phase...modules compile fine tho (wierd).
> > >
> > > Tried updating my binutils and recompiling....no luck there either
> >
> > is lvm built as a module?  If so what does depmod -ae show.  If you
> > have undefined ref you need to apply the patch posted on this list on
> > top of beta7.
> >
> > Ed
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
