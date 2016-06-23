Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5NI2pDB025117
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2016 14:02:51 -0400
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 207BF3B72C
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2016 18:02:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5NI2nxI019898
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2016 11:02:49 -0700 (PDT)
Message-ID: <576C2447.9050403@windriver.com>
Date: Thu, 23 Jun 2016 12:02:47 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <5768578E.2010608@windriver.com>	<CAFTDQfCQpX18TEnu3i4BwnPuzn_ZyY=b3JJ_qWC2EzE3309wqA@mail.gmail.com>	<576865BC.4020400@windriver.com>
	<57687182.8030309@windriver.com>	<57687891.1090001@windriver.com>	<4094fb9b-01d7-8358-8a91-fa65719af0e4@redhat.com>	<57695BC4.3040205@windriver.com>	<8771709a-3ab2-e485-ce87-5a6c51e8a9a9@redhat.com>	<576AA614.6050800@windriver.com>	<ae18c007-f3ed-5115-b563-8a1074f27151@redhat.com>	<576C0FEF.7060301@windriver.com>
	<6629d697-bba0-aef0-f29f-60c4a35d00b2@redhat.com>
In-Reply-To: <6629d697-bba0-aef0-f29f-60c4a35d00b2@redhat.com>
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

On 06/23/2016 11:21 AM, Zdenek Kabelac wrote:
> Dne 23.6.2016 v 18:35 Chris Friesen napsal(a):

>> [root@centos7 centos]# vgscan --mknodes
>>   Configuration setting "snapshot_autoextend_percent" invalid. It's not part
>> of any section.
>>   Configuration setting "snapshot_autoextend_threshold" invalid. It's not part
>> of any section.
>
> fix your lvm.conf   (uncomment sections)
>
>>   Reading all physical volumes.  This may take a while...
>>   Found volume group "chris-volumes" using metadata type lvm2
>>   Found volume group "centos" using metadata type lvm2
>>   Found volume group "cinder-volumes" using metadata type lvm2
>>   The link /dev/chris-volumes/chris-volumes-pool should have been created by
>
> Ok - there seems to be internal bug in lvm2 - which incorrectly hints
> link creation for this case.
>
> There should not have been  /dev/vg/pool link - this is correctly marked
> for udev - but incorrectly for udev validation.
>
> However the bug is actually not so much important - it just links
> to 'wrapper' device - and eventually we will resolve the problem even without
> this extra device in table.

The problem that it causes for me is that when I run "vgchange -an 
chris-volumes" it leaves the /dev/chris-volumes with a broken symlink in it 
because udev doesn't remove the symlink added by vgscan.

This causes the LVM OCF script in the "resource-agents" package to break, 
because it is using the existance of the /dev/vg directory as a proxy for 
whether the volume group is active (or really as you said earlier, whether there 
are active volumes within the volume group).

I reported this as a bug to the "resource-agents" package developers, and they 
said that they can't actually call lvm commands in their "status" routines 
because there have been cases where clustered LVM hung when querying status, 
causing the OCF script to hang and monitoring to fail.

Ultimately I'll see if I can work around it by not calling "vgscan --mknodes". 
Originally it was added in to fix some problems, but that was a while back so 
things may behave properly now.

Thanks for your help,
Chris
