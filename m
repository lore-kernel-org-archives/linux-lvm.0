Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10F4D179C2
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 17:26:53 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6CC2CD999A
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 17:26:52 +0000 (UTC)
Received: from wiki.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::2])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v3DHOX5v023240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 13:24:37 -0400
Date: Thu, 13 Apr 2017 13:26:46 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <759c96fae2344adff733ded154bfdd16@xenhideout.nl>
Message-ID: <alpine.LRH.2.20.1704131325100.8831@fairfax.gathman.org>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<7732cbebfc561db0d8749310f1ba010f@xenhideout.nl>
	<dd14a71d-3d35-6c75-698e-25cda1ff2d44@redhat.com>
	<016916bc-b369-5efa-d48d-bd49cc7fd57b@gathman.org>
	<759c96fae2344adff733ded154bfdd16@xenhideout.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 13 Apr 2017, Xen wrote:

> Stuart Gathman schreef op 13-04-2017 17:29:
>
>>  understand and recover.   A sysadmin could have a plain LV for the
>>  system volume, so that logs and stuff would still be kept, and admin
>>  logins work normally.  There is no panic, as the data is there read-only.
>
> Yeah a system panic in terms of some volume becoming read-only is perfectly 
> acceptable.
>
> However the kernel going entirely mayhem, is not.

Heh.  I was actually referring to *sysadmin* panic, not kernel panic.
:-)

But yeah, sysadmin panic can result in massive data loss...

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
