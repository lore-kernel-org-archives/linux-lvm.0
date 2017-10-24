Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 689FD614FB
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 15:36:49 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7B887D0F9
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 15:36:46 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 0CC0840AE93C
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 17:36:45 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 24 Oct 2017 17:36:44 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <1928541660.2031191.1508802005006@mail.yahoo.com>
References: <1928541660.2031191.1508802005006.ref@mail.yahoo.com>
	<1928541660.2031191.1508802005006@mail.yahoo.com>
Message-ID: <9c3717b047cee65c7d9287babbb47b05@xenhideout.nl>
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

matthew patton schreef op 24-10-2017 1:40:
>> Because whatever purpose you are using it for, it shouldn't OOM the  
>> system.
> 
> I posted a 6 point query to the list 2 days ago as to what are the
> various settings being used (not LVM related) and also pointed out
> that not using odirect was necessarily going to try to stuff the file
> into the linux vm system which was bound to cause all kind of grief.
> 
> Maybe I'm missing responses but I haven't seen any answers to those
> questions which has nothing to do with LVM. I would be very surprised
> this has anything to do with LVM.

LVM is a system that is meant to run flawlessly without extra 
configuration.

You seem to be invested in not having problems solved.

I don't know.
