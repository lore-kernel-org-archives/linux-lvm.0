Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7PBpnoA010820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 07:51:50 -0400
Received: from nm6-vm7.bullet.mail.ir2.yahoo.com
	(nm6-vm7.bullet.mail.ir2.yahoo.com [212.82.96.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8926EC0567A1
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 11:51:48 +0000 (UTC)
References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
Date: Thu, 25 Aug 2016 12:51:46 +0100
MIME-Version: 1.0
In-Reply-To: <9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM cache/dm-cache questions.
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

question I'd like to ask is: how to LUKS encrypt cache pool LV ?

many thanks.
L.

On 20/06/16 17:27, Brassow Jonathan wrote:
>> On Jun 11, 2016, at 7:36 PM, sergei <sergei.franco@gmail.com> wrote:
>>
>> Hi,
>>
>> I have a few simple questions regarding relatively new feature LVM cache/dm-cache.
>>
>>  From second hand information on internet, it appears that you cannot resize cached volume.
>> Please correct me if I am wrong: to resize a cached volume, one needs to lvremove the cache, resize and recreate the cache?
> This is true at the moment.  You are likely to be able to simply resize online in the future.
>
>> In scenario where cache device fails, how safe is the data on the cached LVM?
> If you are using writethrough, quite safe.  If you are using ‘writeback’, probably not (RAID for your cache in this case would probably be wise).
>
>> Is it possible to make snapshots of the cached device?
> easy answer is “no”.
>
> complicated answer includes a ‘yes’.  You can cache a poolDataLV, then your thinLV and all its thinSnaps would be cached.
>
>   brassow
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
