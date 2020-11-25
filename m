Received: from localhost.localdomain (unknown [10.33.36.184])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3700100AE2D
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 12:38:56 +0000 (UTC)
Date: Wed, 25 Nov 2020 12:38:53 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20201125123853.GB2419337@localhost.localdomain>
References: <CAMaziXsY6vpQdD+QQzW_1Km+Ltf41tz0G1WG5xAUiMARFWHoyw@mail.gmail.com>
	<20201123130412.GB2229389@localhost.localdomain>
	<CAMaziXsh55b9VNgq40nVJwoFtD774_5i=JEiNZZOrdKpJsWQ_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMaziXsh55b9VNgq40nVJwoFtD774_5i=JEiNZZOrdKpJsWQ_A@mail.gmail.com>
Subject: Re: [linux-lvm] What is the use of thin snapshots if the external
 origin cannot be set to writable ?
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

On Tue, Nov 24, 2020 at 05:29:36PM +0530, Sreyan Chakravarty wrote:
> On Mon, Nov 23, 2020 at 6:34 PM Bryn M. Reeves <bmr@redhat.com> wrote:
> > It means re-installing but if the system is set up to use a thin pool
> > and thin provisioned logical volumes from the start then you can use
> > snapshots without any of the limitations that you've bumped into with
> > external origin devices.
> 
> 
> Do I have to reinstall my system for thin snapshots ?
> 
> Can't I just clone my filesystem and then create a thin pool ?

You can, it's just typically easier for most users to re-install than to
execute the necessary steps to convert the system after the fact.

If you have sufficient space then you can just create a thin pool, copy
your existing file systems into it and then fix up the fstab, grub boot
entries, initramfs and any other configuration that may still reference
the old device names. Once you're finished you can remove the original
volumes and reclaim the space for use by the thin pool.

Regards,
Bryn.
