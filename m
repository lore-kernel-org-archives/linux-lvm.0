Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6SGLCFE024634
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 12:21:12 -0400
Received: from mail.informatik.uni-luebeck.de (cs3.informatik.uni-luebeck.de
	[141.83.143.73])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6SGL6xr018512
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 12:21:06 -0400
Received: from [85.233.18.124] (ip-124-18.travedsl.de [85.233.18.124])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.informatik.uni-luebeck.de (Postfix) with ESMTP id D1D6320150
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 18:21:00 +0200 (CEST)
Message-ID: <44CA397A.8020209@forouher.de>
Date: Fri, 28 Jul 2006 18:21:14 +0200
From: Dariush Forouher <dariush@forouher.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange pvmove problem
References: <44C9E4BD.9070204@forouher.de>
	<44CA0D67.5000008@conterra.de>	<44CA1479.8080909@forouher.de>
	<44CA269C.6040802@conterra.de>
In-Reply-To: <44CA269C.6040802@conterra.de>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dieter St=EF=BF=BDken wrote:

> any  messages from syslog / dmesg?

Jupp, these:

device-mapper: unrecognised sync argument to mirror log: 2
device-mapper: dm-mirror: Error creating mirror dirty log
device-mapper: error adding target to table
device-mapper: unrecognised sync argument to mirror log: 2
device-mapper: dm-mirror: Error creating mirror dirty log
device-mapper: error adding target to table
device-mapper: device 253:1 too small for target
device-mapper: error adding target to table

> does it work while LV not active (i.E. boot from rescue CD)?

Nope. :(

ciao
Dariush
