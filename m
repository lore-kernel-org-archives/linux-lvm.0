Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8AJPEsr023309
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 15:25:14 -0400
Received: from mail.esperi.org.uk (user66020@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8AJP4ZL006814
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 15:25:04 -0400
Received: from esperi.org.uk (smmsp@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	k8AI9cjl000507
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 19:09:38 +0100
Subject: Re: [linux-lvm] Cannot get rid of root filesystem LVM snapshot
References: <b91808310609091349tf363c5dy57ced3b611523c18@mail.gmail.com>
	<20060909231739.GB13859@agk.surrey.redhat.com>
	<b91808310609091653o63dbdb0fi9f34848cb4479a1d@mail.gmail.com>
	<20060910154107.GC13859@agk.surrey.redhat.com>
From: Nix <nix@esperi.org.uk>
Date: Sun, 10 Sep 2006 18:35:00 +0100
In-Reply-To: <20060910154107.GC13859@agk.surrey.redhat.com> (Alasdair G.
	Kergon's message of "Sun, 10 Sep 2006 16:41:08 +0100")
Message-ID: <878xkriq0r.fsf@hades.wkstn.nix>
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 10 Sep 2006, Alasdair G. Kergon gibbered uncontrollably:
> Upstream does not support using lvm2 for the root filesystem because, as you
> discovered, the tools do not have complete support for it yet.

This is also nowhere documented: I've been using LVM2 as a root filesystem
for years without incident, so of course I thought it was meant to work.

(So much for backing up the whole system from snapshots, too...)

I must admit I can't see what's so special about the root filesystem.
From the kernel's POV it's just another vfsmnt: you can even unmount it
if you have no open sessions and you have a rootfs still mounted under
it.

Is it because the VG cfg backups are stored there?

> However people tried it and found it worked for them and so distributions
> started shipping this as an option despite incomplete support for the
> configuration in the upstream tools.  And so far nobody's considered it a
> high enough priority to get that support completed:-(

The tools work for me: even doing things like pvmoving root filesystems in
active use works fine. I'd vaguely guess that only snapshot support is
broken?

-- 
`In typical emacs fashion, it is both absurdly ornate and
 still not really what one wanted.' --- jdev
