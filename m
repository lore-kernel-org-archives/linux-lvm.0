Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id k9BDNM0b024725
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 09:23:23 -0400
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <452BFBF9.3060301@overnetdata.com>
References: <452BFBF9.3060301@overnetdata.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-5--270160017
Message-Id: <bdb432dd699ec60a109bea3831d5d7d2@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Using LVM snapshots for hourly backups
Date: Wed, 11 Oct 2006 08:25:49 -0500
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-5--270160017
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed

I think everyone feels the same way about the current snapshot 
implementation, and there is growing momentum for change.  See 
"[dm-devel] [RFC] DM Snapshot scalability - Common snap store approach" 
(Oct 9th on dm-devel).

Certainly, any changes will take a while though.

  brassow

On Oct 10, 2006, at 3:00 PM, Anthony Wright wrote:

> I'm trying to work out if there's a way to use LVM snapshots to create 
> hourly backups of my data. I realise that this doesn't protect me 
> against disk/machine failure, but it would really handy in cases where 
> I want easy access to historical files, e.g where I accidentally 
> change/delete a file or I want to compare historical files/directories 
> to the current versions to see what's been changed.
>
> I thought a really simple and ingeneous approach would be to use LVM 
> snapshots so that each hour I make a snapshot, and remove the snapshot 
> from 24 hours ago, thus having a rolling hourly backup. However when I 
> tried this I ended up with 24 snapshots of the original volume which 
> means a single change to the original volume causes each snapshot to 
> do a Copy on Write of the changed block, so if I change one block on 
> the original volume the snapshots create 24 copies of the original 
> volume which isn't very good for disk performance or disk usage!!
>
> What I'd really want is to daisy-chain the snapshots so that 
> snapshot-3hours is a snapshot of snapshot-2hours, which is a snapshot 
> of snapshot-1hour, which is a snapshot of the original volume, thus if 
> a block in the original volume changes only snapshot-1hour is changed 
> and once a snapshot is older than an hour it cannot change any more.
>
> I notice that you can't make snapshots of snapshots, so I suspect what 
> I'm looking for isn't possible, but I thought I check and if it isn't 
> possible suggest it as a really useful feature for the future. Your 
> thoughts/comments would be welcome.
>
> Thanks,
>
> Tony Wright.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--Apple-Mail-5--270160017
Content-Transfer-Encoding: 7bit
Content-Type: text/enriched;
	charset=US-ASCII

I think everyone feels the same way about the current snapshot
implementation, and there is growing momentum for change.  See
"<bold>[dm-devel] [RFC] DM Snapshot scalability - Common snap store
approach</bold>" (Oct 9th on dm-devel).


Certainly, any changes will take a while though.


 brassow


On Oct 10, 2006, at 3:00 PM, Anthony Wright wrote:


<excerpt>I'm trying to work out if there's a way to use LVM snapshots
to create hourly backups of my data. I realise that this doesn't
protect me against disk/machine failure, but it would really handy in
cases where I want easy access to historical files, e.g where I
accidentally change/delete a file or I want to compare historical
files/directories to the current versions to see what's been changed.


I thought a really simple and ingeneous approach would be to use LVM
snapshots so that each hour I make a snapshot, and remove the snapshot
from 24 hours ago, thus having a rolling hourly backup. However when I
tried this I ended up with 24 snapshots of the original volume which
means a single change to the original volume causes each snapshot to
do a Copy on Write of the changed block, so if I change one block on
the original volume the snapshots create 24 copies of the original
volume which isn't very good for disk performance or disk usage!!


What I'd really want is to daisy-chain the snapshots so that
snapshot-3hours is a snapshot of snapshot-2hours, which is a snapshot
of snapshot-1hour, which is a snapshot of the original volume, thus if
a block in the original volume changes only snapshot-1hour is changed
and once a snapshot is older than an hour it cannot change any more.


I notice that you can't make snapshots of snapshots, so I suspect what
I'm looking for isn't possible, but I thought I check and if it isn't
possible suggest it as a really useful feature for the future. Your
thoughts/comments would be welcome.


Thanks,


Tony Wright.


_______________________________________________

linux-lvm mailing list

linux-lvm@redhat.com

https://www.redhat.com/mailman/listinfo/linux-lvm

read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


</excerpt>
--Apple-Mail-5--270160017--
