Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3FE85C1B5
	for <linux-lvm@redhat.com>; Thu, 11 Jul 2019 09:39:20 +0000 (UTC)
Received: from e2i64.smtp2go.com (e2i64.smtp2go.com [103.2.140.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 146D2308624A
	for <linux-lvm@redhat.com>; Thu, 11 Jul 2019 09:39:18 +0000 (UTC)
Received: from [10.45.79.71] (helo=SmtpCorp)
	by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92-S2G) (envelope-from <selbaz@linagora.com>)
	id 1hlVXo-cp4U6h-7Z
	for linux-lvm@redhat.com; Thu, 11 Jul 2019 09:39:16 +0000
Received: from [10.54.36.8] (helo=smtp.linagora.com)
	by smtpcorp.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.91) (envelope-from <selbaz@linagora.com>) id 1hlVXm-DuufVr-Fj
	for linux-lvm@redhat.com; Thu, 11 Jul 2019 09:39:14 +0000
Received: from [10.75.71.198] (reverse.completel.net [92.103.166.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.linagora.com (Postfix) with ESMTPSA id E9D89416CF
	for <linux-lvm@redhat.com>; Thu, 11 Jul 2019 11:39:12 +0200 (CEST)
References: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
	<7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
	<40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
	<d8224c32-56bd-4e53-1090-d86b2e904678@redhat.com>
	<1f54874c-d4da-2579-955e-73e6caa8613b@linagora.com>
	<a89a98b3-3bde-96f0-7f31-3a9ca26ef203@gmail.com>
	<34f1f2af-cc02-6678-39d6-02323dd0236e@linagora.com>
	<d19f0e9f-d4a9-5362-34ef-4b33b5990d07@redhat.com>
	<756972b8-53ad-946a-e2a7-f55eed0bcdf7@linagora.com>
From: Simon ELBAZ <selbaz@linagora.com>
Message-ID: <9b95869d-4693-a890-3340-41a05c7e7308@linagora.com>
Date: Thu, 11 Jul 2019 11:39:12 +0200
MIME-Version: 1.0
In-Reply-To: <756972b8-53ad-946a-e2a7-f55eed0bcdf7@linagora.com>
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
To: linux-lvm@redhat.com

Hi,

I have setup a Debian 10 VM to understand the issue.

root@sympa:~# uname -a
Linux sympa 4.19.0-5-amd64 #1 SMP Debian 4.19.37-5 (2019-06-19) x86_64 
GNU/Linux
root@sympa:~# lvdisplay /dev/sympa-vg/swap_1
   --- Logical volume ---
   LV Path                /dev/sympa-vg/swap_1
   LV Name                swap_1
   VG Name                sympa-vg
   LV UUID                1b59OW-M2yW-PuI1-QN5t-pN0w-6Akl-AnJnNh
   LV Write Access        read/write
   LV Creation host, time sympa, 2019-07-10 11:06:42 +0200
   LV Status              available
   # open                 2
   LV Size                <1,99 GiB
   Current LE             509
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           254:1

root@sympa:~# lsof | grep "254,1"
root@sympa:~# dmsetup info
Name:              sympa--vg-swap_1
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        2
Event number:      0
Major, minor:      254, 1
Number of targets: 1
UUID: LVM-Imuz5YW2OXfsyO2ChOPPLI5flib9YlLi1b59OWM2yWPuI1QN5tpN0w6AklAnJnNh

Name:              sympa--vg-root
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      254, 0
Number of targets: 1
UUID: LVM-Imuz5YW2OXfsyO2ChOPPLI5flib9YlLiJMF1vN1e6TKmfV1rT0fvWJnpViu7BMw5

root@sympa:~# lsof | grep swap_1

root@sympa:~#

Could someone pls give me some hints to verify the "open" value ?

Thanks

On 10/07/2019 15:37, Simon ELBAZ wrote:
> Thank you very much Zdenek.
>
> I will suggest the customer a kernel update.
>
> On 10/07/2019 15:32, Zdenek Kabelac wrote:
>> Dne 10. 07. 19 v 13:54 Simon ELBAZ napsal(a):
>>> Hi Zdenek,
>>>
>>> Thanks for your feedback.
>>>
>>> The kernel version is:
>>>
>>> [root@panoramix ~]# uname -a
>>> Linux panoramix.ch-perrens.fr 2.6.32-573.12.1.el6.x86_64 #1 SMP Tue 
>>> Dec 15 21:19:08 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux
>>>
>>
>> Hi
>>
>> So this is really a very historical kernel - released ~10 years back.
>> I'm afraid none is going to look out for the reasoning of any kernel 
>> bug....
>>
>> It might be interesting to see if you get any reproducer to give you 
>> hints
>> how to avoid this happen (at least not easily).
>>
>>> Jul  2 03:08:10 panoramix LVM(pri_ISCSIVG0_vg_obm)[18618]: INFO: 
>>> Retry deactivating volume group vg_obm
>>>
>>> This is why I am trying to understand how the field is computed.
>>
>> Simple rule applied here: DM devices in use (open_count > 0) cannot 
>> be deactivated.
>>
>> Occasionally there were 'race events' with udev - where device
>> which should have been otherwise unused has been asynchronously
>> opened by udev scanning rules - but that's like is not your case.
>>
>> As you seems to have device open count higher permanently -
>>
>> So if you are sure there is no running 'APP' after umount, that
>> keeps device open - it could be likely be some very old bug in kernel
>> with very high probably 99.99999% of being fixed ;)
>>
>> Regards
>>
>>
>> Zdenek
>>
-- 
Simon Elbaz
@Linagora
Mob: +33 (0) 6 38 99 18 34
Tour Franklin 31ème étage
100/101 Quartier Boieldieu
92042 La Défense
FRANCE
