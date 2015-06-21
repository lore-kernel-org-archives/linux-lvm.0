Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5L5nKBc015110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 21 Jun 2015 01:49:20 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (Postfix) with ESMTPS id 08C77A0BA8
	for <linux-lvm@redhat.com>; Sun, 21 Jun 2015 05:49:18 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1Z6Y83-0004mW-Q2
	for linux-lvm@redhat.com; Sun, 21 Jun 2015 07:49:15 +0200
Received: from 199-142-85-95.dynamic.stcable.net ([95.85.142.199])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 21 Jun 2015 07:49:15 +0200
Received: from csanyipal by 199-142-85-95.dynamic.stcable.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 21 Jun 2015 07:49:15 +0200
From: csanyipal@gmail.com
Date: Sun, 21 Jun 2015 07:49:09 +0200
Message-ID: <877fqxehm2.fsf@gmail.com>
References: <87lhff4u8l.fsf@gmail.com>
	<CAE8gLhmgtXCy4gdG_HyNRg3NugFzUS_awcN-NFNqFvtOG_R7=A@mail.gmail.com>
Mime-Version: 1.0
Subject: Re: [linux-lvm] lvcreate - device not cleared Aborting. Failed to
	wipe start of new LV.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

MegaBrutal <megabrutal@gmail.com> writes:

> 2015-06-19 17:02 GMT+02:00  <csanyipal@gmail.com>:
>> I'm not sure whether was on this system created the VG 'bubba' with lvm
>> version 1, so maybe this issue is related to that fact that it was
>> really created with lvm version 1?
>
> That your LVM library version is 1.02.90 (which is afaik the latest on
> the Debian line), doesn't mean that you use LVM1 metadata. It is very
> likely that you use LVM2. To check, you can see the output of "pvs"
> ("Fmt" = "lvm2"), or you can check "file -Lks /dev/sda2" where the
> output should start with "/dev/sda2: LVM2 PV (Linux Logical Volume
> Manager)".

# pvs
 PV         VG    Fmt  Attr PSize   PFree
 /dev/sda2  bubba lvm2 a--  455.42g 425.22g

# file -Lks /dev/sda2
/dev/sda2: LVM2 PV (Linux Logical Volume Manager), UUID: \
 SMvR2K-6Z3c-xCgd-jSR2-kb1A-15a2-3RiS6V, size: 489009346560

Indeed, my LVM library version is lvm2.

>> What is the solution for my problem?
>
> Please also try to run lvcreate with "--verbose" and post the output.

# lvcreate --verbose --size 10.10G -n var bubba
  DEGRADED MODE. Incomplete RAID LVs will be processed.
  Setting logging type to disk
  Finding volume group "bubba"
 Rounding up size to full physical extent 10.10 GiB
  Archiving volume group "bubba" metadata (seqno 48).
  Creating logical volume var
  Creating volume group backup \
   "/etc/lvm/backup/bubba" (seqno 49).
  Activating logical volume "var".
  activation/volume_list configuration setting not defined:
  Checking only host tags for bubba/var
  Creating bubba-var
  Loading bubba-var table (253:2)
  Resuming bubba-var (253:2)
 /dev/bubba/var: not found: device not cleared
 Aborting. Failed to wipe start of new LV.
  Removing bubba-var (253:2)
  Creating volume group backup \
   "/etc/lvm/backup/bubba" (seqno 50).
 semid 327688: semop failed for cookie 0xd4d12bb: \
  incorrect semaphore state
 Failed to set a proper state for notification semaphore \
  identified by cookie value 223154875 (0xd4d12bb) to \
  initialize waiting for incoming notifications.

-- 
Regards from Pal
