Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1BCiMi23975
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2004 07:44:22 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] (no subject)
Message-ID: <20040211124420.GB2960@redhat.com>
References: <5.2.0.9.2.20040202113058.02518690@mp3%hello.lv@hello.lv>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5.2.0.9.2.20040202113058.02518690@mp3%hello.lv@hello.lv>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 11 17:07:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 02, 2004 at 11:48:32AM +0200, Martins Pukitis wrote:
> Hello.
> LVM doesn't work on my new kernel. The previous kernel was bare.i from 
> Slackware 9.1 CD (2.4.22), without devfs support. I built the kernel with:
> /dev filesystem support		Y
> --------Automatically mount at boot	N
> --------/dev/pts file system for...	N
> Multi-device support (RAID and LVM)	Y
> --------Multiple devices driver support		Y
> --------RAID support		N  (I don' t need RAID)
> --------Logical volume manager	Y
> 
> I have folder /dev/vg00 (my volume group) with files group, home, opt, tmp, 
> usr, var.
> I also have /proc/lvm directory, that contains an empty folder VGs and file 
> global. Executing
> cat global
> displays
> LVM driver	LVM version 1.0.5+(22/07/2002)
> Total: 0 VGs, 0 PVs, 0 LVs (0 LVs open)
> Global: 144 bytes malloced
> IOP version: 10 0:22:07 active.
> 
> Logical volumes are not mounted.
> With previous kernel they are.

Did vgscan and "vgchange -ay" run at all and what did they report ?

> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat, Inc.
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
