Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7F6OYV32414
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2005 02:24:34 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7F6OQjY008408
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2005 02:24:27 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id EA3311C88E6
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2005 08:24:04 +0200 (CEST)
Message-ID: <43003501.9050301@conterra.de>
Date: Mon, 15 Aug 2005 08:24:01 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvmove won't start
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm using LVM2 on kernel 2.6.12.2 and tried to perform a pvmove.
Unfortunately I got the message:

mirror: Required device-mapper target(s) not detected in your kernel

I found, dm-mirror was compiled as a module, but it was not loaded.
After a "modprobe dm-mirror" it seems to work now. Can someone tell
me, why the module is not loaded automatically?

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
