Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j14EYpO12158
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2005 09:34:51 -0500
Received: from mail.upcore.net (postfix@upcore.net [195.84.97.50])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j14EYo3D009991
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2005 09:34:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.upcore.net (Postfix) with ESMTP id C700C13241
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2005 15:34:48 +0100 (CET)
Received: from sauron.int.tixit.se (b118.broadband.quicknet.se [217.78.17.118])
	by mail.upcore.net (Postfix) with ESMTP id E6ECA1323F
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2005 15:34:44 +0100 (CET)
Subject: Re: [linux-lvm] Removing faulty disk from LVM2
From: Magnus Nilsson <magnus@upcore.net>
In-Reply-To: <20050204140605.GB14093@agk.surrey.redhat.com>
References: <1107510555.14978.30.camel@sauron.int.tixit.se>
	<20050204140605.GB14093@agk.surrey.redhat.com>
Date: Fri, 04 Feb 2005 15:34:52 +0100
Message-Id: <1107527692.14971.45.camel@sauron.int.tixit.se>
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

On Fri, 2005-02-04 at 14:06 +0000, Alasdair G Kergon wrote:
> On Fri, Feb 04, 2005 at 10:49:15AM +0100, Magnus Nilsson wrote:
> > Through pvmove'ing parts of the PV I've narrowed it down to PE #14858 of
> > 38154 4MB PE's. 
> 
> > Is there any way of just skipping that last PE and let me repair the
> > filesystem afterwards? Perhaps by vgcfgrestore'ing an edited backup,
> > excluding the broken PV?
> 
> 
> Firstly, pvmove --abort abandons a pvmove cleanly.
> 
> Two ideas:
>   Use dmsetup directly to hide the problematic PE.
> e.g. dmsetup table vg1-lvol1 to display the table,
>   Work out which sector(s) are the problem and replace them with
>   an 'error' line
> 
> 
>   Edit a (current) VG backup file to 'move' 1 extent elsewhere.
> e.g. 1 segment containing the problematic extent turns into 3 segments
> 
> Alasdair

Thanks for the tips.

I did try 'pvmove --abort' before mailing, but since the VG couldn't be
found the pvmove couldn't be aborted. I tried using -P with pvmove, but
the parameter wasn't recognised.

I managed to fix the problem myself though. I thought that maybe the
machine would behave differently if the disk was on a different
controller, so I moved the faulty disk from the Promise TX2 controller
to the motherboard. The machine still complained about the disk, but at
least it didn't hard-lock. That allowed the final pvmove to go through,
so I could vgreduce the PV. An fsck.ext3 discovered a couple of FS
hickups on one of the 3 LV's, but nothing major.

I hope that I will never have to use your ideas, ever. :)

//Magnus
