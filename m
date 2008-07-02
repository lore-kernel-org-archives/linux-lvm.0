Received: from pobox.corp.redhat.com (pobox.corp.redhat.com [10.11.255.20])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m62Fh0Ic009135
	for <linux-lvm@redhat.com>; Wed, 2 Jul 2008 11:43:00 -0400
Received: from [192.168.1.101] (vpn-13-193.rdu.redhat.com [10.11.13.193])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m62Fgxkg007764
	for <linux-lvm@redhat.com>; Wed, 2 Jul 2008 11:43:00 -0400
Message-Id: <C09506C2-25A7-4A32-9582-C1A4D5D10F9B@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <a9e5040807011410q485a3a4bkebe7c684301b865d@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v924)
Subject: Re: [linux-lvm] Is it possible to invalidate snapshots other than by
	overfilling?
Date: Wed, 2 Jul 2008 10:42:58 -0500
References: <a9e5040807011410q485a3a4bkebe7c684301b865d@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

It sounds like the module needed by device-mapper to support snapshots  
is not loaded when it is needed.  (Perhaps the module - dm-snapshot -  
is not in your initrd image?)

After step 3, but before step 4, try doing a 'dmsetup table' to see if  
things are properly mapped.  A 'dmsetup status' wouldn't hurt either...

Certainly, there should never be a kernel oops...  It's tough for me  
to say whether this bug is already fixed - given the age of your kernel.

  brassow

On Jul 1, 2008, at 4:10 PM, Rob West wrote:

> Does anyone know of ways that snapshots can become invalid other  
> than by writing more to the origin than the COW device can hold?
>
> The reason I ask is that we're having cases where a snapshot is  
> becoming invalid, but we are very skeptical that it is due to  
> overfilling. The size of the origin is 83G, and the size of the  
> snapshot is 8G.
>
> Here's what little we can tell from the logs:
> 1. Backup script creates a snapshot and starts copying data from it.
> 2. Before backup is finished (and thus, snapshot removed), the user  
> reboots.
> 3. On reboot, we get the following message which seems to be normal  
> for this kernel:
>     kernel: device-mapper: table: 253:2: snapshot-origin: unknown  
> target type
> 4. About 23 hours later, the backup script tries to create the  
> snapshot again but fails b/c it's still there.
> 5. The backup script tries to clean up by removing the snapshot, but  
> lvremove causes a kernel oops because the snapshot is invalid. (We  
> have identified a potential patch for this, but are trying to figure  
> out why the snapshot was invalid in the first place.)
>
> The kernel we're using is based off of Fedora 6 (2.6.18-1.2849).
>
> Not sure whether it matters, but device-mapper is version 1.02.07  
> release 4.0.RHEL4 and lvm2 is version 2.02.06 release 6.0.RHEL4.
>
>
> Thanks for any help,
> Rob
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
