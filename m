Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05C8719C59
	for <linux-lvm@redhat.com>; Tue, 16 Jul 2019 08:57:10 +0000 (UTC)
Received: from e2i64.smtp2go.com (e2i64.smtp2go.com [103.2.140.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B4283084248
	for <linux-lvm@redhat.com>; Tue, 16 Jul 2019 08:57:07 +0000 (UTC)
References: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
	<7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
	<40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
	<d8224c32-56bd-4e53-1090-d86b2e904678@redhat.com>
	<1f54874c-d4da-2579-955e-73e6caa8613b@linagora.com>
	<a89a98b3-3bde-96f0-7f31-3a9ca26ef203@gmail.com>
	<34f1f2af-cc02-6678-39d6-02323dd0236e@linagora.com>
	<d19f0e9f-d4a9-5362-34ef-4b33b5990d07@redhat.com>
	<756972b8-53ad-946a-e2a7-f55eed0bcdf7@linagora.com>
	<9b95869d-4693-a890-3340-41a05c7e7308@linagora.com>
	<fb5379cd-7260-d2fa-4abe-7ffd05f635cb@redhat.com>
	<75cb7cc1-c863-86de-4a31-ca2a2ffa23dd@linagora.com>
	<adba2e2b-add1-6a3e-fe85-334369e59735@redhat.com>
From: Simon ELBAZ <selbaz@linagora.com>
Message-ID: <5dfb4dd2-3cd8-2bd5-e6a7-c484995655c8@linagora.com>
Date: Tue, 16 Jul 2019 10:57:00 +0200
MIME-Version: 1.0
In-Reply-To: <adba2e2b-add1-6a3e-fe85-334369e59735@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US-large
Subject: Re: [linux-lvm] lvdisplay "open" field computing
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi Zdenek,

Finally, it was veeamsnap that was mounting the LV.

It is a kernel module used by Veeambackup.

This is why - as you explained me - I could not see it with lsof command.

Regards

Simon

On 12/07/2019 15:07, Zdenek Kabelac wrote:
> Dne 12. 07. 19 v 14:38 Simon ELBAZ napsal(a):
>> Hi,
>>
>  root@sympa:~# swapon /dev/sympa-vg/swap_1
>> root@sympa:~# lvdisplay
>> ...
>>
>>    --- Logical volume ---
>>    LV Path                /dev/sympa-vg/swap_1
>>    LV Name                swap_1
>>    VG Name                sympa-vg
>>    LV UUID                1b59OW-M2yW-PuI1-QN5t-pN0w-6Akl-AnJnNh
>>    LV Write Access        read/write
>>    LV Creation host, time sympa, 2019-07-10 11:06:42 +0200
>>    LV Status              available
>>    # open                 2
>>    LV Size                <1,99 GiB
>>    Current LE             509
>>    Segments               1
>>    Allocation             inherit
>>    Read ahead sectors     auto
>>    - currently set to     256
>>    Block device           254:1
>>
>> I wonder if there is a similar tool for regular filesystem types.
>>
>
> Hi
>
>
> See:  mount
>
> or
>
> /proc/self/mountinfo
>
>
> Regards
>
> Zdenek
>
-- 
Simon Elbaz
@Linagora
Mob: +33 (0) 6 38 99 18 34
Tour Franklin 31ème étage
100/101 Quartier Boieldieu
92042 La Défense
FRANCE
