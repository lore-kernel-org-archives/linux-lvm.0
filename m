From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Cuncurrent access to a vg from two hosts
Message-ID: <20031114151201.H28265@sistina.com>
References: <20031113183745.GA9193@gmx.de>
Mime-Version: 1.0
In-Reply-To: <20031113183745.GA9193@gmx.de>; from wodecki@gmx.de on Thu, Nov 13, 2003 at 07:37:45PM +0100
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
Date: Fri Nov 14 08:13:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 13, 2003 at 07:37:45PM +0100, Wiktor Wodecki wrote:
> Hello,
> 
> I'm curious if lvm1 allows me to access the same volume group from to
> different machines (of course not accessing the same lv's in this vg). I
> have two machines connected to a storage array, that's why I ask. Is the
> filesystem operations on the LV affecting the VG so that this could lead
> to inconsistencies?

You can access different LVs in the same SAN shared VG presumably you
make changes to the VG (eg: create, resize LVs) when it is active (vgchange -ay)
on one of them only. After done with the changes, run vgscan and "vgchange -ay" 
on the other machine.

> 
> -- 
> Regards,
> 
> Wiktor Wodecki
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

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
