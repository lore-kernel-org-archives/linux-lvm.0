Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5KLYiDD026854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 17:34:44 -0400
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B46E8535A
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 21:34:43 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id s63so19967ioi.3
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 14:34:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
From: Sergei Franco <sergei.franco@gmail.com>
Date: Tue, 21 Jun 2016 09:34:41 +1200
Message-ID: <CAKpgpNhCm3cMmpGBpiruF_0+s_n3NfkbjOH1EGHh91WnT=9Mgw@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thank you!

That clears up a few questions!


Regards.

Sergei.

On 21 June 2016 at 04:27, Brassow Jonathan <jbrassow@redhat.com> wrote:
>
>> On Jun 11, 2016, at 7:36 PM, sergei <sergei.franco@gmail.com> wrote:
>>
>> Hi,
>>
>> I have a few simple questions regarding relatively new feature LVM cache/dm-cache.
>>
>> From second hand information on internet, it appears that you cannot resize cached volume.
>> Please correct me if I am wrong: to resize a cached volume, one needs to lvremove the cache, resize and recreate the cache?
>
> This is true at the moment.  You are likely to be able to simply resize online in the future.
>
>> In scenario where cache device fails, how safe is the data on the cached LVM?
>
> If you are using writethrough, quite safe.  If you are using ‘writeback’, probably not (RAID for your cache in this case would probably be wise).
>
>> Is it possible to make snapshots of the cached device?
>
> easy answer is “no”.
>
> complicated answer includes a ‘yes’.  You can cache a poolDataLV, then your thinLV and all its thinSnaps would be cached.
>
>  brassow
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
