Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l664tBYB013287
	for <linux-lvm@redhat.com>; Fri, 6 Jul 2007 00:55:11 -0400
Received: from emailgate2.cpvie.co.at (smtp.cargo-partner.com [195.234.151.28])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l664t9xc016298
	for <linux-lvm@redhat.com>; Fri, 6 Jul 2007 00:55:10 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id 9ACE440C95
	for <linux-lvm@redhat.com>; Fri,  6 Jul 2007 06:55:04 +0200 (CEST)
Received: from [10.10.55.2] (eisenkoe.cp.int [10.10.55.2])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id BB00540C65
	for <linux-lvm@redhat.com>; Fri,  6 Jul 2007 06:55:03 +0200 (CEST)
Message-ID: <468DCB29.9020305@cargo-partner.com>
Date: Fri, 06 Jul 2007 06:55:05 +0200
From: =?ISO-8859-1?Q?Michael_Eisenk=F6lbl_/_FIS?=
	<michael.eisenkoelbl@cargo-partner.com>
MIME-Version: 1.0
References: <20070704140438.8BE0177702@mail.futurelabusa.com>
In-Reply-To: <20070704140438.8BE0177702@mail.futurelabusa.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lv with cmirror
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I installed a clustered VG with a mirrored LV (RHEL4.5 and cmirror).
and using three iscsi storages (each two channels) and multipathd ... to 
be sure.

If I disconnect one iscsi storage, the LV is not working.
the command lvs or lvdisplay stucks.... when connecting again, the 
command will be
finished and everything will work.

why doesn't it remove the fault pv? any ideas?

kind regards,
michael
