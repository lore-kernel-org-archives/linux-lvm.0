From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] VG lost, no lvmconf => Help !
Message-Id: <20020124154339.A8972@sistina.com>
References: <3C4EDF1A.3000409@cgg.com>
MIME-Version: 1.0
In-Reply-To: <3C4EDF1A.3000409@cgg.com>; from gduquesnay@cgg.com on Wed,
    Jan 23, 2002 at 05:04:42PM +0100
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
Date: Thu Jan 24 08:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Can you send "vgscan -d" to me in personal email (mge@sistina.com)?
What does lvm-1.0.1-1 mean. We don't have such version.
Please check with for eg. "vgdisplay -h".


On Wed, Jan 23, 2002 at 05:04:42PM +0100, Guillaume Duquesnay wrote:
> Here's my startup config :
> on a single SCSI disk :
> - linux 2.4.17 was booting on an lvm partiton, VG main, with LV : root, 
> usr, boot, and  var.
> - an old linux system, 2.4.17 also, but classical ext2-based.
> 
> The LVM linux system was created by copying the root partitions of the 
> ext2 system (as described in the LVM doc). Everything was working great 
> with the LVM-based system, but i kept the old ext2 system as a rescue 
> linux. Then, I did a vgextend to a remaining PV to my VG, and it boot 
> and works already.
> 
> Problems arrived when i tried to add a SCSI CD burner : lvm didn't find 
> the PVs, nor the VG, causing a kernel panic at boot time, and so did the 
> ext2 linux. I was unable to fix that problem (SCSI id checked, ...), i 
> removed that SCSI device, and then only the ext2 system did boot again. 
> My vg was no longer detected.
> 
> So, here's where i am : under the ext2 system, i have no lvmtab for my 
> VG, neither a recent main.conf, and my vg is no more detected, so i 
> cannot recover my vg with vgcfgrestore. I did scan the 2 LVM PVs, and 
> they are ok.
> So my question is :
> is there a way to recover my VG with the datas contained in the PVs ?
> 
> info :
> 
> The system is a Linux-2.4.17 based kernel, with lvm-1.0.1-1
> 
> Here's my log :
> 
> ////////------pvscan-------
> # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sda1"  is associated to an unknown VG (run 
<SNIP>
> Many thanks,
> 
> Guillaume
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
