Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n06C9jBI000945
	for <linux-lvm@redhat.com>; Tue, 6 Jan 2009 07:09:46 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n06C9jnH017339
	for <linux-lvm@redhat.com>; Tue, 6 Jan 2009 07:09:45 -0500
Message-ID: <496349D8.8000800@redhat.com>
Date: Tue, 06 Jan 2009 12:08:56 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvcreate & vgcfgrestore won't work
References: <1231217144.7947.19.camel@fraws70-gentoo>
In-Reply-To: <1231217144.7947.19.camel@fraws70-gentoo>
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

Ralf Sparr wrote:
> Hi list,
> 
> as mentioned in my earlier post, LVM complains about
> "Incorrect metadata area header checksum". As this occurs
> often (many questions, rarely answers in the list) I tried to create
> some 'new' via

Running pvcreate followed by vgcfgrestore is the correct way to fix a 
broken MDA checksum - I've used this many times to recover from these 
situations.

> # pvcreate --force --uuid 7vFXd3-MYnt-TVdG-luYr-rDPn-o8a1-vjewWk
> --restorefile /etc/lvm/archive/alice_00038.vg alice

Your syntax is wrong. You've got:

pvcreate -f -u=$UUID --restorefile=/path $VGNAME

But pvcreate is expecting a PV path as the last argument (the device to 
be initialised as a PV), not a VG name (are you confusing this with the 
vgcfgrestore arguments?).

This works just fine for me:

# pvcreate -f --uuid 6cxF7v-f0XU-3EK1-QhA2-YSVT-yEe3-vQnE09 
--restorefile /etc/lvm/archive/l0_00000.vg /dev/loop0
   Can't initialize physical volume "/dev/loop0" of volume group "l0" 
without -ff

# pvcreate -ff --uuid 6cxF7v-f0XU-3EK1-QhA2-YSVT-yEe3-vQnE09 
--restorefile /etc/lvm/archive/l0_00000.vg /dev/loop0
Really INITIALIZE physical volume "/dev/loop0" of volume group "l0" [y/n]? y
   WARNING: Forcing physical volume creation on /dev/loop0 of volume 
group "l0"
   Physical volume "/dev/loop0" successfully created

# vgcfgrestore -f /etc/lvm/archive/l0_00000.vg l0
   Restored volume group l0

Regards,
Bryn.
