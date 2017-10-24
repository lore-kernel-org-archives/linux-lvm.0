Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 978905D6A5
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 18:09:51 +0000 (UTC)
Received: from erato-smout.broadpark.no (erato-smout.broadpark.no
	[80.202.10.26]) by mx1.redhat.com (Postfix) with ESMTP id C28D8883D4
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 18:09:48 +0000 (UTC)
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Received: from osl1cloudm1.nextgentel.net ([80.202.10.58])
	by erato-smout.broadpark.no
	(Oracle Communications Messaging Server 7u4-27.01(7.0.4.27.0) 64bit
	(built Aug
	30 2012)) with ESMTP id <0OYC002IBA75N2A0@erato-smout.broadpark.no> for
	linux-lvm@redhat.com; Tue, 24 Oct 2017 20:09:47 +0200 (CEST)
References: <1244564108.1073508.1508601932111.ref@mail.yahoo.com>
	<1244564108.1073508.1508601932111@mail.yahoo.com>
From: Oleg Cherkasov <o1e9@member.fsf.org>
Message-id: <fb262e90-1568-b589-6184-e60bee1b5daa@member.fsf.org>
Date: Tue, 24 Oct 2017 20:09:46 +0200
In-reply-to: <1244564108.1073508.1508601932111@mail.yahoo.com>
Content-language: en-US
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

Some of your questions are answered int thread ...

On 21. okt. 2017 18:05, matthew patton wrote:
> 0) what is the full DD command you are issuing? (I think we have this)

dd if=file_250G of=/dev/null status=progress

> 
> 1) does your DD command work when LVM is not using caching of any kind.

Just dd had been running.

> 
> 2) does your DD command work if using 'direct' mode

nope

> 
> 3) are you able to write smaller chunks from NON-cached LVM volume to SSD vdev? Is there an inflection point in size where it goes haywire?

Tried for a smaller file, system became unresponsive for few minutes, 
LVM cache 51% however system survived with no reboot.

> 
> 4) what is your IO elevator/scheduler set to?

deadline for all disks in LV

> 
> 5) what is value of
> vm.dirty_background_ratio
> vm.dirty_ratio
> vm.dirty_background_bytes
> vm.dirty_bytes

vm.dirty_background_bytes = 0
vm.dirty_background_ratio = 10
vm.dirty_bytes = 0
vm.dirty_expire_centisecs = 3000
vm.dirty_ratio = 20
vm.dirty_writeback_centisecs = 500

> 
> What do you observe in /proc/vmstat during DD?
> 
> 6) run DD via strace

Once again, system were not responding to ICMP so checking vmstat does 
not make any sense because of deny of service to ssh or terminal.

strace? What are you planning to see their?  open() and continues read() 
system calls?
