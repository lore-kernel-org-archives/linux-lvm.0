Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55E1379835
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 21:54:32 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03F0CC0587CD
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 21:54:30 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id E9A0A61BAF
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 23:54:27 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 23 Oct 2017 21:54:28 +0000
From: Xen <list@xenhideout.nl>
In-Reply-To: <1714773615.1945146.1508792555922@mail.yahoo.com>
References: <1714773615.1945146.1508792555922.ref@mail.yahoo.com>
	<1714773615.1945146.1508792555922@mail.yahoo.com>
Message-ID: <434a70b3756341658b013c3e2ced0b60@xenhideout.nl>
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

matthew patton schreef op 23-10-2017 21:02:
>> On Mon, 10/23/17, John Stoffel <john@stoffel.org> wrote:
> 
> SSD pathologies aside, why are we concerned about the cache layer on a
> streaming read?
> 
> By definition the cache shouldn't be involved at all.

Because whatever purpose you are using it for, it shouldn't OOM the 
system.
