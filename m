Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102161711.f1GHBX014742@webber.adilger.net>
Subject: Re: [linux-lvm] LVM don't work anymore (wrong version?)
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF683970@mailsrv.linkvest.ch> from
 Jean-Eric Cuendet at "Feb 16, 2001 08:41:53 am"
Date: Fri, 16 Feb 2001 10:11:33 -0700 (MST)
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

Jean-Eric writes:
> > Try running 'pvdata -U' on each of the PV's, and see if there are empty
> > UUID slots on some of them.  This is a bug with the old LVM tools.  If
> 
> I have 13 slots and the 13th is EMPTY. Is that what you mean?

Yes.  This was a bug in the old (0.9.1beta2?) LVM user tools.  The problem is
that this data was written to disk incorrectly, and now vgscan doesn't work.

> > this is true, you can try to comment out the section in 
> > pv_read_all_pv_of_vg which verifies the UUIDs (starts like
> > "if (uuids) {"), and try vgscan again.
> 
> I did it and vgscan output nothing about Volume Groups!
> Output of debug vgscan is attached.

I don't see any attachment.  I was looking at the pv_read_all_pv_of_vg()
code, and the section actually starts "if (uuids > 0) {", so you can
replace this with "if (0) {" and the UUID checking will be skipped.
This _should_ fix your problem, but it is possible there is also another
problem as well.

> Here is the output of a vgchange:
> [root@fatboy 0.9.1_beta4]# echo -ne "NOTSURE_HDX\0" > /etc/lvmtab
> [root@fatboy 0.9.1_beta4]# vgchange -ay
> vgchange -- ERROR: physical volume "/dev/hdc9" of volume group "NOTSURE_HDX"
> is inconsistent
> vgchange -- run vgscan
> 
> FYI, I have hda1, hda5->hda10 + hdc1, hdc5->hdc10 in the VG NOTSURE_HDX.
> hdc9 seems broken, but why? And how to restore?

You can try restoring your VGDA with "vgcfgrestore /dev/hdc9".  You may
have to restore the VGDA on all of the disks at the same time, I'm not
sure.  The good news is that if you do a vgcfgrestore with the new (beta4)
tools it will also fix the UUID problem above.

Cheers, Andreas

PS - it is strange that you have multiple partitions on the same disk as
     separate PVs.  It is the most efficient (space wise) to only make a
     single large PV on each disk.
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
