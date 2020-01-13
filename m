Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EAB61004C6A
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 21:29:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0E0C8F7A07
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 21:29:12 +0000 (UTC)
Received: from postpony.nebelschwaden.de (v22018114346177759.hotsrv.de
	[194.55.14.20]) (Authenticated sender: postmaster@nebelschwaden.de)
	by mail.worldserver.net (Postfix) with ESMTPA id 7F80F300147
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 22:29:07 +0100 (CET)
Received: from [172.16.37.5] (kaperfahrt.nebelschwaden.de [172.16.37.5])
	by postpony.nebelschwaden.de (Postfix) with ESMTP id 3E9EBD248D
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 22:29:07 +0100 (CET)
From: Ede Wolf <listac@nebelschwaden.de>
References: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
	<080c04ff-e9cc-8a9e-da66-2c125a657d86@nebelschwaden.de>
	<28fac0e3-5853-76e2-5f9f-c4ae7b35c4a8@nebelschwaden.de>
	<bdbb0195-8b35-f732-1db8-641c3fbdc20f@redhat.com>
	<259b3ff3-9413-6e8d-56b3-1c17a1d22c0c@nebelschwaden.de>
	<0a242f0f-ba4f-79fd-caf0-d06c7eb13407@redhat.com>
	<74436e16-d2f6-71a0-c264-71ce417de08c@nebelschwaden.de>
Message-ID: <c23ce67f-cae3-f244-dd37-acb52cd95c57@nebelschwaden.de>
Date: Mon, 13 Jan 2020 22:29:07 +0100
MIME-Version: 1.0
In-Reply-To: <74436e16-d2f6-71a0-c264-71ce417de08c@nebelschwaden.de>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Sorry, did by mistake answer privately, not to the list.

Am 13.01.20 um 22:27 schrieb Ede Wolf:
> Hello,
> 
> unfortunately, as everything looked all right after the swap, I've 
> deleted the too big metadata pool.
> Should have tried to actually mount the LVs, but as they where online 
> and not errors reported, I proceeded.
> 
> Just while trying to rezise (where the big pool had to go, as otherwise 
> I would not have had the space to resize) I ran across the transaction 
> ID error. That even did not look fatal, until I noted, nothing has 
> happened.
> 
> So now I have one pool with the transaction ID error, that upon after 
> manual fixing claims no data available, and two "repaired" versions of 
> that metadatapool.
> 
> Ede
> 
> 
> Am 13.01.20 um 20:11 schrieb Zdenek Kabelac:
>> Dne 13. 01. 20 v 17:35 Ede Wolf napsal(a):
>>> Hello Marian,
>>>
>>> thanks for that advice, but my� thin-provisioning-tools already� are 
>>> at version 0.8.5
>>>
>>> Basically I consider the data now lost.
>>>
>>
>> Hi
>>
>> Why do you think they are lost ?
>>
>> Don't you have any 'valid' LV with metadata ?
>>
>> You can use your 'too big' metadava LV and 'thin_repair' it to 
>> appropritely sized one -� it should work easily.
>>
>> Regards
>>
>> Zdenek
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
