Subject: Re: re[4]: [linux-lvm] Core questions from a LVM neophyte...    [OT]
From: Christopher Barry <cbarry@infiniconsys.com>
In-Reply-To: <20030314004933.LWHV7626.imf56bis.bellsouth.net@tiger2>
References: <20030314004933.LWHV7626.imf56bis.bellsouth.net@tiger2>
Content-Transfer-Encoding: 7bit
Message-Id: <1047640166.30781.1.camel@tetra>
Mime-Version: 1.0
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
Date: Fri Mar 14 05:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Oops - not sure what I was thinking. I spaced the win2k part - sorry.
What we're doing with gfs is: 

linuxBox LinuxBox LinuxBox 
   \\       ||       // 
    \\      ||      // 
     \\     ||     // 
      \\    ||    // 
       \\   ||   // 
        \\  ||  // 
         \\ || // 
     FiberChannelArray 

where each LinuxBox mounts the same slices out of the array, and a lock
server manages access to the slices for all connected nodes. I'm told
future releases of gfs will incorporate a redundant lock-serving
mechanism into the nodes themselves. 

If *only* there were a driver for win2k... Or better, if you could just
figure out how to migrate off of win2k as a server. 


-Christopher 





On Thu, 2003-03-13 at 19:58, Greg Freemyer wrote: 
> Chris,
> 
> GFS can do a block level export to Win2K such that Win2K presents the Virtual Disk as a local disk?
> 
> i.e.
> create a tiered environment of 
>               Win2K servers  <==>  GFS Server  <==>  FC array.
> 
> With the end result that Win2K sees the drives as local, and the only SAN infrastructure is between the GFS server and the array.
>  
> I find that hard to believe, but if so, I really would like to know about that.
> 
> Like Steve, I have some Win2K apps I have to support that require local drives, and putting every Win2K box on a SAN is very expensive.
> 
> And yes that is exactly what HPs VR product does:
> 
>              Win2K servers  <= Ethernet =>  VR Server  <= SAN =>  FC array  
> 
> Greg
> 
>  >>  Sistina's GFS will do this as well. We employ it here with good results.
>  >>  GFS can live happily in LV2.
> 
>  >>  --
>  >>  Christopher Barry
>  >>  Manager of Information Systems
>  >>  InfiniCon Systems
>  >>  http://www.infiniconsys.com
> 
>  >>  -----Original Message-----
>  >>  From: Greg Freemyer [mailto:freemyer@NorcrossGroup.com]
>  >>  Sent: Wednesday, March 12, 2003 6:56 PM
>  >>  To: LVM Mailing list
>  >>  Subject: re[2]: [linux-lvm] Core questions from a LVM neophyte...
> 
> 
>  >>  Just to re-iterate, HPs Virtual Replicator does this.  (IIRC $10K)
> 
>  >>  They like you to put a MSA-1000 FC Array behind your VR server (IIRC $15K
>  >>  entry), but it supports/exports any FC array or local disk solution.
> 
>  >>  It does not provide any RAID aspects.
> 
>  >>  If you want to know more, e-mail me off-list.
> 
>  >>  Greg
>  >>  (HP certified SAN architect)
> 
> 
>  >>  >>  I'm interested in a block level export.  The exported space will be
>  >>  used
>  >>  >>  as the disk part of an Hierarchical Storage Manager that is backed up
>  >>  by
>  >>  >>  qualstar tape libraries.  We have several such systems and I would
>  >>  like
>  >>  >>  to try to consolidate the disk portions of each into a "SAN" like
>  >>  >>  environment.  At the same time, we are also looking at more customer
>  >>  >>  disk based storage.  I have several storage servers (hopefully
>  >>  running
>  >>  >>  Linux soon but running W2K now) that need access to large areas of
>  >>  >>  storage.  I would like to carve and export virtualized chunks for
>  >>  this
>  >>  >>  as well.  
> 
>  >>  >>  The main reason for the block level export is that the software we
>  >>  use
>  >>  >>  does not support "NAS" type network disks.  They only support
>  >>  "locally
>  >>  >>  attached" drives.  iSCSI would at least appear as a local SCSI disk.
> 
>  >>  >>  For management purposes, I would like to have a single way to export
>  >>  >>  everything.  This may or may not be feasible at present.
> 
>  >>  >>  - Steve
> 
>  >>  >>  > Stephen,
>  >>  >>  >     What do you want it for - backups? Why not samba over GigE?
>  >>  >>  > 
>  >>  >>  > --
>  >>  >>  > Christopher Barry
>  >>  >>  > Manager of Information Systems
>  >>  >>  > InfiniCon Systems
>  >>  >>  > http://www.infiniconsys.com
>  >>  >>  > 
>  >>  >>  > -----Original Message-----
>  >>  >>  > From: Stephen Perkins [mailto:perkins@netmass.com]
>  >>  >>  > Sent: Monday, March 10, 2003 4:14 PM
>  >>  >>  > To: linux-lvm@sistina.com
>  >>  >>  > Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
>  >>  >>  > 
>  >>  >>  > 
>  >>  >>  > Hi all,
>  >>  >>  >  
>  >>  >>  > >     I have built a very cool NAS box, and want to use LVM2 
>  >>  >>  > > on it. My machine is as follows:
>  >>  >>  > > 
>  >>  >>  > > Tyan Thunder i7500 w/ 2-2.4GHz XEON processors.
>  >>  >>  > > 2GB RAM
>  >>  >>  > > 3ware Escalade 7500-12 IDE RAID controller
>  >>  >>  > > 12-160GB Maxtor IDE HDs
>  >>  >>  > > System on a separate 20GB Maxtor HD
>  >>  >>  > > Floppy, slimline CDROM, and a DVDRW drive.
>  >>  >>  > > All in a 12-bay chassis from 
>  >>  >>  > > http://www.rackmountpro.com/productpage.cfm?> prodid=1460
>  >>  >>  > > 
>  >>  >>  > > This 
>  >>  >>  > > config gives me 1.8TB of RAID 5 for under 
>  >>  >>  > > $8K - not too shabby.
>  >>  >>  > 
>  >>  >>  > This is a superb value and I'm very interested in your 
>  >>  >>  > proposed "how-to"
>  >>  >>  > site.
>  >>  >>  > 
>  >>  >>  > I am wanting to deploy some larger virtualized storage in a mixed
>  >>  >>  > Linux/W2K environment.    Is anybody out there exporting
>  >>  virtualized
>  >>  >>  > volumes to Win2K boxes?  If so, how?  I checked HyperSCSI and they
>  >>  do
>  >>  >>  > not appear to have a Win2K client (although a beta is supposed to
>  >>  be
>  >>  >>  > coming soon).  I have not yet found target information for Linux
>  >>  along
>  >>  >>  > with a known interoperable Win2K initiator.  Anybody doing it?
>  >>  >>  > 
>  >>  >>  > Disk performance is not so much an issue for me since the disk
>  >>  arrays
>  >>  >>  > will be replacing large tape libraries.  Even with pathetic 
>  >>  >>  > performance,
>  >>  >>  > they should behave much faster than large AIT libraries.  
>  >>  >>  > 
>  >>  >>  > Question 1:  Is it possible today to:
>  >>  >>  > 
>  >>  >>  > Have a large IDE RAID5 array that is virtualized through LVM and
>  >>  then
>  >>  >>  > exported to a Dynamic Disk on Win2K over a LAN (not necessarily
>  >>  WAN)?
>  >>  >>  > 
>  >>  >>  > I believe iSCSI and HyperSCSI would both work... However I have not
>  >>  >>  > found the approporiate interoperable software drivers.
>  >>  >>  > 
>  >>  >>  > Question 2: The system that is described above is a linux system
>  >>  with
>  >>  >>  > direct attached storage.  It is a SPOF.  Any inexpensive 
>  >>  >>  > solutions that
>  >>  >>  > would allow the Linux portion to be clustered for active/pasive
>  >>  >>  > failover?  Is FC the only alternative here?
>  >>  >>  > 
>  >>  >>  > TIA,
>  >>  >>  > 
>  >>  >>  > - Steve
>  >>  >>  > 
>  >>  >>  > 
>  >>  >>  > 
>  >>  >>  > 
>  >>  >>  > _______________________________________________
>  >>  >>  > linux-lvm mailing list
>  >>  >>  > linux-lvm@sistina.com
>  >>  >>  > http://lists.sistina.com/mailman/listinfo/linux-lvm
>  >>  >>  > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  >>  >>  > 
> 
> 
> 
>  >>  >>  -- NextPart --
>  >>  >>  Attached File: c:\program
>  >>  files\goldmine\MailBox\Attach\gaf\smime(2).p7s
> 
>  >>  _______________________________________________
>  >>  linux-lvm mailing list
>  >>  linux-lvm@sistina.com
>  >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
>  >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
>  >>  _______________________________________________
>  >>  linux-lvm mailing list
>  >>  linux-lvm@sistina.com
>  >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
>  >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
