From: Andreas Dilger <adilger@turbolabs.com>
Date: Fri, 5 Oct 2001 15:31:58 -0600
Subject: Re: [linux-lvm] LVM seems to be causing SCSI errors.
Message-ID: <20011005153158.J315@turbolinux.com>
References: <135641898.1002315768965.JavaMail.root@boots>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <135641898.1002315768965.JavaMail.root@boots>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Oct 05, 2001  16:58 -0000, Karl wrote:
> I created 3 logical volumes (with lvm 1.0.1r2, r3 and r4) across 4 disks
> on a dual 300 MHz PII running 2.4.6 (same behavior under 2.4.9) and
> readhat 7.1. After this I noticed IO errors while reading some files
> and SCSI errors when accessing lvol2. The errors were similar to the
> following
> 
> 
> Sep 28 17:11:21 gar kernel: scsi0: ERROR on channel 0, id 11, lun 0, CDB: Read (10) 00 00 ba e1 97 00 00 80 00 
> Sep 28 17:11:21 gar kernel: Info fld=0xbae1e6, Current sd08:21: sense key Medium Error
> Sep 28 17:11:21 gar kernel: Additional sense indicates Unrecovered read error
> Sep 28 17:11:21 gar kernel:  I/O error: dev 08:21, sector 12247456

People have recently reported similar "hardware" errors on IDE drives
as well.  Can you verify if the sector in question is really within the
boundaries of the device (this appears to be /dev/sdc1, sector 12247456)?
If not, it is possible that LVM is doing math incorrectly somewhere.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
