Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 965EA10DCF4A
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 16:35:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9A80802823
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 16:35:03 +0000 (UTC)
Received: from postpony.nebelschwaden.de (v22018114346177759.hotsrv.de
	[194.55.14.20]) (Authenticated sender: postmaster@nebelschwaden.de)
	by mail.worldserver.net (Postfix) with ESMTPA id A420A3001AB
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 17:34:59 +0100 (CET)
Received: from [172.16.37.5] (kaperfahrt.nebelschwaden.de [172.16.37.5])
	by postpony.nebelschwaden.de (Postfix) with ESMTP id 5C9EDD2467
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 17:34:59 +0100 (CET)
References: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
	<080c04ff-e9cc-8a9e-da66-2c125a657d86@nebelschwaden.de>
	<28fac0e3-5853-76e2-5f9f-c4ae7b35c4a8@nebelschwaden.de>
	<bdbb0195-8b35-f732-1db8-641c3fbdc20f@redhat.com>
From: Ede Wolf <listac@nebelschwaden.de>
Message-ID: <259b3ff3-9413-6e8d-56b3-1c17a1d22c0c@nebelschwaden.de>
Date: Mon, 13 Jan 2020 17:35:00 +0100
MIME-Version: 1.0
In-Reply-To: <bdbb0195-8b35-f732-1db8-641c3fbdc20f@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] metadata device too small
Reply-To: listac@nebelschwaden.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hello Marian,

thanks for that advice, but my  thin-provisioning-tools already  are at 
version 0.8.5

Basically I consider the data now lost.

Am 13.01.20 um 16:02 schrieb Marian Csontos:
> On 1/11/20 11:07 PM, Ede Wolf wrote:
> 
>>>> Is there any way to make the data accessible again?
>>>>
>>>> lvm2 2.02.186
> 
> lvm2 version is not that important in this case, you will want to try a 
> newer thin-provisioning-tools package.
> 
> I see the newest version in Ubuntu is 0.7.6 while upstream is at 0.8.5 
> with some bugs in thin metadata repair fixed.
> 
> You can compile yourself, or could try using e.g. live Fedora 31 with up 
> to date package.
> 
> -- Marian
> 
> 
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
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
> 
