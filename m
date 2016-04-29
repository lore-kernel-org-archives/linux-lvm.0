Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3TDGGEa008041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 09:16:17 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2BA1C0467E4
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 13:16:14 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 99D9A7FDE8
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 15:16:12 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 29 Apr 2016 15:16:12 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <5723322A.3060702@assyoma.it>
References: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
	<1009262601.20160429104420@marki-online.net>
	<5723322A.3060702@assyoma.it>
Message-ID: <ba7cee20dbf40157dcff5746cbef9158@dds.nl>
Subject: Re: [linux-lvm] about the lying nature of thin
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

Gionatan Danti schreef op 29-04-2016 12:06:

> Let me add one important use case: have fast, flexible snapshots.

One more huge reason for using it in a desktop system.

I didn't know about the performance benefits.

I just know that providing snapshot space in advance by registering in 
advance LVs for that purpose, is not a good way of working (for me, or 
anyone).

Although the idea of using LVM thin to provide only a single thin volume 
might be rather odd ;-).

Still, the snapshotting is clearly superior to that of traditional LVM, 
right?

Regards.
