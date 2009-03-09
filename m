Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n29C4ZIV023798
	for <linux-lvm@redhat.com>; Mon, 9 Mar 2009 08:04:36 -0400
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n29C4VoB002960
	for <linux-lvm@redhat.com>; Mon, 9 Mar 2009 08:04:31 -0400
Message-ID: <49B50610.3020600@redhat.com>
Date: Mon, 09 Mar 2009 12:05:36 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to enlarge a logical volume that is a virtual
	disk	of a virtual machine that uses lvm too?
References: <f9d0f9760903061911s6db14df3t1ac602afa411e7e1@mail.gmail.com>
	<49B23E93.6090004@alexbrett.net>
In-Reply-To: <49B23E93.6090004@alexbrett.net>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Alex Brett wrote:
> I'm not sure if you could do it online or not (I can't see any
> reason why not, but there may be issues), but you should just be
> able to resize the LV (lvresize) in dom0 (obviously make sure you
> enlarge it, not shrink it), then do a pvresize in the VM to enlarge
> the PV to use all

Depending on the type of device and whether it is partitioned or not
it may not be possible to have the guest recognise the new size of the
device without a reboot.

Regards,
Bryn.
