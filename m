From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] old metadata
Message-ID: <20020628114109.A24660@sistina.com>
References: <Pine.LNX.4.44.0206280905050.780-100000@m406a.hadiko.de>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0206280905050.780-100000@m406a.hadiko.de>; from alex@m406a.hadiko.de on Fri, Jun 28, 2002 at 09:16:03AM +0200
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
Date: Fri Jun 28 04:49:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 28, 2002 at 09:16:03AM +0200, Alexander Elbs wrote:
> hi,
> 
> is it somehow possible to update the metadata without doing the according
> changes to the rest of the disk?
> 
> Because:
> 
> I currently have a VG containing 3 PV's. This worked fine, since
> yesterday. Now for some odd reason vgscan doesn't work:
> 
> vgscan -- reading data of volume group "data" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume
> group "data" from physical volume(s)
> 
> looking at the metadata (with pvdata, vgcfgrestore -l ) it looks like that
> every version of the metadata I have describes a configuration with 4
> PV's. I had this config, but several months ago!

How did you manage to have metadata for 4 PVs?
Did you eventually restore an old metadata backup with vgcfgrestor(8)?

> A few months ago I added a new disk, did a pvmove and removed a old disk.

With remove you mean "vgreduce data /dev/TheEmptyPV"?
If you just removed the physical device and your VG stayed online since
then, vgscan now can't find it any longer. In this case, you need to
pvcreate+vgcfgrestore a free disk and run ""vgreduce data /dev/TheFreeDisk"

> So temporarly there were 4 disks in my VG.
> 
> One way to fix my problem could be, that i somehow fake a pvmove. so only
> the metadata is updated. Then I would have a newer version of my metadata
> that hopefully reflect my real vg. But I also would have to fake the 4th
> disk to get vgscan working.

See above.

> 
> So is there a metadata editor or something like that? Or do I have to
> hexedit my disk?

No metadata editor, sorry.

I'll wait for your reply on my above questions before we go any further.

> 
> Ciao
> Alex
> 
> -- 
> Alexander Elbs  ***  eMail Alexander.Elbs@hadiko.de
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
