From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] [Patch] Latest device-mapper snapshot
Message-ID: <20021024093827.C29870@sistina.com>
References: <20021023165627.CZKM23449.imf01bis.bellsouth.net@TAZ2>
Mime-Version: 1.0
In-Reply-To: <20021023165627.CZKM23449.imf01bis.bellsouth.net@TAZ2>; from freemyer@NorcrossGroup.com on Wed, Oct 23, 2002 at 12:54:37PM -0400
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
Date: Thu Oct 24 02:41:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 23, 2002 at 12:54:37PM -0400, Greg Freemyer wrote:
> Joe,
> 
> I haven't kept up.
> 
> What is LVM's status relative to the 2.5 feature freeze that is coming up?

Greg,
device-mapper is in the Alan Cox kernel since ~2 weeks.

We are addressing a couple of change requests (last update happened ysterday)
with the main one being the recommendation to submit a driverfs interface for
device-mapper rather than an ioctl one which we hope to release in a couple
of days.

We are positive to make it in :)

Regards,
Heinz    -- The LVM Guy --


> 
> TIA
> Greg Freemyer
> 
> =====
>  >>  New patchballs are available here:
> 
>  >>  http://people.sistina.com/~thornber/patches/2.5-stable/
> 
>  >>  Including a diff against 2.5.44-ac1.  There are a lot of changes in
>  >>  here compared to the last release, however most of these are due to
>  >>  code refactoring rather than bug fixes.  Highlights include:
> 
>  >>  o) Make the changes recommended by Christoph Hellwig and others:
>  >>  http://marc.theaimsgroup.com/?l=linux-kernel&m=103462345119681&w=2
> 
>  >>  o) Add reference count to struct mapped_device, and struct dm_table.
> 
>  >>  o) Hide the above two structs in their respective .c file
> 
>  >>  o) Move all locking of struct mapped_device into dm.c (we can do this now
>  >>  because
>  >>  of the reference counting).
> 
>  >>  o) Remove the name and uuid field from struct mapped device, these are
>  >>  really
>  >>  only used by the interface as a way of refering to devices.
> 
>  >>  o) Nobody needs to lookup from kdev_t -> struct mapped_device, so remove
>  >>  that hash table (thanks to Al Viros recent bdev->bd_disk stuff).
> 
>  >>  o) dm.c has no need of the dm-hash.c file any more, so merge dm-hash.c
>  >>  into
>  >>  dm-ioctl.c (the fs interface uses the dcache for lookups).
> 
> 
>  >>  There are still open issues that prevent things working perfectly:
> 
>  >>  o) The gendisk hash table is getting confused when removing a device.  eg,
>  >>  if
>  >>  I create 3 devices with minors (1, 2, 3).  Then remove minor 2,
>  >>  get_gendisk 
>  >>  will remove minor == 3. (Or I've done something really stupid).
> 
>  >>  o) Splitting pages still doesn't work, this is a generic block layer
>  >>  thing rather than dm.  In practise I can only trigger this with
>  >>  striped targets.  So stick to linear targets for now.
> 
> 
>  >>  Filesystem interface to follow before the end of the week.
> 
>  >>  - Joe
> 
>  >>  _______________________________________________
>  >>  linux-lvm mailing list
>  >>  linux-lvm@sistina.com
>  >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
>  >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
> 
> 
> Greg Freemyer
> Internet Engineer
> Deployment and Integration Specialist
> Compaq ASE - Tru64 v4, v5
> Compaq Master ASE - SAN Architect
> The Norcross Group
> www.NorcrossGroup.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
