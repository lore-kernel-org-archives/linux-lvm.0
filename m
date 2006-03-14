Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2E9VS110661
	for <linux-lvm@redhat.com>; Tue, 14 Mar 2006 04:31:28 -0500
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k2E9VDHs008606
	for <linux-lvm@redhat.com>; Tue, 14 Mar 2006 04:31:13 -0500
Message-Id: <200603140931.k2E9VDHs008606@mx3.redhat.com>
Date: Tue, 14 Mar 2006 08:44:28 +0100
From: "Axel Braun" <axel.braun@gmx.de>
In-Reply-To: <20060309133101.GB16@redhat.com>
References: <20060309094605.GA3222@redhat.com>
	<21543.1141908936@www029.gmx.net> <20060309133101.GB16@redhat.com>
Subject: Solved: [linux-lvm] LVM2 on a USB-disk/ same VG name
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Hallo Heinz,

** Reply to message from Heinz Mauelshagen <mauelshagen@redhat.com> on Thu, 9
Mar 2006 14:31:01 +0100

> On Thu, Mar 09, 2006 at 01:55:36PM +0100, Axel Braun wrote:
> > Hello Heinz,
> > 
> > > vgrename the active one and adjust /etc/fstab appropriately.
> > > 'vgscan;vgchange -ay' should gain you access to the USB one then.
> > 
> > After deactivation I could change the name, but after the reboot the
> > dm-mapper was still looking for the old volume group 'system'. I tried to
> > boot the rescue system, maybe the inittab needed a refresh - but that did
> > not work.
> 
> Did you change /etc/fstab ?

The missing element was: Change settings for bootloader (/boot/grub/menu.lst)

The way it worked for me:
- change settings in /etc/fstab and /boot/grub/menu.lst
- boot the rescue system from CD (otherwise the volume groups are still active)
- do a vgrename / vgsan
- reboot

Cheers
Axel

-- 
Dr.-Ing. Axel K. Braun
Mobile: +49.173.7003.154
VoIP/Skype: axxite
 
To lead the people, walk behind them.
(Lao Tse)
