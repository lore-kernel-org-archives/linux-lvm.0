Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A525C578
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 19:46:25 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D70136CB38
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 19:46:22 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 19 Oct 2017 21:46:20 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <23016.63588.505141.142275@quad.stoffel.home>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<23016.63588.505141.142275@quad.stoffel.home>
Message-ID: <90cb544ffa100a862f503528ba5bf73f@xenhideout.nl>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

John Stoffel schreef op 19-10-2017 21:09:

> How did you setup your LVM config and your cache config?  Did you
> mirror the two SSDs using MD

He said he used hardware RAID to mirror the devices.

> I ask because I'm running lvcache at home on my main file/kvm server
> and I've never seen this problem.  But!  I suspect you're running a
> much older kernel, lvm config, etc.

lvm2-2.02.171-8.el7.x86_64

CentOS 7.4 was released a month ago.
