Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94BDA5FCA5
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 10:27:45 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D1A418B31D
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 10:27:44 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id 0272A5A76E
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 12:27:42 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 27 Mar 2018 12:27:42 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <b9f55f3f-1998-4ca8-b6ce-e0a2be6e2698@gmail.com>
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
	<CAD+pdNdPKmHb7BQfT4DUj2M+=yy1P3JYtXO4GjNRXn2QA_cwwA@mail.gmail.com>
	<5ABA4D6D020000F9000B1E44@prv-mh.provo.novell.com>
	<8d1d7152bf62372494a0aa5d2be0012c@xenhideout.nl>
	<b9f55f3f-1998-4ca8-b6ce-e0a2be6e2698@gmail.com>
Message-ID: <e790670450869fed7cdbbea58708ca23@xenhideout.nl>
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

Zdenek Kabelac schreef op 27-03-2018 12:22:

> IMO 'vgreduce --removemissing'  doesn't look to me like a real rocket 
> science.

Yeah I don't wanna get into it.

--force didn't work very well when the missing PV was a cache PV as it 
removed the entire cached volume including the origin.
