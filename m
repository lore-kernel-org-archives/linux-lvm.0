Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r62ETuEJ014122
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 10:29:57 -0400
Received: from nm1-vm1.access.bullet.mail.gq1.yahoo.com
	(nm1-vm1.access.bullet.mail.gq1.yahoo.com [216.39.62.62])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r62ETtnC029990
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 10:29:55 -0400
References: <CAFrGbuUmN82Pw77=EC4ViVPAnTApnawiWWEWB2KnZ92xwn-zRw@mail.gmail.com>
Message-ID: <1372775393.12104.YahooMailNeo@web181503.mail.ne1.yahoo.com>
Date: Tue, 2 Jul 2013 07:29:53 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <CAFrGbuUmN82Pw77=EC4ViVPAnTApnawiWWEWB2KnZ92xwn-zRw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM handling the entire physical disk
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

The only reason to use partitions anymore is if you want to break the PV:VG=1:1 relationship such that a single spindle can be part of multiple VGs. For example I have been known to short-stroke a disk into an outer quarter, a middle half, and leave the rest undefined with appropriately named VolumeGroups. Otherwise just use the raw, un-partitioned disk.
