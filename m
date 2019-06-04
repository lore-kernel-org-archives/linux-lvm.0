Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23685196BF
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2019 05:23:56 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [195.201.68.178])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F21C781E03
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2019 05:23:45 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id CF02A40551
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2019 08:23:38 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id SnJDxvVhXcRo for <linux-lvm@redhat.com>;
	Tue,  4 Jun 2019 08:23:36 +0300 (MSK)
Received: from ilia (89-178-216-202.broadband.corbina.ru [89.178.216.202])
	by mail.service4.ru (Postfix) with ESMTPSA id BF2FB402A9
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2019 08:23:36 +0300 (MSK)
References: <93f53408-2f37-dec3-5c68-deef021f530c@assyoma.it>
	<20190603132327.GA32187@reti>
	<512bbf893225a1b4f6897b7540b09d1c@assyoma.it>
From: Ilia Zykov <mail@izyk.ru>
Message-ID: <b70848d3-ea17-8b43-9474-c10c0665c754@izyk.ru>
Date: Tue, 4 Jun 2019 08:23:35 +0300
MIME-Version: 1.0
In-Reply-To: <512bbf893225a1b4f6897b7540b09d1c@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Fast thin volume preallocation?
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

>> Presumably you want a thick volume but inside a thin pool so that you
>> can used snapshots?
>> If so have you considered the 'external snapshot' feature?
> 
> Yes, in some cases they are quite useful. Still, a fast volume
> allocation can be an handy addition.
> 

Hello.
Can I use external snapshot for fast zero allocation?
 "thpool" - is lvmthin with lvm zeroing disabled

# lvcreate -n ext2T -V 2TiB --thinpool thpool VG
# lvchange --permission r VG/ext2T

# lvcreate -n zeroed_lve -s VG/ext2T --thinpool VG/thpool

Or it will be the same as zeroing enabled?
Thanks.

----
