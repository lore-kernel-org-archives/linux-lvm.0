Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AEE77F390
	for <linux-lvm@redhat.com>; Fri, 12 May 2017 16:21:34 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 997B0C04B955
	for <linux-lvm@redhat.com>; Fri, 12 May 2017 16:21:32 +0000 (UTC)
Received: from [192.168.0.38] (unknown [82.66.78.161])
	(Authenticated sender: georges.giralt)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9E025780396
	for <linux-lvm@redhat.com>; Fri, 12 May 2017 18:21:29 +0200 (CEST)
From: Georges Giralt <georges.giralt@free.fr>
Message-ID: <2dad6517-22f4-032d-6d7d-44641c4b871f@free.fr>
Date: Fri, 12 May 2017 18:21:28 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question on mixing technologies
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

Hello guys,

I've an Ubuntu machine with two SATA mechanical drives on software raid 1.

This md is the sole PV of the LVM installation.

As the mainboard has been changed recently, it has an M.2 plug. And I'm 
been offered a 128 GB M.2 NGFF card.

So far so good.

Question : Will I gain something adding the M.2 card as a second PV on 
my LVM setup and moving the system LV to it ?

What are your experience on the subject ?

Many thanks in advance for your advice !


-- 
"If a man empties his purse into his head, no man can take it away from him.
An investment in knowledge always pays the best interest"


Benjamin Franklin.
