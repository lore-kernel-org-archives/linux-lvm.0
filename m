Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43Fpb7J008120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 11:51:37 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81A7B7F6A4
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 15:51:35 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 4CA147FC7E
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 17:51:34 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 03 May 2016 17:51:34 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <5728BA8A.3040009@redhat.com>
References: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
	<5720CDAF.1020604@redhat.com>
	<CAPLCSGAE9T_wWU5+9T0k5X+V6t7ztAguW84pUoh=Nfbir4J4iQ@mail.gmail.com>
	<572317B4.9030309@redhat.com>
	<CAPLCSGAma7ixsFmWHmuiJ4d426yBf+hunWCN+htijHmQnWCmOw@mail.gmail.com>
	<57287570.5090509@redhat.com>
	<CAPLCSGBXKXZLthYSFGUkG+kGO=8aUXh8SS4wh+6Ynj8A7xfh2w@mail.gmail.com>
	<5728BA8A.3040009@redhat.com>
Message-ID: <f56c5af2e35182a73de542adb66e3af5@dds.nl>
Subject: Re: [linux-lvm] Lvm think provisioning query
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek Kabelac schreef op 03-05-2016 16:49:

> Expecting you run out-of-space in thin-pool and nothing bad can
> happens is naive ATM - we are cooperating at least with XFS/ext4
> developers to solve some corner case, but there is still a lot of work
> to do as we exercise quite unusual error paths for them.

You also talked about seeing if you could have these filesystems work 
more in alignment with block (extent) boundaries, right?

I mean something that agrees more with allocation requests, so to speak.
