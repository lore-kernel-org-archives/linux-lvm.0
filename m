Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01FE75E1D7
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 09:12:27 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF4402B0A65
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 09:12:24 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id 83D1C5A788
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 11:12:23 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 27 Mar 2018 11:12:22 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <5ABA4D6D020000F9000B1E44@prv-mh.provo.novell.com>
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
	<CAD+pdNdPKmHb7BQfT4DUj2M+=yy1P3JYtXO4GjNRXn2QA_cwwA@mail.gmail.com>
	<5ABA4D6D020000F9000B1E44@prv-mh.provo.novell.com>
Message-ID: <8d1d7152bf62372494a0aa5d2be0012c@xenhideout.nl>
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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

Gang He schreef op 27-03-2018 7:55:

> I just reproduced a problem from the customer, since they did virtual
> disk migration from one virtual machine  to another one.
> According to your comments, this does not look like a LVM code problem,
> the problem can be considered as LVM administer misoperation?

Counterintuitively, you must remove the PV from the VG before you remove 
the (physical) disk from the system.

Yes that is something you can often forget doing, but as it stands 
resolving the situation often becomes a lot harder when you do it in 
reverse.

Ie. removing the disk first and then removing the PV from the VG is a 
lot harder.
