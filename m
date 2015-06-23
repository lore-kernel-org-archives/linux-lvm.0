Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N6N6ai024078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 23 Jun 2015 02:23:06 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (Postfix) with ESMTPS id 6D8FABAEC7
	for <linux-lvm@redhat.com>; Tue, 23 Jun 2015 06:23:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1Z7Hbm-0006T1-CJ
	for linux-lvm@redhat.com; Tue, 23 Jun 2015 08:22:58 +0200
Received: from 145-166-85-95.dynamic.stcable.net ([95.85.166.145])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 23 Jun 2015 08:22:58 +0200
Received: from csanyipal by 145-166-85-95.dynamic.stcable.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 23 Jun 2015 08:22:58 +0200
From: csanyipal@gmail.com
Date: Tue, 23 Jun 2015 08:22:51 +0200
Message-ID: <877fqvt03o.fsf@gmail.com>
References: <87lhff4u8l.fsf@gmail.com>
	<CAE8gLhmgtXCy4gdG_HyNRg3NugFzUS_awcN-NFNqFvtOG_R7=A@mail.gmail.com>
	<877fqxehm2.fsf@gmail.com>
	<CAE8gLhkCQ62uevA=0QQXhvSVpcg8Nz9s8PygfY=DT5KSM31E=g@mail.gmail.com>
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

> 2015-06-21 7:49 GMT+02:00 <csanyipal@gmail.com>:
>> # lvcreate --verbose --size 10.10G -n var bubba
>>   DEGRADED MODE. Incomplete RAID LVs will be processed.
>
> Hey, I just notice, your VG is in degraded mode. This is not a normal
> condition and it can also cause unexpected things. Why is your VG
> degraded? Does it have missing PVs?

# vgdisplay -vvv
 DEGRADED MODE. Incomplete RAID LVs will be processed.

Indeed.
I don't know why is mine VG degraded.
How can I know does it have missing PVs?
What can I do to fix this problem?

-- 
Regards from Pal
