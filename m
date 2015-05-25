Message-ID: <5562CC3F.9010901@redhat.com>
Date: Mon, 25 May 2015 09:16:15 +0200
From: Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
References: <20150521141955.70ebe714@leda.localdomain>
In-Reply-To: <20150521141955.70ebe714@leda.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] autoactivation fails
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
To: list@eworm.de
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 05/21/2015 02:19 PM, Christian Hesse wrote:
> Hello everybody,
>
> with recent lvm2 I had problems booting an Arch Linux system with non-systemd
> initramfs. lvmetad is launched, but volumes are not activated. A git bisect
> reported this bad commit:
>
> commit fe30658a4d5fe4e4e6bb346c9c9ee7142a98f49d
> Author: Ondrej Kozina <okozina@redhat.com>
> Date:   Mon Apr 13 16:29:15 2015 +0200

Fixed by commit:

commit f8bf6410954fcf82bf28852e0dba015c6b7f19dc
Author: Ondrej Kozina <okozina@redhat.com>
Date:   Fri May 22 14:48:28 2015 +0200

     lvmetad.c: ignore lvmetad global handle on disconnect

     do not unset lvmetad global handle on disconnect. This is
     hotfix for issue described in:
     https://www.redhat.com/archives/linux-lvm/2015-May/msg00008.html

     Reported-by: Christian Hesse <list@eworm.de>

pvscan --cache --background segfaulted due to NULL ptr dereference.

Thanks for the report!
Ondrej
