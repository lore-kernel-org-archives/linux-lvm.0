Subject: RE: [linux-lvm] LVM and RAID
From: Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
In-Reply-To: <21E8E34076807C41A646FDC666B15BDF0876A1@minna.combox.de>
References: <21E8E34076807C41A646FDC666B15BDF0876A1@minna.combox.de>
Message-Id: <1067952111.20554.26.camel@lupin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Nov  4 07:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tue, 2003-11-04 at 13:09, Tobias Gablunsky wrote:
> > 
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > On Tuesday 04 November 2003 11:49, Tobias Gablunsky wrote:
> > > Hi all!
> > > 
> > > I didn't find clear information about how to use LVM on an 
> > (Software)
> > > RAID-Mirror (or RAID-5). All I found, were problems: LVM 
> > uses Partition
> > > Type
> >  0x8E but Linux Soft-RAID uses 0xFD - this dosn't look very
> > > compatible... A solution would be to use Hardware-RAID of 
> > course. But I'm
> > > wondering if there is a way to use Software-RAID and LVM 
> > together - I
> > > cannot believe that I am the first one with this question! Am I?
> > 
> > I just created the software raid, and pointed pvcreate at it.
> > Works like a charm.
> 
> Well thats fine but if you want your kernel to boot use your RAID-Volumes
> automatically you have to give it partition type 0xFD. And if you want
> automatically mounted LVM you need to give it the partition type 0x8E 


But why? Your RAID set will be made on say /dev/hda1 and /dev/hdb1
creating say /dev/md0, but your lvm partition will exist on /dev/md0.

-- 
Geoff Dolman
JDRF/WT Diabetes and Inflammation Laboratory
Cambridge Institute for Medical Research
University of Cambridge
http://www-gene.cimr.cam.ac.uk/todd/
