Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5L01bdV018287
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 20:01:37 -0400
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6C8C78231
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2016 00:01:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5KMhGbX009571
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 15:43:16 -0700
Message-ID: <57687182.8030309@windriver.com>
Date: Mon, 20 Jun 2016 16:43:14 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <5768578E.2010608@windriver.com>
	<CAFTDQfCQpX18TEnu3i4BwnPuzn_ZyY=b3JJ_qWC2EzE3309wqA@mail.gmail.com>
	<576865BC.4020400@windriver.com>
In-Reply-To: <576865BC.4020400@windriver.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] what creates the symlinks in /dev/<volgroup> ?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Found it.  /usr/lib/udev/rules.d/11-dm-lvm.rules is what makes the 
/dev/<VG>/<LV> symlink for normal devices, but for a thin pool with a thin 
volume in it it will exit without making a symlink because 
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1 is set.

Given that both vgmknodes and the udev rules come from the lvm2 package, it'd be 
nice if they agreed on whether or not a symlink should be created and if so 
where it should link to.

Chris


On 06/20/2016 03:53 PM, Chris Friesen wrote:
> If I run it I get this:
>
> controller-1:/dev# vgmknodes -v
>      Using logical volume(s) on command line.
>      Found same device /dev/sda6 with same pvid Fw6C1IZABbnspIT23RbOGf2DXuB4zMhS
>      Found same device /dev/sda5 with same pvid 1s1dPDodojAS0kqToIRy4hiXFjCp2t2o
>      Found same device /dev/sda6 with same pvid Fw6C1IZABbnspIT23RbOGf2DXuB4zMhS
>      Found same device /dev/drbd4 with same pvid 6yk0HVTSbU9Amo6mwPKt3nZPnBIXBlhR
>      Found same device /dev/sda5 with same pvid 1s1dPDodojAS0kqToIRy4hiXFjCp2t2o
>    The link /dev/cinder-volumes/cinder-volumes-pool should have been created by
> udev but it was not found. Falling back to direct link creation.
>
>
> So it thinks that udev should have already made it.  Also, the symlink it
> generates looks different than the symlinks already in /dev/cinder-volumes, in
> that it points to /dev/mapper/<name> rather than pointing to the "real"
> /dev/dm-X device like the others.
>
>
> controller-1:/dev# ls -l /dev/cinder-volumes/
> total 0
> lrwxrwxrwx 1 root root  7 Jun 20 17:57 anchor-lv -> ../dm-9
> lrwxrwxrwx 1 root root 49 Jun 20 21:48 cinder-volumes-pool ->
> /dev/mapper/cinder--volumes-cinder--volumes--pool
> lrwxrwxrwx 1 root root  8 Jun 20 17:57
> volume-0bc1df18-45d0-4477-9c57-36876d3f82d4 -> ../dm-19
> lrwxrwxrwx 1 root root  8 Jun 20 17:57
> volume-2fff261f-8860-4b86-8b2e-49bddcf47e9b -> ../dm-17
> lrwxrwxrwx 1 root root  8 Jun 20 17:57
> volume-48744604-6b02-4f11-ba02-3f692d109953 -> ../dm-15
> lrwxrwxrwx 1 root root  8 Jun 20 17:57
> volume-8dabc793-e46d-4849-a2fb-dd3d4bc2c988 -> ../dm-20
> lrwxrwxrwx 1 root root  8 Jun 20 17:57
> volume-be3c9ddb-a6eb-43ca-ac37-5554756a4c13 -> ../dm-16
> lrwxrwxrwx 1 root root  8 Jun 20 17:57
> volume-eef89318-fa8e-4ca2-a8a7-fe8e143d8792 -> ../dm-14
> lrwxrwxrwx 1 root root  8 Jun 20 17:57
> volume-f11a7d88-1ad3-4e89-a594-e824019725bb -> ../dm-18
>
>
> Given the above, I think that something other than vgmknodes must be involved.
>
> Chris
>
>
> On 06/20/2016 03:03 PM, Ilya Boka wrote:
>> Command vgmknodes
>>
>> On Mon, Jun 20, 2016 at 10:52 PM, Chris Friesen
>> <chris.friesen@windriver.com> wrote:
>>> Hi,
>>>
>>> Can someone tell me what creates the /dev/<volgroup>/<volume symlinks?  Is
>>> this LVM or udev (and if udev, do you know which rule)?
>>>
>>> I'm seeing some interesting behaviour where if I create a thin pool it
>>> creates a symlink for the pool, but once I create a thin volume within the
>>> pool then the pool symlink disappears.
>>>
>>> Thanks,
>>> Chris
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
