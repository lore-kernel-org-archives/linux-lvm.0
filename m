Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9LFhRV11036
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 11:43:27 -0400
Received: from vger.nix.hu (norbi.axelero.com [195.228.243.93])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9LFhLIm025932
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 11:43:21 -0400
Received: from vger.nix.hu (localhost [127.0.0.1])
	by vger.nix.hu (Postfix) with SMTP id BE58F1C0AE
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 17:42:57 +0200 (CEST)
Date: Fri, 21 Oct 2005 17:42:57 +0200
From: BUCHMULLER Norbert <norbi.lists@nix.hu>
Subject: Re: [linux-lvm] LVM1 -> LVM2 with failed disk
Message-Id: <20051021174257.5a9042dc.norbi.lists@nix.hu>
In-Reply-To: <20051020204341.GZ13606@beazk.net>
References: <20051020204341.GZ13606@beazk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi All!

On Thu, 20 Oct 2005 16:43:41 -0400
Erik Karlin <e_karlin@yahoo.com> wrote:

> Of course, one of my disks died. In the past, I used the -P partial flag
> to get the lvm to start so I could copy off my data from the "good" pv,
> but under lvm10, I don't see that option.
> 
> What are my options. Can I upgrade from lvm10 to lvm2 with a failed
> disk. The lvm doesn't start and while I can pvdisplay /dev/hda4 I cannot
> vgdisplay or lvdisplay (obviously) since the vg isn't starting.
> 
> Can I put in a dummy drive, somehow tell lvm to pvcreate a pv on the new
> drive with the same ID and then get the vg to come up?

This latter option worked for me once. The VG's name is "vg0", the died PV
was /dev/hdc1.

* Read the exact size of the died PV:

vgcfgrestore -ll -n vg0

* Add a new disk to the system, create a partition with _exactly_ the same
size as the died PV. (It need not be on the same device as the old PV, eg.
I'll call it /dev/hdb2.)

* Restore the LVM headers of the died PV onto the new disk:

vgcfgrestore -n vg0 -o /dev/hdb2 /dev/hdc1

* Rescan, activate the VG:

vgscan; vgchange -a y vg0

Hope it will help.


norbi
