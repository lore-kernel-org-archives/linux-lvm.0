Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3P4MdGq031523
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 00:22:39 -0400
Received: from smtp4-g19.free.fr (smtp4-g19.free.fr [212.27.42.30])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3P4MbGQ019836
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 00:22:38 -0400
Received: from [192.168.0.1] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 48E646750C
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 06:22:32 +0200 (CEST)
Message-ID: <462ED788.8080804@free.fr>
Date: Wed, 25 Apr 2007 06:22:32 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Large LVM leading to e2fsck segfault
References: <20070424232330.GA29984@esri.com>
In-Reply-To: <20070424232330.GA29984@esri.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Ray !
Ray Van Dolson a �crit :
> Hello everyone -- got a CentOS 4.4 (x86_64) machine running a ~9TB LVM.
> We initially had problems with the LVM under 32-bit CentOS 4 so we
> upgraded to 64-bit CentOS.  The LVM was originally created under the
> 32-bit environment however.
> 
> # uname -a
> Linux rmanbackup 2.6.9-42.0.10.ELsmp #1 SMP Tue Feb 27 09:40:21 EST 2007 x86_64 x86_64 x86_64 GNU/Linux
> 
> It worked fine for a few days, but we began seeing errors such as the
> following:
> 
> Apr 23 12:19:59 rmanbackup kernel: attempt to access beyond end of device
> Apr 23 12:19:59 rmanbackup kernel: dm-0: rw=0, want=34359738368, limit=20507254784
> Apr 23 12:19:59 rmanbackup kernel: attempt to access beyond end of device
> Apr 23 12:19:59 rmanbackup kernel: dm-0: rw=0, want=34359738368, limit=20507254784
> 
> Sure enough:
> 
> # blockdev --getsize /dev/backup0/backup 
> 20507254784
Some time ago, we had similar messages on a plain (no LVM) 1 TB Raid 5 
array plugged to a Redhat derivative box.
It was due to the raid controler going south.
Try to check the array using the tools the card manufacturer give. You 
may be surprised.
This is just my 2�
-- 
Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
S'il vous pla�t, aidez nous � conserver nos ressources,
recyclez vos �lectrons !
