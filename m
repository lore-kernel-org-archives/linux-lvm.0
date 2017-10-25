Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF2F5C8BF
	for <linux-lvm@redhat.com>; Wed, 25 Oct 2017 11:45:05 +0000 (UTC)
Received: from sonic308-18.consmr.mail.ir2.yahoo.com
	(sonic308-18.consmr.mail.ir2.yahoo.com [77.238.178.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EA67C058ED7
	for <linux-lvm@redhat.com>; Wed, 25 Oct 2017 11:45:04 +0000 (UTC)
References: <f0cb5c37-29b1-e9d6-30ae-a0b5800f65d6@yahoo.co.uk>
	<0bed0c25-ed17-1862-eeaa-860c84e07b4d@yahoo.co.uk>
	<DB5D3605-AC6B-41C2-843D-93D39FBAFED3@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <650321b1-862b-a020-f4d9-0fd66d5ef76e@yahoo.co.uk>
Date: Wed, 25 Oct 2017 12:45:01 +0100
MIME-Version: 1.0
In-Reply-To: <DB5D3605-AC6B-41C2-843D-93D39FBAFED3@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Subject: Re: [linux-lvm] lvm raid: pvmove vs lvconvert
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

lvm has fantastic man pages, would be great if "--replace" 
was shortly explained in context of raid0.
Would it work? does it move data?

On 24/10/17 20:45, Brassow Jonathan wrote:
> You could use either, I suppose.  The replace will pull out the RAID member and replace it with a new one.  pvmove will create a temporary mirror for the member being moved.  I don’t think it makes a huge difference which you use, but I would tend to use ‘lvconvert --replace’ when working with RAID segment types.
>
>   brassow
>
>
>
>> On Oct 18, 2017, at 9:54 AM, lejeczek <peljasz@yahoo.co.uk> wrote:
>>
>>
>>
>> On 18/10/17 15:42, lejeczek wrote:
>>> hi there
>>>
>>> in lvm raid LVs, which one should be used and how do they differ - would you know? Are they meant for different things?
>>>
>> sorry, I'm thinking specifically of: lvconvert --replace VS pvmove
>>
>>> many thanks, L.
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
