Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8KG7rtW000312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2016 12:07:54 -0400
Received: from forward9m.cmail.yandex.net (forward9m.cmail.yandex.net
	[5.255.216.202])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77B3E9E62F
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2016 16:07:52 +0000 (UTC)
Received: from mxback15h.mail.yandex.net (mxback15h.mail.yandex.net
	[84.201.187.49])
	by forward9m.cmail.yandex.net (Yandex) with ESMTP id 81267215A4
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2016 19:07:50 +0300 (MSK)
From: =?utf-8?B?0KDRg9C00LXQvdC60L4g0JDQu9C10LrRgdCw0L3QtNGA?=
	<fatruden@yandex.com>
MIME-Version: 1.0
Message-Id: <5208271474387670@web5h.yandex.ru>
Date: Tue, 20 Sep 2016 19:07:50 +0300
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Shared LUN without CLM
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
To: linux-lvm@redhat.com

Hi, friends.

I have strange question)

I have one shared LUN on many different hosts.
LUN is PV in some VG.

Each hosts can make any operation in this VG - create LV, remove LV, resize LV, etc.
If i want access to same LV on same host, i take "lvscan" and "lvchange -aey /dev/VG/LV_name".
I'm sure can't two modification VG in same time.

It work fine for me.

My question.

Can i not use the CLVM extension?

CLVM is great extension for LVM, but i will have more 100 nodes.
This count not supported in corosync.

Sorry for my english)
