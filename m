Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2GLcUj08376
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2004 16:38:30 -0500
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net
	[68.14.253.125])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2GLcT4b008250
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2004 16:38:29 -0500
Received: from [127.0.0.1] (helo=localhost)
	by office.labsysgrp.com with esmtp (Exim 4.24) id 1B3MGW-0004wZ-1v
	for linux-lvm@redhat.com; Tue, 16 Mar 2004 14:38:24 -0700
Received: from office.labsysgrp.com ([127.0.0.1])
	by localhost (office.lsg.internal [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18947-01 for <linux-lvm@redhat.com>;
	Tue, 16 Mar 2004 14:38:13 -0700 (MST)
Received: from jeeves.kpf.internal ([192.168.170.1])
	by office.labsysgrp.com with esmtp (Exim 4.24) id 1B3MGL-0004wT-I3
	for linux-lvm@redhat.com; Tue, 16 Mar 2004 14:38:13 -0700
Received: from [192.168.130.55] (helo=backtobasicsmgmt.com)
	by jeeves.kpf.internal with esmtp (Exim 4.05) id 1B3MGK-0006CA-00
	for linux-lvm@redhat.com; Tue, 16 Mar 2004 14:38:12 -0700
Message-ID: <405773C4.6090401@backtobasicsmgmt.com>
Date: Tue, 16 Mar 2004 14:38:12 -0700
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [RFC][PATCH] proper DESTDIR handling for	device-mapper
	and LVM2
References: <4051388C.3050700@backtobasicsmgmt.com>	<20040312013822.C4622@homer.msp.redhat.com>	<4051D6EF.9070507@backtobasicsmgmt.com>
	<20040316152736.A31599@homer.msp.redhat.com>
In-Reply-To: <20040316152736.A31599@homer.msp.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:

> I still think it's wrong to use the version of any include file found on 
> the host system if there is a different version of it present in DESTDIR.
> [That copes fine for people installing into an empty directory, 
> and AFAICT also caters for people building multiple packages with
> dependencies.]

OK, no problem, that wasn't a big deal for me. The most important parts 
of my patch you've already accepted :-)
