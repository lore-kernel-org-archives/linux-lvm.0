Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4HDml0J031605
	for <linux-lvm@redhat.com>; Tue, 17 May 2016 09:48:47 -0400
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <573B1812.3080802@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <573B213E.7060807@redhat.com>
Date: Tue, 17 May 2016 15:48:46 +0200
MIME-Version: 1.0
In-Reply-To: <573B1812.3080802@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
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

On 17.5.2016 15:09, Gionatan Danti wrote:
>
>
>> Well yeah - ATM we rather take 'early' action and try to stop any user
>> on overfill thin-pool.
>>
>
> It is a very reasonable standing
>
>>
>>
>> Basically whenever  'lvresize' failed - dmeventd plugin now tries
>> to unconditionally umount any associated thin-volume with
>> thin-pool above threshold.
>>
>>
>>
>> For now  -  plugin   'calls'  the tool - lvresize --use-policies.
>> If this tool FAILs for ANY  reason ->  umount will happen.
>>
>> I'll probably put in 'extra' test that 'umount' happens
>> with  >=95% values only.
>>
>> dmeventd  itself has no idea if there is configure 100 or less - it's
>> the lvresize to see it - so even if you set 100% - and you have enabled
>> monitoring  - you will get umount (but no resize)
>>
>>
>
> Ok, so the "failed to resize" error is also raised when no actual resize
> happens, but the call to the "dummy" lvresize fails. Right?

Yes - in general - you've witnessed  general tool failure,
and dmeventd is not 'smart' to recognize the reason of failure.

Normally this 'error' should not happen.

And while I'd even say there could have been a 'shortcut'
without even reading VG 'metadata' - since there is profile support,
it can't be known (100% threshold) without actually reading metadata
(so it's quite tricky case anyway)

>>
>> Well 'lvmetad' shall not crash, ATM this may kill commands - and further
>> stop processing - as we rather 'stop' further usage rather than allowing
>> to cause bigger damage.
>>
>> So if you have unusual system/device setup causing  'lvmetad' crash -
>> open BZ,
>> and meawhile  set   'use_lvmetad=0' in your lvm.conf till the bug is fixed.
>>
>
> My 2 cents are that the last "yum upgrade", which affected the lvm tools,
> needed a system reboot or at least the restart of the lvm-related services
> (dmeventd and lvmetad). The strange thing is that, even if lvmetad crashed, it
> should be restartable via the lvm2-lvmetad.socket systemd unit. Is this a
> wrong expectation?


Assuming you've been bitten by this one:

https://bugzilla.redhat.com/1334063

possibly? targeted by this commit:

https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=7ef152c07290c79f47a64b0fc81975ae52554919

Regards

Zdenek
