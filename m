Return-Path: <scott@dixie.dyndns.org>
Date: Thu, 24 May 2001 18:55:31 -0400
Message-Id: <200105242255.f4OMtUN02394@dixie.dyndns.org>
From: scott@dixie.dyndns.org
Subject: [linux-lvm] LVM success story
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I know this list gets quite a few complaints and bug reports, so I figured
a success story would be a welcome post :)  After fighting a bit with the
BIOS and lilo, it was good to see how quickly and seamlessly LVM caught its
breath and kept moving.  I had LVM 0.9.1b6 on 2.2.19 for quite some time
when I decided I was sick of having to boot off of floppy due to BIOS
incompatibilities, so I flipped the primary and secondary chains such that
hda became hdc and hdb became hdd.  The only disk that gave -any- problem
was the root disk, which wasn't LVM anyway so I expected problems.  As far
as the other 3, which were LVM'd into several LV's under a single VG, I
just had to remove the lvm files from /etc and do a vgscan.

One weirdness I did see while fighting with lilo was a few times was that
it would see my scsi vg and detect its name but vgdisplay subsequentally
would see 2 identical vg's, both the ide/internal disk vg.  It is entirely
possible that it was just a weirdness with my lvm files in /etc, however,
as a complete clean and rescan fixed it.

Great job on a much-needed volume manager for linux!
--------------------------------------------------------------------------
Scott Denton
smdenton@bellsouth.net
EFNet Handle: SteelWyng
