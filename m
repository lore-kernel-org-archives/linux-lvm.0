Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j35F2dO16059
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 11:02:39 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j35F2bKr032222
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 11:02:38 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 7C2CD1C88D4
	for <linux-lvm@redhat.com>; Tue,  5 Apr 2005 17:02:31 +0200 (CEST)
Message-ID: <4252A885.6050305@conterra.de>
Date: Tue, 05 Apr 2005 17:02:29 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm report tool
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

I want to write a tool to give a quick overview
on how my LVs scatter over the different PVs.
"vgdisplay -m" lists the mapping, I need to now.
Unfortunately it is not easy to parse, and with
"-c", no mapping is listed. The -m option for
pvdisplay seems not to work. The /proc interface
also disappeared. Any clue, on how to extract the
mapping?

Anyway: using the lvm tools, I have to be root, as
they have to open/read the PVs. Any idea on how to
extract the informations as an unprivileged user?

Could sysfs (/sys) help here? Would it make sense,
to output any hierarchical information via XML?
It could be processed much saver/easier than any
colon separated lists...

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
