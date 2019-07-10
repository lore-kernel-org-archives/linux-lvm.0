Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 298551001943
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2019 13:37:08 +0000 (UTC)
Received: from e2i64.smtp2go.com (e2i64.smtp2go.com [103.2.140.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6178146233
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2019 13:37:05 +0000 (UTC)
References: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
	<7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
	<40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
	<d8224c32-56bd-4e53-1090-d86b2e904678@redhat.com>
	<1f54874c-d4da-2579-955e-73e6caa8613b@linagora.com>
	<a89a98b3-3bde-96f0-7f31-3a9ca26ef203@gmail.com>
	<34f1f2af-cc02-6678-39d6-02323dd0236e@linagora.com>
	<d19f0e9f-d4a9-5362-34ef-4b33b5990d07@redhat.com>
From: Simon ELBAZ <selbaz@linagora.com>
Message-ID: <756972b8-53ad-946a-e2a7-f55eed0bcdf7@linagora.com>
Date: Wed, 10 Jul 2019 15:37:01 +0200
MIME-Version: 1.0
In-Reply-To: <d19f0e9f-d4a9-5362-34ef-4b33b5990d07@redhat.com>
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

Thank you very much Zdenek.

I will suggest the customer a kernel update.

On 10/07/2019 15:32, Zdenek Kabelac wrote:
> Dne 10. 07. 19 v 13:54 Simon ELBAZ napsal(a):
>> Hi Zdenek,
>>
>> Thanks for your feedback.
>>
>> The kernel version is:
>>
>> [root@panoramix ~]# uname -a
>> Linux panoramix.ch-perrens.fr 2.6.32-573.12.1.el6.x86_64 #1 SMP Tue 
>> Dec 15 21:19:08 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux
>>
>
> Hi
>
> So this is really a very historical kernel - released ~10 years back.
> I'm afraid none is going to look out for the reasoning of any kernel 
> bug....
>
> It might be interesting to see if you get any reproducer to give you 
> hints
> how to avoid this happen (at least not easily).
>
>> Jul  2 03:08:10 panoramix LVM(pri_ISCSIVG0_vg_obm)[18618]: INFO: 
>> Retry deactivating volume group vg_obm
>>
>> This is why I am trying to understand how the field is computed.
>
> Simple rule applied here: DM devices in use (open_count > 0) cannot be 
> deactivated.
>
> Occasionally there were 'race events' with udev - where device
> which should have been otherwise unused has been asynchronously
> opened by udev scanning rules - but that's like is not your case.
>
> As you seems to have device open count higher permanently -
>
> So if you are sure there is no running 'APP' after umount, that
> keeps device open - it could be likely be some very old bug in kernel
> with very high probably 99.99999% of being fixed ;)
>
> Regards
>
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
