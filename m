Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B1AC411.D6E307CD@tls.msk.ru>
Date: Mon, 04 Jun 2001 03:11:13 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
References: <NBBBKLKHMJHIJLHOGAOJIEANIPAA.steve.wray@the.net.nz>
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

Steve Wray wrote:
> 
> uh?
> I really don't understand this part -- the lvm tools on my system
> work for more than one kernel, why not the tools on the init ramdrive?

I'd ask the opposite: if your initrd is for exactly ONE kernel, why
it should contain stuff for many kernels?  See below.

[]
> Whats IOP anyhow?

Don't remember exactly, or maybe even misspelled.  I mean
an lvm protocol version between kernel and userland tools
here.  In short, protocol in kernel and userland should
match or else things will not work.  Due to many protocol
changes, some lvmtools wan't work with some kernels (or
again the opposite: only a few lvm tools will work with
any given kernel).  This is a headache, and someone (Andreas
Dilger?) introduced wrapper for every lvm program, that
first asks kernel for a protocol it implements, and then
calls appropriate lvm tools from /lib/lvm-$VERSION or
something like that.  When you're in initrd, you already
know (before even that initrd was created) what version
will be used in a kernel for that you make this initrd,
and the above wrappers not needed at all, you can jjust
put appropriate lvmtools there.  Yes, you can put tools
for all versions of a protocol and use a wrapper in initrd,
but *why*?? ;)  Sed is needed to find that proto version
based on output of an utility, and used inside a wrapper.

[Please someone correct me if I'm wrong here about sed's
usage.]

Regards,
 Michael.
