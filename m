Message-Id: <200306262103.h5QL3SF8027269@socrates.catalyst.net.nz>
From: Steve Wray <stevew@catalyst.net.nz>
Subject: Re: [linux-lvm] shuffling drives along the chain?
References: <200306250215.h5P2ExF8008008@socrates.catalyst.net.nz> <20030625081201.GA437@fib011235813.fsnet.co.uk>
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
Date: Thu Jun 26 16:04:02 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks,
I was a bit worried as one time I reassembled
a machine with two drives swapped around accidentally;
hdc and hde were swapped and had PV's in the same VG.
LVM got terribly confused even though vgscan is run
at boot time. Fortunately I had just taken a backup
before starting otherwise I'd have lost lots of data!


Joe Thornber <thornber@sistina.com> writes:

> On Wed, Jun 25, 2003 at 02:14:59PM +1200, Steve Wray wrote:
> > 
> > I have an existing LVM setup over 3 hard drives,
> > hda, hdc, hde, with PV's and VG's set up just so.
> > 
> > I wish to add a new drive as the new hda, shifting
> > the other drives down the chain such that the old hda
> > becomes the new hdb and so forth.
> > 
> > The new drive will have new VG's on its PV's with
> > no overlap; no PV on the new drive will be part
> > of any VG on the old drives.
> > 
> > Is it just a simple matter of doing the 
> > vgchange -an <volume group>, vgexport <volume group>, 
> > shutdown & move the drives, reboot, 
> > install Linux onto the new drive and then
> > pvscan, vgimport <volume group> <physical volumes>
> > dance?
> > 
> > Or are there any gotchas to be aware of?
> 
> You don't need to export/import if you are just moving devices around.
> Just vgscan after moving them.
> 
> - Joe
