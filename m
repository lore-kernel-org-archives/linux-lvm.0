Return-Path: <jeffrey.b.layton@lmco.com>
Date: Tue, 20 Feb 2001 13:16:32 -0500
From: Jeffrey B Layton <jeffrey.b.layton@lmco.com>
Subject: Re: [linux-lvm] Startup Script trouble in RH6.2
Message-id: <3A92B480.B4F7D0D9@lmco.com>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <20010220130523.A2952@jhereg.dmeyer.net>
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

dmeyer@dmeyer.net wrote:

> In article <3A9282FC.104A2BFF@lmco.com> you write:
> > However, if the suggested alternative is to modify rc.sysinit,
> > where in the script should I put the lvm startyp? Should it be
> > after loading the modules, but before adding the RAID devices?
>
> I modified rc.sysinit - I put in vgscan and vgchange just before the
> "Mounting local filesystems" bit.  I also put a vgchange -an in
> /etc/rc.d/init.d/halt just before remounting / ro.

I did the same thing and it works fine. But, I was hoping for
some script magic from somebody to avoid this (I'm working
with a company that ships RH based distributions with a
custom kernel and they want to limit any changes to the
standard RH init scripts).

Thanks!

Jeff


>
>
> --
> Dave Meyer
> dmeyer@dmeyer.net
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
