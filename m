Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B43AF8384E
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 23:40:11 +0000 (UTC)
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
	(sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50D4580B29
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 23:40:10 +0000 (UTC)
Date: Mon, 23 Oct 2017 23:40:05 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1928541660.2031191.1508802005006@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1928541660.2031191.1508802005006.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> Because whatever purpose you are using it for, it shouldn't OOM the  system.

I posted a 6 point query to the list 2 days ago as to what are the various settings being used (not LVM related) and also pointed out that not using odirect was necessarily going to try to stuff the file into the linux vm system which was bound to cause all kind of grief.

Maybe I'm missing responses but I haven't seen any answers to those questions which has nothing to do with LVM. I would be very surprised this has anything to do with LVM.
