From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] performance probs: snapshots on mp-systems
Message-Id: <20011219171451.A10011@sistina.com>
References: <OF618919E3.271C48C8-ONC1256B1F.0066C311@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <OF618919E3.271C48C8-ONC1256B1F.0066C311@de.ibm.com>;
    from martin.petermann@de.ibm.com on Mon, Dec 17, 2001 at 05:51:52PM +0100
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
Date: Wed Dec 19 10:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 17, 2001 at 05:51:52PM +0100, Martin Petermann wrote:
> Hi all,
> 
> I have running SuSE 7.2 (2.4.4 kernel) on a dual processor machine (2x833
> Mhz Pentium III). I made a snapshot of the following configuration:
> 
> >lvcreate -L 100M -n snapshot -c 4 -s /dev/vgfortest/testfs1
> lvcreate -- WARNING: the snapshot will be automatically disabled once it
> gets full
> lvcreate -- doing automatic backup of "vgfortest"
> lvcreate -- logical volume "/dev/vgfortest/snapshot" successfully created
> 
> peanuts:root /
> >lvscan
> lvscan -- ACTIVE            "/dev/mediastore/data" [100 GB]
> lvscan -- ACTIVE            "/dev/vgfortest/bigfs" [8 GB]
> lvscan -- ACTIVE   Original "/dev/vgfortest/testfs1" [500 MB]
> lvscan -- ACTIVE            "/dev/vgfortest/testfs3" [500 MB]
> lvscan -- ACTIVE            "/dev/vgfortest/smallfs" [60 MB]
> lvscan -- ACTIVE   Snapshot "/dev/vgfortest/snapshot" [98.54 MB] of
> /dev/vgfortest/testfs1
> lvscan -- ACTIVE            "/dev/zweite_testvg/testfs1" [500 MB]
> lvscan -- ACTIVE            "/dev/zweite_testvg/testfs3" [500 MB]
> lvscan -- ACTIVE            "/dev/zweite_testvg/testfs" [200 MB]
> lvscan -- 9 logical volumes with 110.3 GB total in 3 volume groups
> lvscan -- 9 active logical volumes
> 
> The vg vgfortest is on a fc disk.
> 
> This first run I did in multi processor mode:
> 
> >time cat /dev/vgfortest/snapshot > /BIGFS/file
>  1136.72s real     0.13s user    15.87s system
> 
> in single processor mode:
> 
> peanuts[root]/> time cat /dev/vgfortest/snapshot > /BIGFS/file
>   402.03s real     0.10s user    16.16s system
> 
> Is this problem known? Does there exist a fix?

Martin,

have heard about it for the first time.
Have you tried a newer kernel with the recent VM enhancements?

> 
> Thanks for any help!
> 
> Martin
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
