References: <20190725184901.24234-1-julian.klode@canonical.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
Date: Tue, 30 Jul 2019 17:02:44 +0200
MIME-Version: 1.0
In-Reply-To: <20190725184901.24234-1-julian.klode@canonical.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] Detect systemd at run-time in
	69-dm-lvm-metad.rules
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Julian Andres Klode <jak@jak-linux.org>
Cc: Julian Andres Klode <julian.klode@canonical.com>

Dne 25. 07. 19 v 20:49 Julian Andres Klode napsal(a):
> systems might have systemd as their normal init systems, but
> might not be using it in their initramfs; or like Debian, support
> different init systems.
> 
> Detect whether we are running on systemd by checking for /run/systemd/system
> and then change the behavior accordingly.
> 


Wouldn't it be better to simply disable compiling/using lvmetad on such systems ?

HEAD of 2.03 already dropped lvmetad anyway.

Do you need any sort of autoactivation in ramdisk ?

There is probably higher complexity.

pvscan was not moved into systemd service just for fun - there have been at 
least 2 major mandatory points why  'pvscan' with autoactivation MUST NOT be 
executed from udev rule directly (udev timeout)

So the proposed patch must be NAC-ked as it is - as it probably causing way 
more troubles then it solves.

Regards

Zdenek
