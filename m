From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Physical volume size changed
Message-ID: <20020522131402.E9107@sistina.com>
References: <20020522121144.G6806@deepthought.hausboot.org> <20020522102722.GC802@turbolinux.com>
Mime-Version: 1.0
In-Reply-To: <20020522102722.GC802@turbolinux.com>; from adilger@clusterfs.com on Wed, May 22, 2002 at 04:27:22AM -0600
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
Date: Wed May 22 06:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 22, 2002 at 04:27:22AM -0600, Andreas Dilger wrote:
> On May 22, 2002  12:11 +0200, Jens Hoffrichter wrote:
> > Now we have extended the logical volume on the IBM ServeRaid by using
> > 3 36 GB disks, so the logical volume on the raid controller now has
> > 203.4 GB. 
> 
> I assume when you say "logical volume" you actually mean "physical
> volume"?
> 
> > I have issued a SCSI reset on the bus hoping that the LVM notices on the
> > fly that the physical volume size has changed, but it doesn't recognize
> > it.
> 
> No, you need to use "pvresize", which is part of very recent LVM tools.
> I'm not sure if it needs kernel support or not.

No, it doesn't because the physical volume to be resized needs to be inactive.
Thought that would be fair enough because it is a rare change anyway.

> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> http://sourceforge.net/projects/ext2resize/
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
