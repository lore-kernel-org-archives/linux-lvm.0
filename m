Received: from localhost.localdomain (unknown [10.33.36.184])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B16E5C1B4
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 12:40:07 +0000 (UTC)
Date: Wed, 25 Nov 2020 12:40:04 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20201125124004.GC2419337@localhost.localdomain>
References: <CAMaziXssM=DVD1qLEhqmVpZmepn-GpA2KgGm8BcDuthbtM+gQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMaziXssM=DVD1qLEhqmVpZmepn-GpA2KgGm8BcDuthbtM+gQQ@mail.gmail.com>
Subject: Re: [linux-lvm] System bricked after moving to thin snapshots
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Nov 24, 2020 at 05:34:12PM +0530, Sreyan Chakravarty wrote:
> Scanning devices dm-0  for LVM logical volumes vgfedora/fedora
> inactive '/dev/vgfedora/pool00' [929.75 GiB] inherit
> inactive '/dev/vgfedora/fedora' [700.00 GiB] inherit
>  modprobe: FATAL: Module dm-thin-pool not found in directory
> /lib/modules/5.8.18-200.fc32.x86_64
> /usr/sbin/modprobe failed: 1
> Can't process LV vgfedora/fedora: thin target support missing from kernel?
> 
> I have marked the logical volumes as active via :
>           lvchange -kn vgfedora/pool00
>           lvchange -kn vgfedora/fedora

See my reply to your other message - you need to rebuild your initramfs
image to include the dm-thin-pool module.

Regards,
Bryn.
