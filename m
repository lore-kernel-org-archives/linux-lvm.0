Received: from [10.34.131.57] ([10.34.131.57])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5U9plF7017003
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2016 05:51:47 -0400
References: <9884100F-2885-48D2-82D4-CB35078A9DA3@wits.ac.za>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <387ac1c9-01c5-a79c-0bd9-810b965866a1@redhat.com>
Date: Thu, 30 Jun 2016 11:51:47 +0200
MIME-Version: 1.0
In-Reply-To: <9884100F-2885-48D2-82D4-CB35078A9DA3@wits.ac.za>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM problem after upgrade to Ubuntu 16.04 (Part 2)
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Dne 30.6.2016 v 11:10 Scott Hazelhurst napsal(a):
>
> Dear all
>
> I sent the email below about three weeks ago. Today I upgraded another
> machine — I had exactly the same thing happen and I appear to have lost
> some LVM volumes
>
> Hmm. At least I  know it’s a problem and can backup the LVM volumes before
> doing upgrade but it’s hugely annoying.
>
> Scott
>
>
>
>
> Dear all
>
> I upgraded a server from Ubuntu 15.10 to 16.04. All went smoothly and the
> machine appeared in good state. However, there seems to be a problem with
> LVM. I have one volume group with several logical volumes. lvs showed all
> the logical volumes but only 2 of the 7 volumes were active (and appearing
> in /dev/mapper).
>
> I activated the other volumes using lvchange -ay and then I can see all
> logical volumes in /dev/mapper.
>

Hi

Upstream lvm2 has a bad message for you - your complains should be stricly
targeted to  Ubuntu/Debian lvm2 maintainers - so please open bug for them.

Solving booting sequence is very  'distro-specific' topic completely unrelated
to lvm2 -

as you say - when you manually use  'lvchange -ay' everything works - thus
your booting sequence missed to activate volumes....



> However, there appear to a problem with some of the LVs which are used as
> the images for virtual machines (qemu-kvm). The VMs don't boot. Moreover,
> previously I could mount the sub-partitions of the LV by doing a kpartx -a
> on the logical volume. That no longer works (e.g. kpartx -l
> /dev/mapper/cloud-VNAME shows nothing, while it used to show the 3
> partitions of the underlying virtual machine).

Again - likely distro-specific case.
kpartx has nothing in common with....


> One of the LVs didn't have a problem -- this just contained a data disk.
>
> This particular server is not a serious problem for me because  I can clone
> the VM from elsewhere, but I am about to start an upgrade of all our other
> machines and it will be very time-consuming if I have to do this with each
> machine.
>
> Does anyone have any ideas about what went wrong? How the situation could
> be remedied


Yep - untuned/untested release....

Regards

Zdenek
