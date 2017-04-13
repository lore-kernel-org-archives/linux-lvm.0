Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4366EC05BE
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 15:29:36 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A6A2787E6
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 15:29:35 +0000 (UTC)
Received: from elissa.gathman.org (h.elissa.gathman.org
	[IPv6:fc37:2c50:7583:e01a:8c69:8f50:8dcf:a076])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v3DFRKlt022591
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 11:27:21 -0400
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<7732cbebfc561db0d8749310f1ba010f@xenhideout.nl>
	<dd14a71d-3d35-6c75-698e-25cda1ff2d44@redhat.com>
From: Stuart Gathman <stuart@gathman.org>
Message-ID: <016916bc-b369-5efa-d48d-bd49cc7fd57b@gathman.org>
Date: Thu, 13 Apr 2017 11:29:34 -0400
MIME-Version: 1.0
In-Reply-To: <dd14a71d-3d35-6c75-698e-25cda1ff2d44@redhat.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 04/13/2017 10:33 AM, Zdenek Kabelac wrote:
>
>
> Now when you have thin-pool - it cause quite a lot of trouble across
> number of layers.  There are solvable and being fixed.
>
> But as the rule #1 still applies - do not run your thin-pool out of
> space - it will not always heal easily without losing date - there is
> not a simple straighforward way how to fix it (especially when user
> cannot ADD any new space he promised to have) 
IMO, the friendliest thing to do is to freeze the pool in read-only mode
just before running out of metadata.  While still involving application
level data loss (the data it was just trying to write), and still
crashing the system (the system may be up and pingable and maybe even
sshable, but is "crashed" for normal purposes), it is simple to
understand and recover.   A sysadmin could have a plain LV for the
system volume, so that logs and stuff would still be kept, and admin
logins work normally.  There is no panic, as the data is there read-only.
