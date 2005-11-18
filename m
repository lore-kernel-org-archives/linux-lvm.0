Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jAILumEj007658
	for <linux-lvm@redhat.com>; Fri, 18 Nov 2005 21:56:48 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EdEDw-00065c-AZ
	for linux-lvm@redhat.com; Fri, 18 Nov 2005 21:56:48 +0000
Date: Fri, 18 Nov 2005 21:56:48 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Standard Linux Framework for Snapshot Notification
Message-ID: <20051118215648.GW26394@agk.surrey.redhat.com>
References: <64c763540511140550t4de2bbc8scdc58e4d38717a15@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64c763540511140550t4de2bbc8scdc58e4d38717a15@mail.gmail.com>
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

On Mon, Nov 14, 2005 at 07:20:59PM +0530, Block Device wrote:
>   I  want to know whether Linux provides any standard interface for
> volume managers etc so that applications can register themselves to be
> notified when a snapshot needs to be taken.

Not yet, but it's a reasonable thing to ask for.

> If there isnt any such interface how is consistency guaranteed for
> application data when a snapshot is taken ? eg. How does one take
> (consistent) snapshots of database instances w/o  first quiescing them
> ?
 
At the moment you have to do things the other way around:
  quiesce database
  lvcreate -s
  wake database

There already exists an in-kernel filesystem hook so that mounted filesystems 
get the notifications automatically so they can sync their metadata, and
the block devices get flushed.

Alasdair
-- 
agk@redhat.com
