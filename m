From: Andreas Dilger <adilger@turbolabs.com>
Date: Fri, 5 Oct 2001 16:58:45 -0600
Subject: Re: [linux-lvm] LVM seems to be causing SCSI errors.
Message-ID: <20011005165844.M315@turbolinux.com>
References: <134690694.1002320843996.JavaMail.root@boots>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <134690694.1002320843996.JavaMail.root@boots>
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

On Oct 05, 2001  18:21 -0000, Karl wrote:
> > People have recently reported similar "hardware" errors on IDE drives
> > as well.  Can you verify if the sector in question is really within the
> > boundaries of the device (this appears to be /dev/sdc1, sector 12247456)?
> > If not, it is possible that LVM is doing math incorrectly somewhere.
> 
> Good point. That's a pretty big number. It would also explain the bad noise
> from the drive...
> 
> From fdisk on that drive I count 17767890 sectors so it does seem to fall
> within the boundaries

Well, if it is within the size of the drive, and you get a "bad noise"
when trying to access it, then it may be that you have a bad drive.  If
you are doing low-level formats of the drive, this may do bad block
relocation, and hide the fact that there are bad spots.

One way to test this theory is to do "dd if=/dev/sdc of=/dev/null" and
see if it generates errors.  If so your drive is bad.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
