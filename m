Subject: Re: [linux-lvm] File Corruption on LVM LV's in same VG
From: Erik Zweers <zweers@execulink.com>
In-Reply-To: <20020205114111.F2928@lynx.turbolabs.com>
References: <1012932686.4859.2.camel@cider.execulink.net>
    <20020205114111.F2928@lynx.turbolabs.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1013103541.1276.10.camel@cider.execulink.net>
MIME-Version: 1.0
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
Date: Thu Feb  7 11:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

There are no error messages on the console.  This box does do a fair
amount of work and has no other issues.  The box has a second VG
consisting of SCSI drives.  If there were memory problems I would expect
this VG to contain errors too.

I did a MD5sum on the physical device twice and it returned the same sum
(while doing this on a file in a filesystem under LVM returns different
values each time).

Are there any good indepth tools that could analyze the structure of the
volume?  Everything I've seen sofar seems to just offer a summary.  The
box still has not been rebooted as I want to understand the problem
first.  I'm looking at using LVM for a production server and need to
find out whats wrong to go ahead with that project.



On Tue, 2002-02-05 at 13:41, Andreas Dilger wrote:
> On Feb 05, 2002  13:11 -0500, Erik Zweers wrote:
> > The system was repaired and believed to be running properly, until
> > yesterday where we discovered that some of our ISO's were wrong,
> > consistently wrong in inconsistent locations.  I've pasted in a record
> > of the symptoms.  If anyone has any advice on what else to diagnose (if
> > your intrested in what is wrong) or how to repair It would be greatly
> > appreciated.
> 
> I would suspect RAM or IDE problems.  If LVM is broken, it will stay
> broken, and if it is working it will stay working in the absence of
> other problems.  The failure symptoms would not look like this.
> 
> > I have not rebooted the machine yet, wanting to be sure that any
> > diagnoses that can be done is done.
> 
> Any output in dmesg?
> 
> > [root@ike iso]# cmp -l enigma-i386-disc1.iso ~carl/enigma-i386-disc1.iso
> > 2549832  77  67
> > 13431928 177 167
> > 14489440 376 366
> > 27451404 177 173
> > 33149724 376 336
> > 86298228 177 167
> > 116907524 372 332
> > 119130964  77  67
> > 121124171 376 356
> > 
> > 
> > [root@ike iso]# cmp -l enigma-i386-disc1.iso ~carl/enigma-i386-disc1.iso
> > 2549832  77  67
> > 11455071 177 167
> > 13431928 177 167
> > 18043044 277 273
> > 24780964 277 273
> > 86298228 177 167
> > 94133044 370 330
> > 106966431 177 167
> 
> Looks exclusively like single-bit errors.  Either RAM or IDE cable/driver.
> If it was RAM you would also have oopses or errors elsewhere.  Try turning
> off UDMA on the drive, update the IDE driver, new cable, etc.
> 
> > | wc -l     62
> > [root@ike iso]# ls -l enigma-i386-disc1.iso
> > -rw-r--r--    1 root     root     677961728 Feb  4 20:31
> > enigma-i386-disc1.iso
> > 
> > [root@ike iso]# fsck -n /dev/ide/iso
> > Parallelizing fsck version 1.23 (15-Aug-2001)
> > e2fsck 1.23, 15-Aug-2001 for EXT2 FS 0.5b, 95/08/09
> > Warning!  /dev/ide/iso is mounted.
> > /dev/ide/iso: clean, 24/1281696 files, 1351397/2560000 blocks
> 
> Given that you only have single-bit error rates in the order of 1/10^7,
> the chance of such an error happening in the ext2 metadata is unlikely.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> 
