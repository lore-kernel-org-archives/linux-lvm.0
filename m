Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8JM1gS6015946
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 18:01:43 -0400
Received: from smtp1.versatel.nl (smtp1.versatel.nl [62.58.50.88])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8JM1T4Y012046
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 18:01:29 -0400
Received: from [192.168.1.102] (unknown [192.168.1.102])
	by mail.vermeer.tv (Postfix) with ESMTPA id B43AA26F1BB
	for <linux-lvm@redhat.com>; Sat, 20 Sep 2008 00:00:29 +0200 (CEST)
Subject: Re: [linux-lvm] Mirrored LV
From: Koen Vermeer <koen@vermeer.tv>
In-Reply-To: <20080919173108.GA15000@us.ibm.com>
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com> <1221599565.6037.82.camel@localhost>
	<20080916215759.GA11670@us.ibm.com>
	<1221836810.4051.8.camel@koenws.oogziekenhuis.lan>
	<20080919173108.GA15000@us.ibm.com>
Date: Sat, 20 Sep 2008 00:01:19 +0200
Message-Id: <1221861679.4718.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Op vrijdag 19-09-2008 om 10:31 uur [tijdzone -0700], schreef
malahal@us.ibm.com:
> It needs it own PV. Create an extra partition on your master disk and
> add the PV tou the volume group.  Then run lvcreate again with out
> corelog option. By default the command would create a disklog. You can
> also specify where you want your log.

OK, did that! I guess I need one additional partition for each volume
group, then.

Now, what happens if the master disk (which includes the log) dies?
Won't LVM complain that it cannot find the log? I'm not saying I expect
it too, but with this stuff I guess it's better to be safe than sorry!

Best,
Koen
