Return-Path: <lembark@wrkhors.com>
Message-ID: <3A4E4F6A.8AE39C23@wrkhors.com>
Date: Sat, 30 Dec 2000 15:11:06 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 0.8 to 0.9 problems, odd vg corruption
References: <20001227165905.A24456@kevorkian.evcom.net> <20001230190420.B6496@jensbenecke.de>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> After about half an hour of fiddling with the LVM tools and reading the
> FAQ, I found out that I could access the LV if and ONLY IF I did EXACTLY
> this:
> 
>         vgcfgrestore -n data /dev/hd[ac]1
>         pvscan
>         vgchange -a y
>         mount /dev/data/archive
> 
> Any call to vgscan brings me back to the beginning ("unknown VG").
> 
> The problem however is this: Since then, even when booting cleanly vgscan
> doesn't detect any VGs any more. Before, it worked. I have compiled LVM
> into the kernel (no module) and attached the Debian startup script which I
> have modified slightly to accommodate for the no-module situation.


try:

	vgexport /dev/vgname;
	vgimport /dev/vgname /devices/in/the/vg;

should save you the problems.  

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
