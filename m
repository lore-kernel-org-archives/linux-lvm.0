Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6SF13e8031719
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 11:01:03 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6SF119d006156
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 11:01:01 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id E55011F41B1
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 17:00:55 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16736-01 for <linux-lvm@redhat.com>;
	Fri, 28 Jul 2006 17:00:46 +0200 (CEST)
Message-ID: <44CA269C.6040802@conterra.de>
Date: Fri, 28 Jul 2006 17:00:44 +0200
From: =?ISO-8859-15?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange pvmove problem
References: <44C9E4BD.9070204@forouher.de> <44CA0D67.5000008@conterra.de>
	<44CA1479.8080909@forouher.de>
In-Reply-To: <44CA1479.8080909@forouher.de>
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

Dariush Forouher wrote:
> Uhm, this is the file created right before I started pvmove:
....

seems the pvmove was not even started because of a problems
with the underlaying device-mapper:

>  device-mapper: reload ioctl failed: Invalid argument

sorry, no idea :-(

any  messages from syslog / dmesg?
does it work while LV not active (i.E. boot from rescue CD)?

Dieter.
