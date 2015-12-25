Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBP6dlHc032409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 25 Dec 2015 01:39:47 -0500
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mx1.redhat.com (Postfix) with ESMTPS id 1B9B88AE72
	for <linux-lvm@redhat.com>; Fri, 25 Dec 2015 06:39:46 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id o11so107969570qge.2
	for <linux-lvm@redhat.com>; Thu, 24 Dec 2015 22:39:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <567BB51A.4070101@redhat.com>
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
Date: Fri, 25 Dec 2015 10:27:20 +0800
Message-ID: <CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: Re: [linux-lvm] Possible bug in expanding thinpool: lvextend
 doens't expand the top-level dm-linear device
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

Hi,

Sorry, what's the purpose of commit cd8e95d9337207a8f87a6f68dc9b1db7e3828bbf ?

Another issue is, the current code suspends the first thin volume
(just the first one!)
while extending a thinpool, which is unnecessary and also harms IO performance.

Also, If the top-level "fake" pool device is unimportant, why not
remove it, or simply
make tp1 as a thin-pool target? It seems that the commit 00a45ca4 want
to do this,
it removes the -tpool layer while activating a new thinpool. But if
there are thin
volumes, the -tpool layer back again. This make me confused -- Do we really need
layers?


Thanks,
Ming-Hung Tsai

2015-12-24 17:04 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> Dne 23.12.2015 v 10:50 M.H. Tsai napsal(a):
>
>> After running lvextend, the table of vg1-tp1_tdata and vg1-tp1-tpool
>> are expanded, but the dm-linear table of vg1-tp1 remains unchanged.
>>
>> I think that the function _lv_update_and_reload() erroneously operates
>> on the holder of of tp1, that is, lvol0. This might be caused by
>> commit fa64823, hence the subsequent actions runs on the lock_lv. The
>> verbose output also shows that the tree_action() is running on lvol0,
>> not tp1.
>>
>> Creating PRELOAD tree for vg1/lvol0.
>> Creating SUSPEND tree for vg1/lvol0.
>> Creating ACTIVATE tree for vg1/lvol0.
>> Creating CLEAN tree for vg1/lvol0.
>>
>> Is that a bug?
>>
>>
>> Thanks,
>> Ming-Hung Tsai
>
>
> Hi
>
> Please check with commit cd8e95d9337207a8f87a6f68dc9b1db7e3828bbf included
> (2.02.139).
>
> It's been known issue, the size of top-level 'fake' pool device is however
> not really important - no one should be actually using it and the size could
> have been artificial.
>
> In fact - I do plan to rework this 'pool' device 'faking' to avoid need
> of this 'extra' device - but it's 'a little bit' complex - so it will take
> some time (I've even fix to correct the size of fake device - but then I've
> realized it would be actually much better without it)
>
> So do not worry about the size of this device - the only device which does
> matter is -tpool.
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
