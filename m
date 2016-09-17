Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8HFf0Al028788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 11:41:00 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC47081239
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 15:40:57 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 17 Sep 2016 17:40:56 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <57DD5EC1.13830.178652@mikes.kuentos.guam.net>
References: <368387847.156920.1474117496841.ref@mail.yahoo.com>, 
	<8340e33605f0a84b10ed1d626cfecfbe@dds.nl>,
	<8ebe6d1f9dc01bf7bfa843d8dcf3a0b8@dds.nl>
	<57DD5EC1.13830.178652@mikes.kuentos.guam.net>
Message-ID: <62067c1e715d309cdccdf09811d7cfd4@dds.nl>
Subject: Re: [linux-lvm] creating DD copies of disks
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

Michael D. Setzer II schreef op 17-09-2016 17:18:

> With windows systems, there seem to be more issues. On the same machine
> it works fine, but moving to systems that are just a little different 
> sometimes
> results in various messages.

Windows 10 has less issues than before. You can move a system from a 
"regular" disk to a "firmware raid" disk (same disk with a little bit of 
firmware data at the end, and run from a different controller) and if 
your raid drivers are already installed, it will boot without issue 
whatsoever.

Anyway, thanks for your response.
