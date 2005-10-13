Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9DNC4V03996
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2005 19:12:04 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9DNBrsu026778
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2005 19:11:58 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.4/8.13.3) with ESMTP id j9DNBjY7013465
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2005 01:11:46 +0200
Subject: Re: [linux-lvm] How to turn LVM off
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <26F201282709AA4895C203A194DA57DB4ED8EE@slcexch.cyberkineticsinc.com>
References: <26F201282709AA4895C203A194DA57DB4ED8EE@slcexch.cyberkineticsinc.com>
Date: Fri, 14 Oct 2005 01:11:44 +0200
Message-Id: <1129245104.28482.15.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2005-10-12 at 11:59 -0600, Kirk Korver wrote:
> Hello,

Hi!

[...]
> I see it is asking about VolGroup00. This is LVM stuff. I don't want LVM
> on the card. What is really weird is that all of this is happening
> before the rc.sysinit is started.

As you can see from the fact that nash is running, it is the initrd
running at this point. That's why rc.sysinit hasn't started running yet.

> I don't find any command line options
> to the kernel to turn LVM off. All of the LVM options are "modules" when
> I built my kernel.

Indeed, but they are probably on the initrd image and loaded by the nash
script.

> So my question is quite simply,
> What do I have to do so that LVM is NOT used?? Any other options?

You'd probably have to rebuild the initrd to fit your liking. There is a
script that comes with FC called "mkinitrd" that builds an initrd with
the modules and programs necessary to mount to root filesystem. Probably
that script detected that you're using LVM, and it is thus trying to
recreate that environment. I don't know if it's possible to configure
mkinitrd to an environment different from the one currently running. If
I were you, I'd unzip the initrd image, mount it, and edit it manually.

Hope it helps.

Fredrik Tolf
