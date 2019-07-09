Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C4975F7C1
	for <linux-lvm@redhat.com>; Tue,  9 Jul 2019 15:12:59 +0000 (UTC)
Received: from e2i64.smtp2go.com (e2i64.smtp2go.com [103.2.140.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 812243086226
	for <linux-lvm@redhat.com>; Tue,  9 Jul 2019 15:12:16 +0000 (UTC)
References: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
	<7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
From: Simon ELBAZ <selbaz@linagora.com>
Message-ID: <40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
Date: Tue, 9 Jul 2019 17:12:10 +0200
MIME-Version: 1.0
In-Reply-To: <7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
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

Thanks for your answer.

 From your explanation, open=2 should '"normally" not happen ?

Regards

Simon

On 09/07/2019 17:06, Zdenek Kabelac wrote:
> Dne 09. 07. 19 v 11:47 Simon ELBAZ napsal(a):
>> Hi,
>>
>> I am trying to understand how the open field is computed.
>>
>> On a CentOS6 server, lvdisplay has the following output:
>>
>> /lvdisplay /dev/mapper/vg_obm-var_spool_imap //
>> //  --- Logical volume ---//
>> //  LV Path                /dev/vg_obm/var_spool_imap//
>> //  LV Name                var_spool_imap//
>> //  VG Name                vg_obm//
>> //  LV UUID 0oK7h0-tDZH-eUxE-AyBw-cK7x-U9pS-W7X4Uh//
>> //  LV Write Access        read/write//
>> //  LV Creation host, time panoramix.ch-perrens.fr, 2015-01-16 
>> 11:03:10 +0100//
>> //  LV Status              available//
>> //  # open                 2//
>> //  LV Size                1,92 TiB//
>> //  Current LE             504572//
>> //  Segments               2//
>> //  Allocation             inherit//
>> //  Read ahead sectors     auto//
>> //  - currently set to     256//
>> //  Block device           253:3//
>> /
>>
>>   And dmsetup show the following info:
>>
>> /# dmsetup info -c | grep "253" | grep " 3"//
>> //vg_obm-var_spool_imap                 253   3 L--w    2 2 0 
>> LVM-1i1v6pEjab2WslaDQRvkf8eLk6QfBW4J0oK7h0tDZHeUxEAyBwcK7xU9pSW7X4Uh/
>>
>> Could you please give me some hint to understand how "open = 2" is 
>> obtained ?
>>
>>
>
> Hi
>
> Open field is counted in DM driver.
> Whenever device is opened - +1   - closed -1.
>
> You should be able to check 'lsof' to check and see if there are any 
> userspace openners.  But you will not see 'kernel' opens this ways.
>
> So i.e. if you mount DM device - it should be 1 open.
>
> Occasionally you can hit some bug in target drivers - then counters 
> can go crazy and become confusing - then your solution is to collect 
> as much
> info as possible - and reboot....
>
> Regards
>
> Zdenek
>
