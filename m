Message-ID: <5204B905.5040702@redhat.com>
Date: Fri, 09 Aug 2013 11:40:21 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20130806173719.GB15184@mail.waldi.eu.org>
	<520211BB.2040301@pse-consulting.de> <5202164B.5010302@redhat.com>
	<52028170.1010000@pse-consulting.de> <52036C86.3040702@redhat.com>
	<5204A0EF.7010803@pse-consulting.de>
In-Reply-To: <5204A0EF.7010803@pse-consulting.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Missing error handling in lv_snapshot_remove
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
Cc: Andreas Pflug <pgadmin@pse-consulting.de>

Dne 9.8.2013 09:57, Andreas Pflug napsal(a):
> Am 08.08.13 12:01, schrieb Zdenek Kabelac:
>> Dne 7.8.2013 19:18, Andreas Pflug napsal(a):
>>> On 08/07/13 11:41, Zdenek Kabelac wrote:
>>>> Dne 7.8.2013 11:22, Andreas Pflug napsal(a):
>>>>> Am 06.08.13 19:37, schrieb Bastian Blank:
>>>>>> Hi
>>>>>>
>>>>>> I tried to tackle a particular bug that shows up in Debian for
>>>>>> some time
>>>>>> now. Some blamed the udev rules and I still can't completely rule
>>>>>> them
>>>>>> out. But this triggers a much worse bug in the error cleanup of the
>>>>>> snapshot remove. I reproduced this with Debian/Linux 3.2.46/LVM
>>>>>> 2.02.99
>>>>>> without udevd running and Fedora 19/LVM 2.02.98-10.fc19.
>>>>>>
>>>>>> On snapshot removal, LVM first converts the device into a regular LV
>>>>>> (lv_remove_snapshot) and in a second step removes this LV
>>>>>> (lv_remove_single). Is there a reason for this two step removal? An
>>>>>> error during removal leaves a non-snapshot LV behind.
>>>>> Ah, this explains why sometimes my backup stops: I take a snapshot,
>>>>> rsync the stuff and remove the snapshot with a daily cron job, but I
>>>>> observed twice that a non-snapshot volume named like a backup snapshot
>>>>> was lingering around, preventing the script to work. So this is no
>>>>> exotic corner case, but happens in real life.
>>>>>
>>>>> I observe this since I dist-upgraded to wheezy.
>>>>>
>>>>
>>>> Because Debian is using non-upstream udev rules.
>>>>
>>>> With upstream udev rules with standard real-life use, this situation
>>>> cannot happen - since these rules are constructed to play better with
>>>> udev WATCH rule.
>>>
>>> Hm, does udev play a role on this at all? Without having dived the
>>> code, I'd
>>> assume udev has only to do with creation and deletion of /dev/mapper/...
>>> and/or /dev/vgname/... devices (upon lvchange -aX), but not with lvm
>>> metadata
>>> manipulation.
>>
>>
>> Udev attempts to update it device database after any change event
>> (you could observe its work with udevadm monitor)
>>
>> So in your case -  you unmount filesystem -> close device -> fires
>> WATCH event with some randomly delayed (systemd)udevd scan machism -
>> so in unpredictable moment blkid opens device and scans its sectors
>> (keeping device open and interfering with deactivate operation). For
>> this short-time opens there is now built-in retry which tries to
>> deactivate device several times when it's known device is not mounted.
>
> So in order to harden my script against this problem, I should
> deactivate the volume explicitely, wait a while and then remove it?

If you call  'udevadm settle'  after umount --  it will wait till udev
finishes its work.

However recent lvm2 has the 'retry' loop built-in - so it should not be needed 
if the proper udev rules are in place.

Zdenek
