From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] DOH! NT's fixboot killed PV
Message-ID: <20011109102410.C19131@sistina.com>
References: <Pine.LNX.4.33.0111080415060.13338-100000@vaixcon.net>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0111080415060.13338-100000@vaixcon.net>; from jomarqua@vaixcon.net on Thu, Nov 08, 2001 at 04:22:42AM -0500
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
Date: Fri Nov  9 03:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

John,

hoping that the FAT metadata is small enough not to overwrite any LVM
extents, you should try a "pvcreate -f /dev/hda1" and rerun the
"vgcfgrestore;vgscan;vgchange -ay" cycle.

pvcreate is necessary, because vgcfgrestore needs a valid LVM PV structure.

Regards,
Heinz    -- The LVM Guy --

On Thu, Nov 08, 2001 at 04:22:42AM -0500, John Marquart wrote:
> Hello,
> 	Through my own carelessness  - my helper ended up running w2k's
> fixboot program on my rootvg's primary PV.  It wrote FAT info of some sort
> to the header area of my /dev/hda1 partition.
> 
> I am (desperately) hoping that there is some way to recover this header
> info. (And that ppl on this list can aide me.)
> 
> I thought perhaps the way to go about it was to do a vgcfgrestore ..
> however I had no luck - when i ran it w/ the -l / -l -l flags - it would
> show me the correct info - but if i ran it w/out the -l flags - then it
> would give me the following error:
> 
> ERROR "pv_read(): PV identifier invalid" reading physical volumes
> 
> I get the same error if I try to do pvscan.
> 
> pvdata shows that things are FUBAR - w/ a UUID of something like "0
> NAME-     -FAT1-2   - <GARBAGE>" - but I know the proper identifier is in
> the cfg backup file - since it can be displayed and is
> "Nku12O-iI1H-Ee4v-Lpa0-SxtF-31z)-xZs7sr"
> 
> 
> If anyone could provide tips / directions on how to go about fixing this
> problem - I would be very greatful - I just finally got the system
> built/installed to my satisfaction and would hate to start over.
> 
> tia,
> -john marquart
> 
> 
> 
> ps.  Bill & Ted rule!
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
