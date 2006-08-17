Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7H606Wj026638
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 02:00:06 -0400
Received: from mx4.mail.ru (fallback.mail.ru [194.67.57.14])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7H5xu0c009729
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 01:59:57 -0400
Received: from f65.mail.ru (f65.mail.ru [194.67.57.99])
	by mx4.mail.ru (mPOP.Fallback_MX) with ESMTP id 219F73404F1
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 08:11:31 +0400 (MSD)
Received: from mail by f65.mail.ru with local id 1GDZE4-000PrC-00
	for linux-lvm@redhat.com; Thu, 17 Aug 2006 08:11:24 +0400
From: Sid Polak <sid_polak@mail.ru>
Subject: =?koi8-r?Q?Re=3A_[linux-lvm]_Running_LVM_on_shared_lun's?=
Mime-Version: 1.0
Date: Thu, 17 Aug 2006 08:11:24 +0400
Content-Transfer-Encoding: 8bit
Message-Id: <E1GDZE4-000PrC-00.sid_polak-mail-ru@f65.mail.ru>
Reply-To: Sid Polak <sid_polak@mail.ru>,
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
To: linux-lvm@redhat.com

Luca Berra wrote:
> On Tue, Aug 08, 2006 at 09:23:04AM -0700, David Chan wrote:
> > 
> >Don't think LVM is cluster aware.  Doing so can potentially cause loss
> >of LV's/data due to metadata corruption on the LVM level.  
> LVM2 supports cluster locking, either using internal locking which works
> with CMAN or GULM, or by using an external locking library that can be
> customized to work with every cluster software that supports locking of
>resources.

And what about tags? Could I use hostname tag to activate LVs on one host OR
another host which hostname is equal to the tag? That is not failover but
it could reduce recovery time after the failure of one of the hosts. Isn't it?

SidP
