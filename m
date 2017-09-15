Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F8671C86
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 12:00:57 +0000 (UTC)
Received: from sonic304-22.consmr.mail.ir2.yahoo.com
	(sonic304-22.consmr.mail.ir2.yahoo.com [77.238.179.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92B17C04D2AB
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 12:00:55 +0000 (UTC)
References: <13f08f25-6b16-e930-b609-4cd2799b08da@yahoo.co.uk>
	<666DE320-FD89-4208-8056-DB6AA4F370B1@redhat.com>
	<f0c18f73-7f53-c64b-2a42-33dbabd9264d@yahoo.co.uk>
	<D9004294-FE5F-416F-95C4-C74D9681DB86@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <0375938e-4a89-1432-9e31-94b54bcf2ec0@yahoo.co.uk>
Date: Fri, 15 Sep 2017 12:59:45 +0100
MIME-Version: 1.0
In-Reply-To: <D9004294-FE5F-416F-95C4-C74D9681DB86@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Subject: Re: [linux-lvm] raid & its stripes
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
To: LVM general discussion and development <linux-lvm@redhat.com>



On 15/09/17 03:20, Brassow Jonathan wrote:
> There is definitely a difference here.  You have 2 stripes with 5 devices in each stripe.  If you were writing sequentially, you’d be bouncing between the first 2 devices until they are full, then the next 2, and so on.
>
> When using the -i argument, you are creating 10 stripes.  Writing sequentially causes the writes to go from one device to the next until all are written and then starts back at the first.  This is a very different pattern.
>
> I think the result of any benchmark on these two very different layouts would be significantly different.
>
>   brassow
>
> BTW, I swear at one point that if you did not provide the ‘-i’ it would use all of the devices as a stripe, such that your two examples would result in the same thing.  I could be wrong though.
>
that's what I thought I remembered too.
I guess a big question, from user/admin perspective is: are 
those two stripes LVM decides on(when no -i) is the best 
possible choice LVM makes after some elaborative 
determination so the number of stripes(no -i) would, might 
vary depending on raid type, phy devices number and maybe 
some other factors or, 2 stripes are simply hard-coded defaults?


>> On Sep 14, 2017, at 10:49 AM, lejeczek <peljasz@yahoo.co.uk> wrote:
>>
>>
>>
>> On 14/09/17 15:58, Brassow Jonathan wrote:
>>> Seems strange on the surface.  Would you mind posting the layout of each?  ‘lvs -a -o +devices’
>>>
>>>   brassow
>> here is for LV created without -i, both times with & without I supplied all ten(all that VG has) pvs as arguments to lvcreate.
>>
>> $ lvs -a -o +devices,stripes,stripe_size chenbro0.1
>>    LV                 VG         Attr       LSize  Pool Origin Data% Meta%  Move Log Cpy%Sync Convert Devices                                 #Str Stripe
>>    raid0.A            chenbro0.1 rwi-aor--- 21.18t raid0.A_rimage_0(0),raid0.A_rimage_1(0)    2 16.00k
>>    [raid0.A_rimage_0] chenbro0.1 iwi-aor--- 10.59t /dev/sdak(0)                               1     0
>>    [raid0.A_rimage_0] chenbro0.1 iwi-aor--- 10.59t /dev/sdam(0)                               1     0
>>    [raid0.A_rimage_0] chenbro0.1 iwi-aor--- 10.59t /dev/sdao(0)                               1     0
>>    [raid0.A_rimage_0] chenbro0.1 iwi-aor--- 10.59t /dev/sdaq(0)                               1     0
>>    [raid0.A_rimage_0] chenbro0.1 iwi-aor--- 10.59t /dev/sdas(0)                               1     0
>>    [raid0.A_rimage_0] chenbro0.1 iwi-aor--- 10.59t /dev/sdau(0)                               1     0
>>    [raid0.A_rimage_1] chenbro0.1 iwi-aor--- 10.59t /dev/sdal(0)                               1     0
>>    [raid0.A_rimage_1] chenbro0.1 iwi-aor--- 10.59t /dev/sdan(0)                               1     0
>>    [raid0.A_rimage_1] chenbro0.1 iwi-aor--- 10.59t /dev/sdap(0)                               1     0
>>    [raid0.A_rimage_1] chenbro0.1 iwi-aor--- 10.59t /dev/sdar(0)                               1     0
>>    [raid0.A_rimage_1] chenbro0.1 iwi-aor--- 10.59t /dev/sdat(0)                               1     0
>>    [raid0.A_rimage_1] chenbro0.1 iwi-aor--- 10.59t /dev/sdav(0)                               1     0
>>
>> I cannot remove this LV for a while thus will not be able to recreate with -i for now, sorry.
>>
>>>> On Sep 13, 2017, at 8:53 AM, lejeczek <peljasz@yahoo.co.uk> wrote:
>>>>
>>>> hi boys, girls
>>>>
>>>> man page reads: -i ...This is equal to the number of physical volumes to scatter the  logical  volume data....
>>>> I wonder, when I do not use -i while creating an LV with 10 phy devs.
>>>>
>>>> $ lvcreate -n raid0.A --type raid0 -I 16 -l 97%pv
>>>>
>>>> a dbench would show:
>>>> $ dbench -t 60 20
>>>> ...
>>>> Throughput 112.309 MB/sec  20 clients  20 procs  max_latency=719.409 ms
>>>>
>>>> Yet when I say: this many stripes:
>>>>
>>>> $ lvcreate -n raid0.A --type raid0 -I 16 -i 10 -l 97%pv
>>>>
>>>> dbench:
>>>> ...
>>>> Throughput 83.2822 MB/sec  20 clients  20 procs  max_latency=816.027 ms
>>>>
>>>> And though the results would vary, xfs, a dbench for LV with no -i as an argument(which LVM chooses then to be 2) would always look better.
>>>> And I thought, as in the manual, always make stripes to go to all phy devices.
>>>>
>>>> Question - is there some "little" magic LVM does? And if yes then how/what it is?
>>>> many thanks, L.
>>>>
>>>> .
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> .
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


.
