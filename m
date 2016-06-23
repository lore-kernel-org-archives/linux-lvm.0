Received: from [10.34.130.169] (dhcp130-169.brq.redhat.com [10.34.130.169])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5N8Y54j008986
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2016 04:34:05 -0400
References: <5768578E.2010608@windriver.com>
	<CAFTDQfCQpX18TEnu3i4BwnPuzn_ZyY=b3JJ_qWC2EzE3309wqA@mail.gmail.com>
	<576865BC.4020400@windriver.com> <57687182.8030309@windriver.com>
	<57687891.1090001@windriver.com>
	<4094fb9b-01d7-8358-8a91-fa65719af0e4@redhat.com>
	<57695BC4.3040205@windriver.com>
	<8771709a-3ab2-e485-ce87-5a6c51e8a9a9@redhat.com>
	<576AA614.6050800@windriver.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <ae18c007-f3ed-5115-b563-8a1074f27151@redhat.com>
Date: Thu, 23 Jun 2016 10:34:05 +0200
MIME-Version: 1.0
In-Reply-To: <576AA614.6050800@windriver.com>
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

Dne 22.6.2016 v 16:52 Chris Friesen napsal(a):
> On 06/22/2016 03:23 AM, Zdenek Kabelac wrote:
>> Dne 21.6.2016 v 17:22 Chris Friesen napsal(a):
>>> I'm using the stock CentOS7 version, I think.
>>>
>>>   LVM version:     2.02.130(2)-RHEL7 (2015-12-01)
>>>   Library version: 1.02.107-RHEL7 (2015-12-01)
>>>   Driver version:  4.33.0
>>>
>>> So are you saying that nobody should run "vgscan --mknodes" on a system where
>>> udev is managing the symlinks?
>>
>> Yes - on such system this command should be used only in case of 'emergency',
>> udev doesn't work properly and you need links.
>>
>> The links however will not be known to udev and likely whole system is
>> going to be crashing soon or is misconfigured in major way.
>
> Okay, I'll see if I can get the call to vgscan removed.  But even so wouldn't
> it make sense to have vgscan use the same logic as udev in terms of what
> symlinks to make and where to make them to?

It *IS* using same logic.

If the link is not there - the bug is in your udev rules.

When udev is properly configured, vgscan should not show missing link.

It's worth to note -  'dm' subsystem is in general 'ignored' by udev and 'dm' 
user has to provide proper rules.  If your drbd device is missing,
then something wrong is with rules...

Likely 'drbd' devices are not properly scanned by udev (and I assume they 
would not even work on system with  use_lvmetad=1).


>>> I'm not sure what you're talking about as far as duplicates, I'm not seeing
>>> any duplicate devices.  The problem I see is that "vgscan --mknodes" or
>>> "vgmknodes" will both create an additional symlink when compared to the udev
>>> rules, and the additional symlink is not deleted when I deactivate the volume
>>> group.
>>>
>>> For what it's worth, in my lvm.conf I have "use_lvmetad = 0" and
>>>
>>> global_filter = [ "a|/dev/sda|", "a|/dev/drbd4|",  "a|/dev/sda6|", "r|.*|" ]
>>
>> And now we are getting to the point on your problem:
>>
>> "a|/dev/sda|"   will also match "a|/dev/sda6|"
>> (and /dev/sda5...)
>>
>> If you would like to get only 'exact' '/dev/sda' you would need to use
>>
>> ^/dev/sda$
>>
>> otherwise '/dev/sda' may appear anywhere as substring of your device path.
>
>
> Yes, the "/dev/sda" is intentional since we have multiple /dev/sda* devices
> that form part of various separate volume groups.  Really it's the /dev/sda6
> that is extra here since it's already matched.
>
> The problematic issue I'm seeing with udev/vgscan is actually with the volume
> group on /dev/drbd4.
>
> I really don't think I'm having any problems with duplicates...just with
> vgscan creating extra symlinks compared to udev, that udev doesn't clean up.
>

Ahh - ok then - I thought you wanted to see only sda6 on your machine.


Regards

Zdenek
