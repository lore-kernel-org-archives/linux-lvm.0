Date: Mon, 24 Jul 2000 22:24:47 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] Alternate Pathing?
Message-ID: <20000724222446.A22101@jadzia.josv.com>
References: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCD0E@storeage_nt> <20000724135818.A26581@mail.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000724135818.A26581@mail.sistina.com>; from mauelshagen@sistina.com on Mon, Jul 24, 2000 at 01:58:18PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelshagen@sistina.com>
Cc: Sergey Vichik <SVichik@store-age.com>, linux-lvm@msede.com

I think it will be a *big* challenge to implement this feature in the
generic block device layer. Alternate pathing depends on the driver
being able to decide that a device probed via a particular controller is
exactly the same device as one that it has already seen through a
controller that has been probed earlier. I think it will be hard to
decide on a unique identifier that works for all types of block devices
(serial number?)

The LVM can do it more easily because it can use the VGid/PVid 
combination in the private areas of the physical volumes to keep track 
of this. 

Furthermore, as an administrator I would like to have control over which
of the paths is the "primary link" and which the "alternate link".
Suppose I have 4 disks in a VG where all 4 disks are reachable through 
2 controllers:

           +-------------------------------------------+
	   |                                           |
	   |                                           |
	   |                                           |
	   |              ------      ------           |
	   |              | A  |      | B  |           |
	   +-------------------------------------------+
                            |           |
	                 /-----\     /-----\
			 |     |     |     |
			 |  1  |     |  2  |
			 +-----+     +-----+
                            |           |
	                 /-----\     /-----\
			 |     |     |     |
			 |  3  |     |  4  |
			 +-----+     +-----+
                            |           |
			    +-----------+


In this case I might want to use controller A as the primary controller
for disks 1 and 3, and controller B as the primary controller for disks
2 and 4. Given a limited SCSI queue depth such a setup would allow me to
have more outstanding I/O's at a given time. Since I can not imagine the
system being able to smartly decide this for me, I must be able to
specify this preference in some way.

As a reference: in HP's LVM, when I vgextend a volume group with a
block device that is already know through another controller, than the
LVM adds this new device's designation as the alternate link for this
physical device.

++Jos

And thus it came to pass that Heinz Mauelshagen wrote:
(on Mon, Jul 24, 2000 at 01:58:18PM -0500 to be exact)

> On Mon, Jul 24, 2000 at 09:25:19PM +0200, Sergey Vichik wrote:
> > 
> > Hi,
> > 
> > 
> > It seems to be a litle tricky to detect via LVM which HBA has failed or
> > disconnected, because the mapping to real disks occurs at lvm_map, and you
> > cannot know whether this IO proccess have ended succesfully or not in
> > lvm_map.
> > 
> > The only solutuion I see, is to pass all IO operations via write/read of LVM
> > and detect failed HBA by retrying failed IO request, when eliminating every
> > time one of HBAs from mapping till IO operation successfull .
> 
> That's roughly what i was thinking to do in the future.
> But Martin K. Peter already mentioned that he needs to implement it anyway
> and he wants to do it in the general block device layer.
> This has the major advantage of beeing available for every block device
> rather than only for LVM driven ones.
> 
> > Not really effective, ugly, may work.
> 
> Ugly only in terms of beeing less general.
> It would work.
> But the preferable place to implement it is in the request handler
> which can take care of requeueing the request to the optional device (path).
> 
> Open question anyway is the administration interface.
> In case of the existing non self identifying disk devices there's the
> need of configuration of the alternate pathes.
> 
> 
> > Any other idea ?
> 
> 
> Basically Peter's.
> 
> Regards,
> Heinz  --  the LVM guy

-- 
Sometimes the best way,
Is with an old cliche.
