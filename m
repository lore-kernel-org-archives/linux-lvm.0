From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Paralell IO performance with LVM and XFS
Message-Id: <20020117152130.GG1066@tykepenguin.com>
References: <200201171229.g0HCTVe10111@localhost.localdomain>
    <20020117125640.35CF032FDE6@lyta.coker.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020117125640.35CF032FDE6@lyta.coker.com.au>
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
Date: Thu Jan 17 09:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 17, 2002 at 01:56:39PM +0100, Russell Coker wrote:
> On Thu, 17 Jan 2002 13:29, Miguel Angel de Vega wrote:
> > I've a Dual P2 450 with a Disk Array with 4 scsi disks with XFS.
> > With one single disc I've 10 Mb/s reading and writing, so I think that if I
> > stripe all disc of the array, it can give me 4x10Mb = 40Mb/s more or less,
> > but I only gets 10 Mg/s!!
> 
> Striping across 4 disks will never give you 4* the throughput of 1 disk, but 
> you would hope for double the throughput.

A graph of some tests I did using bonnie++ and striping on fibre-channel disks
is online at http://www.cix.co.uk/~tykepenguin/stripetests.png

The most obvious bottleneck there was the actually FC interface which ran
out of capacity at 3 stripes.

patrick
