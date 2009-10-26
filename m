Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9QDA8bN012834
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 09:10:08 -0400
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9QD9ukD001667
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 09:09:56 -0400
Received: from mira.localnet ([96.252.93.182]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KS400K6RHWBJN90@vms173019.mailsrvcs.net> for
	linux-lvm@redhat.com; Mon, 26 Oct 2009 08:09:51 -0500 (CDT)
Message-id: <4AE59F9A.6020900@mattgillen.net>
Date: Mon, 26 Oct 2009 09:09:46 -0400
From: Matthew Gillen <me@mattgillen.net>
MIME-version: 1.0
Subject: Re: [linux-lvm] Removing a very old physical drive
References: <1256547598.22335.32.camel@elm.bottlehall.co.uk>
In-reply-to: <1256547598.22335.32.camel@elm.bottlehall.co.uk>
Content-transfer-encoding: 7bit
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
To: linux-lvm@redhat.com

On 10/26/2009 04:59 AM, Nicholas Robinson wrote:
> Hi
> 
> I've been using lvm for quite a few years, but only occasionally when I
> need to add/remove new drives. So, my knowledge is limited and a bit
> rusty! I should have removed the old drive when I added a new one a
> couple of years ago, but for reasons I cannot remember, I didn't.
> ...

> 1. Can I do move the data off the old drive to the new drive without
> adding another new drive?

Is there any reason you can't use 'cp -a'?  If that isn't an option for some
reason, then you're out of luck, if I understood correctly: if the new disk is
completely allocated to another VG and you can't free up some partition (PV)
to add to the 'old' VG, there's not much you can do, AFAIK (since any given
partition/PV can only belong to one VG).

> 3. Where has the LogVol01 come from and what is it doing? Can I remove
> it?

Given your potentially flaky memory, it might be wise to try mounting it
somewhere first to see what's on it... ;-)

> 4. Can I rename the volgroup/logvols to the same pattern used by new
> installations? e.g. vg_hostname and lv_root, etc.

The GUI tool in fedora (system-config-lvm) appears to allow you to change the
names of VGs, presumably it's also possible from the command line.  Just be
sure that your /etc/fstab is consistent with whatever changes you make.

HTH,
Matt
