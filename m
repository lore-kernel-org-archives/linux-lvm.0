From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] migrating LVM from non-RAID to RAID-1
Message-Id: <20020218095459.A28465@sistina.com>
References: <02c801c1b73b$342862e0$0100a8c0@adhoc.ee>
MIME-Version: 1.0
In-Reply-To: <02c801c1b73b$342862e0$0100a8c0@adhoc.ee>; from liivo@nnm.ee
    on Sun, Feb 17, 2002 at 12:42:23AM +0200
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
Date: Mon Feb 18 02:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

If you really want to have one RAID1 MD out of 2 large partitions you either
get a temporary disk large enough carry your existing LVs, pvcreate that,
vgextend the VG by it and pvmove your exting LVs over to take the PVs on hde 
out in order to get a hde5 partition of the same size of hdg5.

Or you backup your LVs in order to free the PVs hde[5-12] so that you
can remove the them, vgremove the VG and repartition hde to get a hde5 of 38GB
as well.  After raid initialization off md3 on hde5 and hdg5, pvcreate md3,
vgcreate your VG and LVs and restore.


On Sun, Feb 17, 2002 at 12:42:23AM +0200, Liivo wrote:
> Hello,
> 
> I've Linux with following setup:
> 
> /dev/hde - 40G
> /dev/hdg - 40G
> ...and both are identical at HW level.
> hde[1-3] are in mirror with hdg[1-3]
> hdx1=md0    -    /boot
> hdx2=md1    -    swap
> hdx3=md2    -    /
> 
> hde4 and hdg4 are Linux extended.
> 
> hde[5-12] are LVM PVs making up one VG "vg" and includes about 7 LVs
> 
> hdg5 is single LVM partition (~38G).
> 
> Goal is to have current LVs and VG residing on PV /dev/md3, which consists
> of /dev/hde5 and /dev/hdg5 (raid-1).
> 
> So, how to do that, any advices? I can't find out how, because: I have to
> create /dev/md3 using the same sized partitions, but I have hdg5 38G and
> hde5 about 4G, hde6 about 8G etc. sum of hde[5-12] is 38G. How can I merge
> these LVM's PV partitions without losing data in VG?
> 
> If the previous one is to be done somehow, then the tricky part is how to
> tell LVM that "ok, right now I'm using hde[5-12] as PVs, but after reboot
> use md3 as PVs for the same VG"?
> 
> Thanks in advance,
> Liivo.
> 
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
