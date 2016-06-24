Received: from [10.34.130.169] (dhcp130-169.brq.redhat.com [10.34.130.169])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5OB03F5029137
	for <linux-lvm@redhat.com>; Fri, 24 Jun 2016 07:00:04 -0400
References: <5768578E.2010608@windriver.com>
	<CAFTDQfCQpX18TEnu3i4BwnPuzn_ZyY=b3JJ_qWC2EzE3309wqA@mail.gmail.com>
	<576865BC.4020400@windriver.com> <57687182.8030309@windriver.com>
	<57687891.1090001@windriver.com>
	<4094fb9b-01d7-8358-8a91-fa65719af0e4@redhat.com>
	<57695BC4.3040205@windriver.com>
	<8771709a-3ab2-e485-ce87-5a6c51e8a9a9@redhat.com>
	<576AA614.6050800@windriver.com>
	<ae18c007-f3ed-5115-b563-8a1074f27151@redhat.com>
	<576C0FEF.7060301@windriver.com>
	<6629d697-bba0-aef0-f29f-60c4a35d00b2@redhat.com>
	<576C2447.9050403@windriver.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <afe958d5-d814-4c7c-8d1a-44c9b76b1a80@redhat.com>
Date: Fri, 24 Jun 2016 13:00:03 +0200
MIME-Version: 1.0
In-Reply-To: <576C2447.9050403@windriver.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 23.6.2016 v 20:02 Chris Friesen napsal(a):
> On 06/23/2016 11:21 AM, Zdenek Kabelac wrote:
>> Dne 23.6.2016 v 18:35 Chris Friesen napsal(a):
>
>>> [root@centos7 centos]# vgscan --mknodes
>>>   Configuration setting "snapshot_autoextend_percent" invalid. It's not part
>>> of any section.
>>>   Configuration setting "snapshot_autoextend_threshold" invalid. It's not part
>>> of any section.
>>
>> fix your lvm.conf   (uncomment sections)
>>
>>>   Reading all physical volumes.  This may take a while...
>>>   Found volume group "chris-volumes" using metadata type lvm2
>>>   Found volume group "centos" using metadata type lvm2
>>>   Found volume group "cinder-volumes" using metadata type lvm2
>>>   The link /dev/chris-volumes/chris-volumes-pool should have been created by
>>
>> Ok - there seems to be internal bug in lvm2 - which incorrectly hints
>> link creation for this case.
>>
>> There should not have been  /dev/vg/pool link - this is correctly marked
>> for udev - but incorrectly for udev validation.
>>
>> However the bug is actually not so much important - it just links
>> to 'wrapper' device - and eventually we will resolve the problem even without
>> this extra device in table.
>
> The problem that it causes for me is that when I run "vgchange -an
> chris-volumes" it leaves the /dev/chris-volumes with a broken symlink in it
> because udev doesn't remove the symlink added by vgscan.

Yep - as said - in normal circumstance  use should NOT run 'vgmknodes'
as the created links will not be known/visible to udev  - so this behavior is 
correct.

> This causes the LVM OCF script in the "resource-agents" package to break,
> because it is using the existance of the /dev/vg directory as a proxy for
> whether the volume group is active (or really as you said earlier, whether
> there are active volumes within the volume group).
>
> I reported this as a bug to the "resource-agents" package developers, and they
> said that they can't actually call lvm commands in their "status" routines
> because there have been cases where clustered LVM hung when querying status,
> causing the OCF script to hang and monitoring to fail.
>
> Ultimately I'll see if I can work around it by not calling "vgscan --mknodes".

yes please,  start with this one...

vgmknodes are really supposed to be used on some unique urgent problem - not 
executed in script every hour...

But yes - lvm2 will need to fix link creation of pool-in-use...

> Originally it was added in to fix some problems, but that was a while back so
> things may behave properly now.

Regards

Zdenek
