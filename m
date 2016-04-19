Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3J160Rh024724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2016 21:06:00 -0400
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 104E285366
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2016 01:05:59 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id n67so1480622vkf.3
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2016 18:05:59 -0700 (PDT)
MIME-Version: 1.0
From: shankha <shankhabanerjee@gmail.com>
Date: Mon, 18 Apr 2016 21:05:18 -0400
Message-ID: <CAO_L6qEOfivZ2PwJEzNFWnuECikZb8HqOX2Hn9DigMC62WSgqA@mail.gmail.com>
Subject: [linux-lvm] Thin Pool Performance
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,
Please allow me to describe our setup.

1) 8 SSDS with a raid5 on top of it. Let us call the raid device : dev_raid5
2) We create a Volume Group on dev_raid5
3) We create a thin pool occupying 100% of the volume group.

We performed some experiments.

Our random write operations dropped  by half and there was significant
reduction for
other operations(sequential read, sequential write, random reads) as
well compared to native raid5

If you wish I can share the data with you.

We then changed our configuration from one POOL to 4 POOLS and were able to
get back to 80% of the performance (compared to native raid5).

To us it seems that the lvm metadata operations are the bottleneck.

Do you have any suggestions on how to get back the performance with lvm ?

LVM version:     2.02.130(2)-RHEL7 (2015-12-01)
Library version: 1.02.107-RHEL7 (2015-12-01)

Thanks
