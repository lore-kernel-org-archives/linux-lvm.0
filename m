Received: from [10.34.131.226] (dhcp131-226.brq.redhat.com [10.34.131.226])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1CCeFUT000524
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2016 07:40:15 -0500
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
	<CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
	<567D8CE9.3030101@redhat.com>
	<CAAYit8SMcJUi7oAqX45FmW77BmmJL1Ls46vouu5zbMctKi1ZRA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56BDD2AF.1070201@redhat.com>
Date: Fri, 12 Feb 2016 13:40:15 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8SMcJUi7oAqX45FmW77BmmJL1Ls46vouu5zbMctKi1ZRA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 27.12.2015 v 14:09 M.H. Tsai napsal(a):
> Sorry, I sent a wrong mail before. Please ignore it.
>
> 2015-12-26 2:37 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>> Dne 25.12.2015 v 03:27 M.H. Tsai napsal(a):
>>
>> It's not so simple - since the user may activate  thin-pool without
>> activation of any thin-volume, and keep thin-pool active while thin-volumes
>> are activated and deactivated - so it's different case if user activates
>> thin-pool explicitly or thin-pool is activated as thin volume dependency.
>>
>> Also thin-pool LV has its own cluster lock which is quite complicated to
>> explain, but for now -  thin-pool size is unimportant, but it's existence is
>> mandatory :)
>
> I have three questions:
>
> 1. If we need to preserve the -tpool layer, why the commit 00a45ca4
> activates a new thinpool (transaction_id == 0) without overlay?
>
> 2. Is it necessary to suspend any thin volume while extending a
> thinpool? If not, the commit fa648234 might need some fix.
>
> 3. Similary to question(2), is it necessary to suspend thin-pool while
> expanding a thin-volume ? If no, we should adopt the approach of
> a900d150e for thin-volume expansion. The following is my solution:
>

Hi

Thanks a lot for very detailed analysis which has been correct.

Hopefully I've put in all the patches here in the proper way upstream.
Please check upstream commits starting in this thread here:

https://www.redhat.com/archives/lvm-devel/2016-February/msg00004.html

Regards

Zdenek
