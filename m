Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F753784A8
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2017 14:32:54 +0000 (UTC)
Received: from st41p57im-ztfb14250501.me.com (st41p57im-ztfb14250501.me.com
	[17.36.64.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 865B57E42C
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2017 14:32:53 +0000 (UTC)
Received: from process-dkim-sign-daemon.st41p57im-ztfb14250501.me.com by
	st41p57im-ztfb14250501.me.com
	(Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built
	Jun 7 2017)) id <0OW900E00XP4OT00@st41p57im-ztfb14250501.me.com> for
	linux-lvm@redhat.com; Thu, 14 Sep 2017 14:32:52 +0000 (GMT)
Received: from icloud.com ([127.0.0.1]) by st41p57im-ztfb14250501.me.com
	(Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built
	Jun 7
	2017)) with ESMTPSA id <0OW900542XQJ3X50@st41p57im-ztfb14250501.me.com>
	for linux-lvm@redhat.com; Thu, 14 Sep 2017 14:32:51 +0000 (GMT)
From: Dale Stephenson <dalestephenson@mac.com>
MIME-version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Thu, 14 Sep 2017 10:32:43 -0400
References: <C28D2468-1843-4019-A503-E566A305977D@mac.com>
	<d23b94a7-b5c5-4ee2-51c7-7dfa06cca3d2@redhat.com>
	<42E7ED35-B32E-4C02-976A-7A9E5380EEA8@mac.com>
	<bb529703-849c-93ff-f40c-1de8a6f49ce6@redhat.com>
	<c1d08569-dbaf-fffc-c3e5-dfe47513fa03@redhat.com>
	<c8762bcf-4db5-973e-e5d2-4683e4076351@assyoma.it>
	<56cdaa13-a10a-a545-3cb6-cb454330df3f@redhat.com>
In-reply-to: <56cdaa13-a10a-a545-3cb6-cb454330df3f@redhat.com>
Message-id: <0BE09EDA-1239-4749-A303-44E64C5AE177@mac.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Performance penalty for 4k requests on thin
 provisioned volume
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


> On Sep 14, 2017, at 7:13 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> 
> Dne 14.9.2017 v 12:57 Gionatan Danti napsal(a):
>> On 14/09/2017 11:37, Zdenek Kabelac wrote:
>>> Sorry my typo here - is NOT ;)
>>> 
>>> 
>>> Zdenek
>> Hi Zdenek,
>> as the only variable is the LVM volume type (fat/thick vs thin), why the thin volume is slower than the thick one?
>> I mean: all other things being equal, what is holding back the thin volume?
> 
Gionatan has hit on the heart of my concern.  I ordinarily expect minimal performance hit from remapping, and that’s clearly the case with the thick volume.  But it’s not the case with thin, even though I’ve already fully provisioned it.  Why is thin so much slower, and what can I do to make it faster?

> So few more question:
> 
> What is '/dev/sdb4'  ? - is it also some fast SSD ?
> 
Correct, it’s an SSD identical to the ones used in the array.

> - just checking to be sure your metadata device is not placed on rotational storage device)…
> 
It is not in this case.

> What is your thin-pool chunk size - is it 64K ?

In this case it is 512k, because I believed that to be the optimal chunk size for a 512k raid stripe.

> - if your raise thin-pool chunk size up - is it getting any better ?
> 

I have only tested direct to device at 64k and 512k, 512k performs better.  It is not obvious to me why 512k *should* perform better when all the requests are only 4k, except that a given size of metadata would obviously map to a larger size.  (That is, if no contiguous chunk indicators are used — in this particular case I would expect the thin provisioning to be completely contiguous.)

Thank you for your help.
Dale Stephenson
