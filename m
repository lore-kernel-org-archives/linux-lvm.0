Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5LHAqvR018315
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 21 Jun 2015 13:10:52 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (Postfix) with ESMTPS id B4AD6BB999
	for <linux-lvm@redhat.com>; Sun, 21 Jun 2015 17:10:51 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1Z6ild-0001LD-GA
	for linux-lvm@redhat.com; Sun, 21 Jun 2015 19:10:49 +0200
Received: from 199-142-85-95.dynamic.stcable.net ([95.85.142.199])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 21 Jun 2015 19:10:49 +0200
Received: from csanyipal by 199-142-85-95.dynamic.stcable.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 21 Jun 2015 19:10:49 +0200
From: csanyipal@gmail.com
Date: Sun, 21 Jun 2015 19:10:42 +0200
Message-ID: <87vbehrnql.fsf@gmail.com>
References: <87lhff4u8l.fsf@gmail.com>
	<CAE8gLhmgtXCy4gdG_HyNRg3NugFzUS_awcN-NFNqFvtOG_R7=A@mail.gmail.com>
	<877fqxehm2.fsf@gmail.com> <5586E9A0.5030401@redhat.com>
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

Zdenek Kabelac <zkabelac@redhat.com> writes:

> Dne 21.6.2015 v 07:49 csanyipal@gmail.com napsal(a):
>> MegaBrutal <megabrutal@gmail.com> writes:
>>
>>> 2015-06-19 17:02 GMT+02:00  <csanyipal@gmail.com>:
>>>> I'm not sure whether was on this system created the VG 'bubba' with lvm
>>>> version 1, so maybe this issue is related to that fact that it was
>>>> really created with lvm version 1?
>>>
>>> That your LVM library version is 1.02.90 (which is afaik the latest on
>>> the Debian line), doesn't mean that you use LVM1 metadata. It is very
>>> likely that you use LVM2. To check, you can see the output of "pvs"
>>> ("Fmt" = "lvm2"), or you can check "file -Lks /dev/sda2" where the
>>> output should start with "/dev/sda2: LVM2 PV (Linux Logical Volume
>>> Manager)".
>
> Unfortunately Debian is 'known' with it's own rewrite of lvm2 udev rules.
> And those rules are not ack-ed by upstream and they are not correct.
>
> The result is simple - the lvm2 tool is not properly synchronizing
> with device activation and is not able to clear device header.
>
>> # pvs
>>   PV         VG    Fmt  Attr PSize   PFree
>>   /dev/sda2  bubba lvm2 a--  455.42g 425.22g
>>
>> # file -Lks /dev/sda2
>> /dev/sda2: LVM2 PV (Linux Logical Volume Manager), UUID: \
>>   SMvR2K-6Z3c-xCgd-jSR2-kb1A-15a2-3RiS6V, size: 489009346560
>>
>> Indeed, my LVM library version is lvm2.
>>
>>>> What is the solution for my problem?
>
> Install upstream udev rules (and remove those provided by Debian package) -
> but I've no idea what else will then break this way.
>
> If you are not creating volumes too often - let's create LV without zeroing
> and clear it yourself with i.e. 'dd' or run  mkfs.
>
> 'lvcreate -Zn....'

I shall follow this advice, to use -Zn option. Thanks!

-- 
Regards from Pal
