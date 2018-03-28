Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9D79620A0
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2018 10:09:16 +0000 (UTC)
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BD5565CFF
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2018 10:09:14 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id u9so1149845ual.13
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2018 03:09:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5bf42865-57aa-9bbf-9d0b-2e2e34d74a8c@redhat.com>
References: <5efc943a1039bda80e77469afbfffd3d323c9a8f.camel@fladi.at>
	<5bf42865-57aa-9bbf-9d0b-2e2e34d74a8c@redhat.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 28 Mar 2018 05:08:52 -0500
Message-ID: <CAAMCDecBhszSbP=-_zeSevEhfDgLyhowADR7ySmZFYnsSEvR2g@mail.gmail.com>
Subject: Re: [linux-lvm] Cannot create PV on /dev/dm-NN (/dev/dm-N works)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Michael Fladischer <michael@fladi.at>

I suggest you should never directly be touching the /dev/dm* devices
via that name.

Always touch the actual named device (/dev/mpath, /dev/vgname/lv  A
given dm device can be a number of other devices (lv,s, mpath, mpath
components, encrypted device, md raid, and probably some others).
From just the dm* name you really don't know which kind of device it
is, and there is a lot of risk of confusion and/or data loss.

I have debugged situations were someone went in and partitioned all of
their /dev/dm* devices and some of those devices were actually the
LV's and others were they created PV's on other LV's.   Without a few
commands you cannot easily know what the dm* device is, so access it
via the more sensibly named device.



On Wed, Mar 28, 2018 at 3:27 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> Dne 27.3.2018 v 12:38 Michael Fladischer napsal(a):
>>
>> Hi,
>>
>> I'm unable to create PVs on Multipath-Volumes that are available at
>> /dev/dm-NN where N~[0-9] but I can create them on single digit devices
>> like /dev/dm-9:
>>
>> # pvcreate /dev/dm-6
>>    Physical volume "/dev/dm-6" successfully created.
>>
>> # pvcreate /dev/dm-16
>>    Device /dev/dm-16 not found (or ignored by filtering).
>>
>> My Version of LVM is 2.02.168 from Debian 9.
>> The filter ist set to a permissive value:
>>    filter = [ "a|.*|" ]
>>    global_filter = [ "a|.*|" ]
>>
>> Any ideas why two or more digits in the device path can cause it to be
>> filtered by pvcreate?
>>
>
>
>
> Hi
>
>
> lvm2 is detecting  multipath 'component' devices - those are not allowed to
> be used for pvcreate.
>
> You can use  'pvcreate -vvv' to get more information - there will be printed
> the reason why devices are rejected....
>
> Eventually if you can't figure this out yourself - provide this trace in
> attachment.
>
>
> Regards
>
> Zdenek
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
