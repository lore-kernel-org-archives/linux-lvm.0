Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9JJRiYb018816
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 15:27:44 -0400
Received: from vselecta.velocity.org (mail.velocity.org [65.196.200.100])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9JJRXRK011376
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 15:27:33 -0400
Received: from [192.168.100.121] (router.velocityatt.com [67.211.165.3] (may
	be forged)) (authenticated bits=0)
	by vselecta.velocity.org (8.13.8/8.13.8) with ESMTP id n9JJREB1013596
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 15:27:29 -0400
Message-ID: <4ADCBD92.3000800@velocity.org>
Date: Mon, 19 Oct 2009 15:27:14 -0400
From: Dan Ragle <dan@velocity.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvcreate on specific pv in system-config-lvm
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi, I'm new to LVM and trying to find my way through the
available options...

I see that with lvcreate there is the ability to create a
logical volume on a specified physical volume; but in system-config-lvm
I do not see how to do that (I can only see how to set the size of
the LV from the free space available in the VG; I don't see how
to specify on which PV it should be created). Obviously if
I'm missing something please let me know; but otherwise I was
just curious as to why that feature wasn't available in the
GUI (i.e., is it problematic, or something I should try to avoid
for some other reason)?

Many thanks,

Dan Ragle
