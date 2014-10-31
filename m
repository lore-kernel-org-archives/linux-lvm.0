Received: from [10.34.130.202] (dhcp130-202.brq.redhat.com [10.34.130.202])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9V9aJZ8002061
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2014 05:36:19 -0400
Message-ID: <54535811.3050906@redhat.com>
Date: Fri, 31 Oct 2014 10:36:17 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CANHNcP9F=xab3SDarH7X4hrVNY9Mg8aFHvAnBqn0QvfiM-4Hwg@mail.gmail.com>
In-Reply-To: <CANHNcP9F=xab3SDarH7X4hrVNY9Mg8aFHvAnBqn0QvfiM-4Hwg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgscan can't see LVM volumes on QEMU image
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 31.10.2014 v 02:17 Roman Mashak napsal(a):
> Hello,
>
> I want to mount QEMU image of qcow2 type on Fedora 20 host. Here is
> what commands I executed, according to the advices at
> http://docs.openstack.org/image-guide/content/ch_modifying_images.html:
>
> % modprobe nbd max_part=16
> % qemu-nbd -c /dev/nbd0 image.qcow2
> % partprobe /dev/nbd0


I'm mostly sure noone has added support for  nbd devices to lvm2.

look into  /etc/lvm/lvm.conf and  add in device section  something like:

types = [ "nbd", 16 ]


Zdenek
