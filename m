Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9807A1033320
	for <linux-lvm@redhat.com>; Sat, 15 Feb 2020 05:23:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D06A018AE97A
	for <linux-lvm@redhat.com>; Sat, 15 Feb 2020 05:23:07 +0000 (UTC)
References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
	<20200214191115.GA20792@redhat.com>
	<1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
	<20200214204028.GB20792@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <83efdbf2-bc6f-2575-4f0a-a177da8c9cd9@suse.com>
Date: Sat, 15 Feb 2020 13:22:19 +0800
In-Reply-To: <20200214204028.GB20792@redhat.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: David Teigland <teigland@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: linux-lvm@redhat.com

Hello David,

I accept your points. the commit c527a0cbfc3 is correct.
I still not sure if the correct fix would have unintended consequences.
I think the most of people should only config device/filter in their machine.
After this commit, machine with duplicated devs should config 2 same copies filter rule.
one copy for device/filter, another for device/global_filter. It is wield.
The legacy code lived a period of time. Many of machine use it.

I quickly check the codes, before c527a0cbfc3, lvmetad_filter is
mainly used in _pvscan_cache() with in seldom condition. All other cases use device/filter.

So I suggest
1. Does lvm2 continue to keep the wrong filter(full_filter) usage?
    It can keep machine running as usual.
    or may add a new config item (e.g. pvscan_compat_filter = 0|1). let user to choose
filter behaviour

2. (a lot of work) backport mainline one filter code into stable-2.02 branch.

At last,
There is a little code tip for mainline branch:
To remove the in cfg_array(devices_global_filter_CFG in lib/config/config_settings.h
It generates useless config info.

Thanks.


On 2/15/20 4:40 AM, David Teigland wrote:
> On Fri, Feb 14, 2020 at 08:34:19PM +0100, Gionatan Danti wrote:
>> Hi David, being filters one of the most asked questions, can I ask why we
>> have so many different filters, leading to such complex interactions and
>> behaviors?
>>
>> Don't get me wrong: I am sure you (the lvm team) have very good reasons to
>> do that, and I am surely missing something? But what, precisely? How should
>> we (end users) consider filters? Should we only use global_filter?
> 
> You're right, filters are difficult to understand and use correctly.  The
> complexity and confusion in the code is no better.  With the removal of
> lvmetad in 2.03 versions (e.g. RHEL8) there's no difference between filter
> and global_filter, so that's some small improvement.  But, I think filters
> should be replaced or overhauled with something easier to use and more
> useful at a technical level.
> 
> I've created a bz about that and welcome thoughts about what a replacement
> should or should not be like.  With input the work is more likely to be
> prioritized.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1803266
> 
