Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A73C117244
	for <linux-lvm@redhat.com>; Sat,  8 Apr 2017 14:14:59 +0000 (UTC)
Received: from nm6-vm8.bullet.mail.ir2.yahoo.com
	(nm6-vm8.bullet.mail.ir2.yahoo.com [212.82.96.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD0274E4CD
	for <linux-lvm@redhat.com>; Sat,  8 Apr 2017 14:14:57 +0000 (UTC)
References: <87a0048c-d443-bbda-5b27-ab7332278061@yahoo.co.uk>
	<483e1a7a-45c8-6a03-af3e-d54ecb8b3945@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <2b6d6c8c-52ef-6b30-532f-98f004fa7cb8@yahoo.co.uk>
Date: Sat, 8 Apr 2017 15:14:55 +0100
MIME-Version: 1.0
In-Reply-To: <483e1a7a-45c8-6a03-af3e-d54ecb8b3945@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvextend does not change/fix stripes & stripesize
 for the whole LV?
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



On 06/03/17 09:47, Zdenek Kabelac wrote:
> Dne 4.3.2017 v 14:58 lejeczek napsal(a):
>> right?
>> Or it does?
>> From man pages my understanding is - it does not, an 
>> expression "the
>> extension" is used there.
>>
>> If I have a LV with 2 stripes and 64KiB stripesizes, then 
>> adding two more
>> stripes, like this:
>>
>> $ lvextend h300Int1/0 -i 2 -I 16 /dev/sd3 /dev/sd4 (if it 
>> was to succeed)
>>
>> will change the LV into 4 stripes LV, but what would 
>> happened to stripesize(s)?
>>
>
> Hi
>
> At this moment lvm2 supports extension only of the same 
> types.
> So extended/added segment will have some 'geometry' as the 
> last/previous segment of your extended LV.
>
> So if you do not add any 'striping' parameters - they will 
> be automatically detected from LV, if you add them - they 
> will be compared and in case of mismatch operation will be 
> rejected.
>
> Also if the allocation policy and free space in VG allows 
> - extension will try first to extend existing segment 
> before allocating new space somewhere else in VG.
>
> Regards
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

now actually trying in practice:
an VG(just extended by /dev/sdf):

--- Physical volumes ---
   PV Name               /dev/sdd
   PV UUID               j0tyRo-k0EV-uvXv-8F3K-fQpc-LcyE-twIZs1
   PV Status             allocatable
   Total PE / Free PE    250390 / 0

   PV Name               /dev/sde
   PV UUID               jF0NlQ-Q4zd-zWr2-s0nb-kBzc-SmYj-SrgOnW
   PV Status             allocatable
   Total PE / Free PE    250390 / 0

   PV Name               /dev/sdc
   PV UUID               NoxH5O-6nvb-thAR-cHM6-VRTJ-gJyn-HK7y0c
   PV Status             allocatable
   Total PE / Free PE    250390 / 0

   PV Name               /dev/sdf
   PV UUID               27jeEj-frTR-wVQB-7Sg5-MZ6g-1eSV-RQuU8a
   PV Status             allocatable
   Total PE / Free PE    250390 / 250390

all these fail:
$ lvextend -v -i 4 -l+100%free dellH200.InternalB/0
$ lvextend -v -i 4 -l+100%pv dellH200.InternalB/0 /dev/sdf
$ lvextend -i 4 -l 100%vg dellH200.InternalB/0

is there a problem?
