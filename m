Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104030623.f336NGn31932@webber.adilger.int>
Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
In-Reply-To: <01040307345000.00915@darkvader> from Diederick van Dijk at "Apr
 3, 2001 07:34:50 am"
Date: Tue, 3 Apr 2001 00:23:15 -0600 (MDT)
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

Diederick van Dijk writes:
> On Monday 02 April 2001 23:00, you wrote:
> > Diederick van Dijk writes:
> > > I've a LVM of 8 physical volumes that I've created with LVM 0.9.1 beta 2.
> > > I've the know problem that vgscan reports that it can't find my VG.
> > > So I upgraded to LVM 0.9.1 beta 6 (tools and kernel) and runned on each
> > > physical disk a vgcfgrestore. Unfortunately I didn't solve the problem.
> > > Attached is the output of the commands vgdisplay -v and a pvdata -U for
> > > each physical disk. Debug logs a very huge so I won't attach them.
> >
> > You can try the following (experimental) procedure to fix the UUIDs:
> >
> > Check each PV with "pvdata -PP /dev/hdX" to ensure it has a valid
> > UUID assigned.  Also get the PV numbers (starting with 1) for each of
> > the PVs.  Finally, check the pv_uuidlist_on_disk.base for each PV.
> > It will normally be 6144, but it does not have to be.
> >
> > for each PV (in PV# order)
> >   dd if=/dev/hdX bs=1 skip=44 count=128 >> /tmp/uuids
> >
> > This should create a file /tmp/uuids which has all of the PV UUIDs in it.
> > Make sure there are as many UUIDs in the file ("od -a /tmp/uuids" is good)
> > as you have PVs (8 in your case).
> >
> > Now, we want to write the UUID list back to the PVs so vgscan is happy:
> >
> > for each PV (in any order)
> >   dd if=/tmp/uuids of=/dev/hdX bs=1 seek=<pv_uuidlist_on_disk.base for hdX>
>
> Unfortunately this doesn't work. I get on of=/dev/hda2 an invalid argument. 
> Can you write to a partition with dd ? Or has it to be a disk such as 
> /dev/hda ?

Should work fine writing to /dev/hda2.  The only thing that _may_ be an
issue is that we are not writing aligned sectors to the disk, but under
Linux even the "raw" disk devices are buffered I/O.  I just tested the
above commands under 2.2.18 and it worked fine and my VG is still alive.

Can you send the exact command-line you are using?  Also useful would be
pvdata -PP for each disk in the VG.  If you are sure you are using the
correct command-line for dd, you could try running it under "strace" to
see where it is getting -EINVAL from.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
