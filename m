Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q81Ko4po026028
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 16:50:04 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q81Ko2sL007013
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 16:50:03 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1T7udo-0006fi-9r
	for linux-lvm@redhat.com; Sat, 01 Sep 2012 22:50:04 +0200
Received: from wombat.san-francisco.ca.us ([75.101.60.140])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 22:50:04 +0200
Received: from kkeller by wombat.san-francisco.ca.us with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 22:50:04 +0200
From: Keith Keller <kkeller@wombat.san-francisco.ca.us>
Date: Sat, 01 Sep 2012 11:01:05 -0700
Message-ID: <14v9h9x123.ln2@goaway.wombat.san-francisco.ca.us>
References: <CA+ZVM8t--4TFtJ+cb=86-38ggjwYTUz5q+JAqv9sdPJW9XDV7A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Removing vg and lv after physical drive has been
	removed
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 2012-09-01, Rene C. <openvz@dokbua.com> wrote:
> We had a disk fail in a server and replaced it before removing the
> drive from LVM.
>
> The server has 4 physical drives (PV's), each with it's own volume
> group (VG). Each VG has 2 or more logical volumes (LV's.) Now LVM is
> complaining about the missing drive. So we have a VG (vg04) with two
> LV's that have become orphans than we need to clear out of the system.
>
> The problem is every time we run any LVM command we get some 'read
> failed' errors. I've tried different commands to try to clear it out
> but so far without luck:

[snip]

> The missing VG and LV's are not important, we just want to remove them.

I believe that you can use dmsetup to remove the vestiges of old unused
LVs and VGs.  Of course you *must* be careful that you don't
fumblefingers the command.  ;-)  I don't recall the exact syntax, so
check out man dmsetup, and if you have questions, hope that someone with
more experience can reply.  (I did this safely many months ago, but I do
not recall the exact syntax I used.)

--keith


-- 
kkeller@wombat.san-francisco.ca.us
