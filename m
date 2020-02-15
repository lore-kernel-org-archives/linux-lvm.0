Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB23F1005E3C
	for <linux-lvm@redhat.com>; Sat, 15 Feb 2020 19:16:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1679800A17
	for <linux-lvm@redhat.com>; Sat, 15 Feb 2020 19:16:04 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 15 Feb 2020 20:15:57 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <4d31a0bd-4456-aecd-ce19-076b1220fd77@redhat.com>
References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
	<20200214191115.GA20792@redhat.com>
	<1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
	<20200214204028.GB20792@redhat.com>
	<4d31a0bd-4456-aecd-ce19-076b1220fd77@redhat.com>
Message-ID: <b1ad4af5a77d5f02d6629ee4d48a094c@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] commit c527a0cbfc3 may have a bug
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: David, Teigland <teigland@redhat.com>, heming.zhao@suse.com, LVM general discussion and development <linux-lvm@redhat.com>

Il 2020-02-15 13:40 Zdenek Kabelac ha scritto:
> Dne 14. 02. 20 v 21:40 David Teigland napsal(a):
>> On Fri, Feb 14, 2020 at 08:34:19PM +0100, Gionatan Danti wrote:
>>> Hi David, being filters one of the most asked questions, can I ask 
>>> why we
>>> have so many different filters, leading to such complex interactions 
>>> and
>>> behaviors?
>>> 
>>> Don't get me wrong: I am sure you (the lvm team) have very good 
>>> reasons to
>>> do that, and I am surely missing something? But what, precisely? How 
>>> should
>>> we (end users) consider filters? Should we only use global_filter?
>> 
>> You're right, filters are difficult to understand and use correctly.  
>> The
>> complexity and confusion in the code is no better.  With the removal 
>> of
>> lvmetad in 2.03 versions (e.g. RHEL8) there's no difference between 
>> filter
>> and global_filter, so that's some small improvement.  But, I think 
>> filters
>> should be replaced or overhauled with something easier to use and more
>> useful at a technical level.
>> 
>> I've created a bz about that and welcome thoughts about what a 
>> replacement
>> should or should not be like.  With input the work is more likely to 
>> be
>> prioritized.
>> 
> 
> One of the 'reason' for having 2 sets of filter was the presence of
> universal 'scanning' tool (aka udev) - which is assessing & reading
> devices in a system and its combination with various 'VM' environments
> where actual device are passed to guest systems on your hosting
> machine.
> 
> So there are many different combinations where different commands may
> need to see different subset of devices - so i.e. your guest machine
> should not have an impact on correctness of your 'hosting' machine no
> matter what guess will write (i.e. duplicating signatures...)

Sure. But why having a single, valid filter set is not sufficient? In 
other words, why/when I can not simply using global_filter, ignoring 
"plain" filter?

> While in many cases for many single home users with single set of
> devices this can be seen maybe as an 'overkill' solution - in the more
> generic world where there is unfortunately not yet any widely
> used/accepted solution solving the core problem: 'who is the owner of
> a device'  having several sets of filter was the only solution we were
> able to create.

True. I myself saw some setup where hosts had direct visibility of 
guest-created logical volumes. The obvious solution was to correctly set 
global_filter. However, I have the impression that a good share of 
complexity/issues/unexpected behaviors are due to LVM being able to be 
nested (PV inside LV inside VG inside PV inside ...)

> It's worth to note lvm2 is solving way more issues then other similar
> device technology (i.e. mdraid, btrfs....) where it's very simple to
> cause big confusion and data corruptions (even unnoticed) once
> duplicates appears in your system...
> 
> Zdenek

I never duplicate devices with mdraid, but BTRFS is so fragile that 
taking a simple LVM snapshot of a BTRFS component device can lead to 
data corruption.

I really think the gold standard here is ZFS.
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
