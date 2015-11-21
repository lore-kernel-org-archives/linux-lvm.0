Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tALNBgs8022482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 21 Nov 2015 18:11:42 -0500
Received: from zimbra13.linbit.com (zimbra13.linbit.com [212.69.166.240])
	by mx1.redhat.com (Postfix) with ESMTPS id BC095C100451
	for <linux-lvm@redhat.com>; Sat, 21 Nov 2015 23:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by zimbra13.linbit.com (Postfix) with ESMTP id 8297F340820
	for <linux-lvm@redhat.com>; Sun, 22 Nov 2015 00:11:38 +0100 (CET)
Received: from zimbra13.linbit.com ([127.0.0.1])
	by localhost (zimbra13.linbit.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id XSKjYTVkR4a1 for <linux-lvm@redhat.com>;
	Sun, 22 Nov 2015 00:11:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zimbra13.linbit.com (Postfix) with ESMTP id 6535F340827
	for <linux-lvm@redhat.com>; Sun, 22 Nov 2015 00:11:38 +0100 (CET)
Received: from zimbra13.linbit.com ([127.0.0.1])
	by localhost (zimbra13.linbit.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QqtHBTaCVkyc for <linux-lvm@redhat.com>;
	Sun, 22 Nov 2015 00:11:38 +0100 (CET)
Received: from devinlaptop.us.linbit
	(static-50-53-218-195.bvtn.or.frontiernet.net [50.53.218.195])
	by zimbra13.linbit.com (Postfix) with ESMTPSA id E83AA340820
	for <linux-lvm@redhat.com>; Sun, 22 Nov 2015 00:11:37 +0100 (CET)
From: Devin Vance <devin@linbit.com>
Message-ID: <5650F9FD.3020803@linbit.com>
Date: Sat, 21 Nov 2015 15:10:53 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Quick question regarding lvm-cache
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

Greetings,

Short version:

Is there anyway to adjust the cache blocksize of the lvm cache with the 
lvm tools?

Long version:

I have been exploring the new lvm-cache features within rhel7 (tech 
preview, I know), and with a cache of 1.4TiB in size I noticed these 
warnings within the logs.

device-mapper: cache: You have created a cache device with a lot of 
individual cache blocks (1638400) All these mappings can consume a lot 
of kernel memory, and take some time to read/write.Please consider 
increasing the cache block size to reduce the overall cache block count.

However, I cannot find any straightforward method with which to adjust 
this cache block size. I did find this documentation which explains how 
to do so with device mapper: 
https://www.kernel.org/doc/Documentation/device-mapper/cache.txt Is 
there anyway to do this with the lvm tools, or is this yet to be developed?


Many thanks,
Devin
