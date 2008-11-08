Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA8NNcJ4017755
	for <linux-lvm@redhat.com>; Sat, 8 Nov 2008 18:23:38 -0500
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.26])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA8NNR0X011588
	for <linux-lvm@redhat.com>; Sat, 8 Nov 2008 18:23:27 -0500
Received: by qw-out-2122.google.com with SMTP id 3so966114qwe.39
	for <linux-lvm@redhat.com>; Sat, 08 Nov 2008 15:23:27 -0800 (PST)
Message-ID: <f4f537b50811081523v303ba8aep6b24de53c414a6d2@mail.gmail.com>
Date: Sat, 8 Nov 2008 17:23:27 -0600
From: "Eugene Vilensky" <evilensky@gmail.com>
Subject: Re: [linux-lvm] pvmove and 100% IO Wait
In-Reply-To: <4915FB94.1070005@knebb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4915F80E.40407@knebb.de>
	<f4f537b50811081243i351b8a7ch716292ec1ef7d08a@mail.gmail.com>
	<4915FB94.1070005@knebb.de>
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

> The last pvmove FROM the USB-SATA went without any issues (500GB!).
>
> Is it relevant?

Might not be, but if an operation involves multiple disks it will
probably go at the pace of the slowest disk, which for me has always
been USB...

Are you 100% certainty the devices underlying all PVs are good, that
you can dd 100% successfully?
