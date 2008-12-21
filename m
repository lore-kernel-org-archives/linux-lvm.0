Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBLIZ93c016318
	for <linux-lvm@redhat.com>; Sun, 21 Dec 2008 13:35:09 -0500
Received: from s1.echoreply.us (s1.echoreply.us [216.146.143.192])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBLIYgWX015075
	for <linux-lvm@redhat.com>; Sun, 21 Dec 2008 13:34:42 -0500
Received: from [125.60.243.116] (helo=[10.92.1.100])
	by s1.echoreply.us with esmtpsa (SSLv3:RC4-MD5:128) (Exim 4.69)
	(envelope-from <echo@echoreply.us>) id 1LETAY-0005uy-F3
	for linux-lvm@redhat.com; Sun, 21 Dec 2008 13:36:51 -0500
Subject: Re: [linux-lvm] LVM snapshot?
From: Tim Post <echo@echoreply.us>
In-Reply-To: <alpine.LFD.2.00.0812210927010.3626@tigger.tntechs.com>
References: <alpine.LFD.2.00.0812210927010.3626@tigger.tntechs.com>
Date: Mon, 22 Dec 2008 02:34:27 +0800
Message-Id: <1229884467.5412.26.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: echo@echoreply.us,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Sun, 2008-12-21 at 09:33 -0500, Tom Diehl wrote:
> Hi,
> 
> I have a machine that is running EL5 with xen. One of the DOMU's has an LV
> from DOM0 mounted on it to allow access to the data. Is it safe to do 
> a snapshot of the LV from DOM0 while it is still mounted rw on the DOMU?

Yes, provided:

1 - You send a sysrq 's' to the guest to sync anything dirty
2 - You pause the guest prior to taking the snapshot

After taking the snapshot, of course unpause the guest. I have a tool
that I wrote using libxenctrl / liblvm2cmd which does this very quickly,
if you'd like it I'll send you the source code when I get back to my
office next week. Its also rather easy to export mount stats (how much
is used on any given mount) via xenbus, which helps automatically size
the snapshots from dom-0.

A fsck -n /dev/xvda(x) within the running guest itself should tell you
(more reliably) if any problems exist, depending on the file system and
journal mode. It need not run completely, ~15 seconds in you'll be able
to tell and just ctrl-c. Moreover, this gives you a general indication
of how big the downtime window should be. Plus, the i/o of the test is
in the dom-u, which is better.

A "All Clean" message will look like the normal "clean" message, plus a
warning that journal recovery is not possible since fsck is not going to
make any changes to the FS.

HTH

Cheers,
--Tim
