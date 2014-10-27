Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9R9FscT014970
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2014 05:15:54 -0400
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9R9Fprr018413
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2014 05:15:53 -0400
Received: by mail-lb0-f169.google.com with SMTP id l4so271792lbv.14
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2014 02:15:51 -0700 (PDT)
Received: from [10.34.130.202] (nat-pool-brq-t.redhat.com. [209.132.186.34])
	by mx.google.com with ESMTPSA id h9sm4746756lae.44.2014.10.27.02.15.48
	for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Oct 2014 02:15:50 -0700 (PDT)
Message-ID: <544E0D43.6010606@gmail.com>
Date: Mon, 27 Oct 2014 10:15:47 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>	<544B9ADD.6040607@redhat.com>	<CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>	<544C05A2.8090004@redhat.com>	<CACaajQtQ+h2NBhiH=Y-zET1cK7PE=5=PFoeSgLQqwnr9PiY0Cw@mail.gmail.com>	<544C2897.6020708@redhat.com>
	<CACaajQtovTJHJQCh1uR7jojxyrpsjcrbO65qngyO6DvuDnYHWw@mail.gmail.com>
In-Reply-To: <CACaajQtovTJHJQCh1uR7jojxyrpsjcrbO65qngyO6DvuDnYHWw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [dm-devel] fix corrupted thin pool
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

Dne 26.10.2014 v 20:46 Vasiliy Tolstov napsal(a):
> 2014-10-26 2:47 GMT+04:00 Zdenek Kabelac <zkabelac@redhat.com>:
>>  From the metadata  something bad was going one:
>>
>> Fri Oct 24 17:03:04 2014
>>
>> transaction_id = 120  - create = "3695"
>>
>> And suddenly on Fri Oct 24 18:07:23 2014
>> pool is back on older transaction_id
>>
>> transaction_id = 114
>>
>>
>> Is that the time of your vgcfgrestore?
>>
>> I'm attaching those metadata which you likely should put back to get in sync
>> with your kernel metadata (assuming you have not modified those in any way)
>
>
> Hm yes, i miss that one vg created in this time, thanks. As i
> understand transaction id needs to be changed? Or something other?
> But i have error:
>
> lvchange -ay vg1/2735
>    Check of thin pool vg1/tp1 failed (status:1). Manual repair required
> (thin_dump --repair /dev/mapper/vg1-tp1_tmeta)!
>


If you would have latest lvm2 tools - you could have tried:

lvconvert --repair  vg/pool


With older tools - you need to go in these manual step:


1. create temporary small LV
# lvcreate -an -Zn -L10 --name temp vg

2. replace pool's metadata volume with this tempLV
# lvconvert --thinpool vg/pool  --poolmetadata temp
(say 'y' to swap)

3. activate & repair metadata from 'temp' volume - you will likely need 
another volume where to store repaire metadata -
so create:
# lvcreate -Lat_least_as_big_as_temp  --name repaired  vg
# lvchage -ay vg/temp
# thin_repair -i /dev/vg/temp  /dev/vg/repaired

if everything when fine - compare visualy 'transaction_id' of repaired 
metadata  (thin_dump /dev/vg/repaired)

4. swap deactivated repaired volume back to your thin-pool
# lvchange -an vg/repaired
# lvconvert --thinpool vg/pool --poolmetadata repaired

try to activate pool -  if it doesn't work report more problems.

Zdenek
