From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Could vgscan read a file of "preferred" LV name
    -> minor device id ?
Message-Id: <20020115150022.C11005@sistina.com>
References: <E16Ovq8-0007VV-00@whittlesey.cl.cam.ac.uk>
    <20020111104116.GB1274@tykepenguin.com>
MIME-Version: 1.0
In-Reply-To: <20020111104116.GB1274@tykepenguin.com>; from
    caulfield@sistina.com on Fri, Jan 11, 2002 at 10:41:16AM +0000
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
Date: Tue Jan 15 08:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 11, 2002 at 10:41:16AM +0000, Patrick Caulfield wrote:
> On Fri, Jan 11, 2002 at 07:11:00AM +0000, Piete Brooks wrote:
> > I'm getting complaints from NFS users that when servers reboot, they often 
> > find that their mounts have the wrong data.  I've never really worked out 
> > which end hold what in NFS FHs, but the basic idea is that a client identifies 
> > a FH which encodes (major dev id,minor dev id,inode number,version).
> > This appears to break down when a new LV is created ane the server rebooted.
> > As the /dev/<vg>/<lv> nodes are numbered strictly in the order that they are 
> > discovered, all LV minor device IDs on subsequent VGs are renumbered, so any 
> > remote caching of FHs breaks (( as with SCSI )).
> > 
> > Is that about right ?
> > 
> > Would it be possible for vgscan to read a "hints" file consisting of <vg>/<lv> 
> > and minor device number pairs ?
> > 
> > As each <vg>/<lv> is found, if it's in the file, the nominated minor device id 
> > is used; if it's not found, then the next minor device id which is not listed 
> > in the file is used.
> > 
> > [[ I use devfs, so using existing data in /dev/ would not help -- but I think 
> > it would do no harm to use that data by default ]]
> > 
> 
> I thought Heinz had fixed this in 1.0.1, what version are you using (tools &
> kernel)?

That's right. It is in since 1.0.1.

> 
> patrick
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
