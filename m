Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DAMFKw018936
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 06:22:15 -0400
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9DAMDf6000634
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 06:22:14 -0400
Received: from wolverine (unknown [192.168.1.127])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 0D52312EE1
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 11:22:08 +0100 (BST)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Using LVM snapshots for hourly backups
Date: Fri, 13 Oct 2006 11:22:06 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <452F66EF.5010005@mogmail.net>
Message-Id: <20061013102208.0D52312EE1@bluewhale.planbit.co.uk>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi Nick,

RSYNC is useful for this, but it works at the file level.  If you had, for example, a 1GB e-mail file (e.g. Outlook PST) or a large
database file, and it was getting small changes every day (e.g. receiving a dozen 10KB e-mails => 120KB of changes), then RSYNC
would quickly eat up your disk space as each backup taken with RSYNC a complete new copy of the whole 1GB file.

Cascaded LVM snapshots, on the other hand, would allow the just the changes within the files to be kept, dramatically reducing the
disk usage.

I'm sure that you know this already, but it was worth explicitly stating the difference between RSYCN and LVM snapshots in case
someone reading the list wasn't as sure.

BR,

Roger 

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Nick
> Sent: 13 October 2006 11:14
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Using LVM snapshots for hourly backups
> 
> Sounds like it's not available in LVM but I achieve simmilar results
> with rsync. Take a look at this for some pointers.
> 
> http://www.mikerubel.org/computers/rsync_snapshots/
> 
> Nick
> 
> Jonathan E Brassow wrote:
> > I think everyone feels the same way about the current snapshot
> > implementation, and there is growing momentum for change. See
> > "*[dm-devel] [RFC] DM Snapshot scalability - Common snap store
> > approach*" (Oct 9th on dm-devel).
> >
> > Certainly, any changes will take a while though.
> >
> > brassow
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
