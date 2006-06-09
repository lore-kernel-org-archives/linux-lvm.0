Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59EujOs013007
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 15:56:45 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FoiPl-0002AI-Hq
	for linux-lvm@redhat.com; Fri, 09 Jun 2006 15:56:45 +0100
Date: Fri, 9 Jun 2006 15:56:45 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problem creating snapshots with 2.6.16.9 and LVM
	2.02.06
Message-ID: <20060609145645.GC7606@agk.surrey.redhat.com>
References: <20060609134326.B1AAE12EDD@bluewhale.planbit.co.uk>
	<20060609145135.6063312EDD@bluewhale.planbit.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060609145135.6063312EDD@bluewhale.planbit.co.uk>
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

> > Wombat:~# lvcreate -L10G -n snapdisk -s /dev/clientstore/userdisk
> >   LV clientstore/snapdisk in use: not deactivating
> >   Couldn't deactivate new snapshot.

Could be interaction (not yet understood) with udev - try disabling udev while
running the command.

(Ref debian bug 343671)

Alasdair
-- 
agk@redhat.com
