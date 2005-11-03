Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA3JHiV12911
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 14:17:44 -0500
Received: from mail.inostor.com (w130.z209220038.sjc-ca.dsl.cnc.net
	[209.220.38.130])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jA3JHd33019904
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 14:17:43 -0500
Subject: Re: [linux-lvm] lvm2 snapshot BREAKS on 2nd snapshot
From: "James G. Sack (jim)" <jsack@tandbergdatacorp.com>
In-Reply-To: <20051103134422.54741734E9@hormel.redhat.com>
References: <20051103134422.54741734E9@hormel.redhat.com>
Date: Thu, 03 Nov 2005 11:17:38 -0800
Message-Id: <1131045458.10339.59.camel@jgs4.ino.pvt>
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
To: "LVM LIST linux-lvm@redhat.com" <linux-lvm@redhat.com>

>..(from digest)..
> Message: 2
> Date: Wed, 2 Nov 2005 00:03:53 +0000
> From: Alasdair G Kergon <agk@redhat.com>
> Subject: Re: [linux-lvm] lvm2 snapshot BREAKS on 2nd snapshot
> To: linux-lvm@redhat.com
> Message-ID: <20051102000353.GH26394@agk.surrey.redhat.com>
> Content-Type: text/plain; charset=us-ascii
> 
> On Tue, Nov 01, 2005 at 08:03:21AM -0800, James G. Sack (jim) wrote:
> > I get this kcopyd BUG (and consequent Oops)
> 
> Here's a related patch to try from Jan Blunck.
>   [The fix still needs moving into bio_list_merge() not its caller.]
> 
> If things keep to schedule, there'll be new userspace activation
> code around the end of this week aimed at avoiding
> snapshot failures locking up machines, and I'll be back dealing
> with the outstanding kernel patches (including this one) by the 
> middle of next week.
> 
> Alasdair

I tried the patch on the latest FC4 kernel (2.6.13-1.1532_FC4), and it
still triggers the kcopyd.c BUG at line 145.

The behavior I get, may actually be a consequence of (or worsened by) a
simultaneous loop running dmsetup info -- so maybe there's some other
lock error involved, too?

Anyway, I look forward to the upcoming improvements -- thanks, agk.

For now, I am living with the constraint that lvm2 snapshots work ok as
long as there is not more than one snapshot on any given origin volume.


..jim
