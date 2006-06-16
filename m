Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GIhuoI016220
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 19:43:56 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FrJIS-0003NT-TU
	for linux-lvm@redhat.com; Fri, 16 Jun 2006 19:43:56 +0100
Date: Fri, 16 Jun 2006 19:43:56 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm - problem replacing failed disk
Message-ID: <20060616184356.GB11813@agk.surrey.redhat.com>
References: <1150407680.28492.28.camel@laue.chem.uleth.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1150407680.28492.28.camel@laue.chem.uleth.ca>
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

On Thu, Jun 15, 2006 at 03:41:20PM -0600, Steven Mosimann wrote:
> (1) Replaced the failed disk with one of the same size  
> (2) Used pvcreate to make the same physical volumes on the new disk
> that were present on the failed disk.  Example of the actual command I
> used was:
>   pvcreate --uuid xxxxx /dev/sdb1
> where xxxxx was the pv uuid from pvdisplay 

Missing the --restorefile arg there (for safety - if it was originally
created by lvm2 with default options it'll make no difference).
 
Missing a 'vgcfgrestore' step.

> (3) Used vgchange -a y -P to activate the volume group

No need for -P here.  That's what you use if you *don't* do steps 1 and 2 etc.

Alasdair
-- 
agk@redhat.com
