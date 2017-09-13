Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85BA477BF7
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 13:54:19 +0000 (UTC)
Received: from sonic301-21.consmr.mail.ir2.yahoo.com
	(sonic301-21.consmr.mail.ir2.yahoo.com [77.238.176.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EE9585545
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 13:54:18 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <13f08f25-6b16-e930-b609-4cd2799b08da@yahoo.co.uk>
Date: Wed, 13 Sep 2017 14:53:58 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Subject: [linux-lvm] raid & its stripes
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

hi boys, girls

man page reads: -i ...This is equal to the number of 
physical volumes to scatter the  logical  volume data....
I wonder, when I do not use -i while creating an LV with 10 
phy devs.

$ lvcreate -n raid0.A --type raid0 -I 16 -l 97%pv

a dbench would show:
$ dbench -t 60 20
...
Throughput 112.309 MB/sec  20 clients  20 procs  
max_latency=719.409 ms

Yet when I say: this many stripes:

$ lvcreate -n raid0.A --type raid0 -I 16 -i 10 -l 97%pv

dbench:
...
Throughput 83.2822 MB/sec  20 clients  20 procs  
max_latency=816.027 ms

And though the results would vary, xfs, a dbench for LV with 
no -i as an argument(which LVM chooses then to be 2) would 
always look better.
And I thought, as in the manual, always make stripes to go 
to all phy devices.

Question - is there some "little" magic LVM does? And if yes 
then how/what it is?
many thanks, L.

.
