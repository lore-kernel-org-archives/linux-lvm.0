Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B0D36031A
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 06:42:45 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E454113AB0
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 06:42:42 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 73D0A401A658
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 08:42:41 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 20 Oct 2017 08:42:41 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <23017.5555.200654.218469@quad.stoffel.home>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<23016.63588.505141.142275@quad.stoffel.home>
	<90cb544ffa100a862f503528ba5bf73f@xenhideout.nl>
	<23017.5555.200654.218469@quad.stoffel.home>
Message-ID: <31e81701799746abaf6f51c4b8880fe8@xenhideout.nl>
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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

John Stoffel schreef op 19-10-2017 23:14:

> And RHEL7.4/CentOS 7 is all based on kernel 3.14 (I think) with lots
> of RedHat specific backports.  So knowing the full details will only
> help us provide help to him.

Alright I missed that, sorry.

Still given that a Red Hat developer has stated awareness about the 
problem that means that other than the kernel it isn't likely that 
individual config is going to play a big role.

Also it is likely that anyone in the position to really help would 
already recognise the problems.

I just mean to say that it is going to need a developer and is not very 
likely that individual config is at fault.

Although a different kernel would see different behaviour, you're right 
about that, my apologies.
