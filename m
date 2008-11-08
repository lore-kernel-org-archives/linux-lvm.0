Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA8KhZMR013333
	for <linux-lvm@redhat.com>; Sat, 8 Nov 2008 15:43:35 -0500
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.26])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA8KhOvG028136
	for <linux-lvm@redhat.com>; Sat, 8 Nov 2008 15:43:24 -0500
Received: by qw-out-2122.google.com with SMTP id 3so947180qwe.39
	for <linux-lvm@redhat.com>; Sat, 08 Nov 2008 12:43:24 -0800 (PST)
Message-ID: <f4f537b50811081243i351b8a7ch716292ec1ef7d08a@mail.gmail.com>
Date: Sat, 8 Nov 2008 14:43:24 -0600
From: "Eugene Vilensky" <evilensky@gmail.com>
Subject: Re: [linux-lvm] pvmove and 100% IO Wait
In-Reply-To: <4915F80E.40407@knebb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4915F80E.40407@knebb.de>
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

>The storage
> consists of two 3Ware 9500 PCI-X, a USB-SATA drive and three disks
> connected to the local SATA controller.

is the USB-SATA at all involved in the pvmove?
