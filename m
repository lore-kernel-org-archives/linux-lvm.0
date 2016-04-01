Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u31GIkCr015169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 1 Apr 2016 12:18:46 -0400
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C8888051F
	for <linux-lvm@redhat.com>; Fri,  1 Apr 2016 16:18:45 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id d68so33120926ywe.1
	for <linux-lvm@redhat.com>; Fri, 01 Apr 2016 09:18:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FD151C.8060500@redhat.com>
References: <CAAYit8QYf0yTHSumcpTdVBRN6uvwNj3v4NHyThKOZen92WZY-Q@mail.gmail.com>
	<56FD151C.8060500@redhat.com>
Date: Sat, 2 Apr 2016 00:18:44 +0800
Message-ID: <CAAYit8Q=iH+p2+fVOY=Mw_b2Ng6xdaDmVASsL0mTnV_M3qbRrA@mail.gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
Subject: Re: [linux-lvm] Bugs in DM_DEVICE_STATUS ioctl no_flush flag
	settings
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

2016-03-31 20:16 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>
> Yeah - I've been create lv_cache struct with this in mind.
>
> However the whole issue should be seen more generically in 'OO-way'.
>
> So we do want to have 'status' object with reporting methods,
> and this object should be filled by 'segment' method.
>
> The complexity grows however as we do have some segments being related
> to other segments - that's why we currently have very ugly code hack
> inside to do filling of most status struct in one place - which is totally
> unextendable - but ATM was the quickest way to achieve reasonable goal.

Agree. We should utilize the segtype_handler framework as much as we can.

> For now I'm rather conservative about large code-base changes till Heinz's
> raid branch is fully merged.
> PS: I'm amazed some else is able to read lvm2 code.

Because there are lots of legacy code, hacks, and undocumented stuff? :p
It's painful when I started to read lvm2 code, but now I think I'm able
to write a maintenance guide of lvm2...

Hope that someday LVM code would become well-organized, maybe lvm3...


Ming-Hung Tsai
