From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] VGDA error
Message-Id: <20020227103657.E19249@sistina.com>
References: <Pine.OSF.4.30.0202271006050.25336-100000@hhipe.uia.ac.be>
MIME-Version: 1.0
In-Reply-To: <Pine.OSF.4.30.0202271006050.25336-100000@hhipe.uia.ac.be>;
    from casteels@uia.ua.ac.be on Wed, Feb 27, 2002 at 10:15:21AM +0100
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
Date: Wed Feb 27 03:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Paul,

coud you send me the files created with

for d in /dev/sd[b-e]1
do
   dd if=$d of=$(basename $d).vgda bs=1k count=1k
done

in private email to mge@sistina.com for further investigation, please?

In the meantime stay using LVM 1.0.3 and if you really don't have any LVs
in that VG, recreate it from scratch :)

With LVM 1.0.3 run:

vgchange -an NUsers
pvcreate -yff /dev/sd[b-e]1
rm -r /dev/NUsers
vgcreate NUsers /dev/sd[b-e]1

Regards,
Heinz    -- The LVM Guy --


On Wed, Feb 27, 2002 at 10:15:21AM +0100, Paul.Casteels wrote:
> Hello,
> 
> I am having trouble using LVM.
> 
> This is my configuration :
> #uname -a
> Linux natl2.uia.ac.be 2.4.9-21custom #1 SMP Tue Feb 26 15:17:02 CET 2002
> i686 unknown
> #cat /proc/lvm/global
> LVM driver version LVM 0.9.1_beta7(ish) (20 June 2001)
> 
> Total:  1 VG  4 PVs  0 LVs (0 LVs open)
> Global: 4991 bytes malloced   IOP version: 10   2:14:27 active
> 
> VG:  NUsers  [4 PV, 0 LV/0 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 143622144 /35064 total  0 /0 used  143622144 /35064 free
>   PVs: [AA] sdb1 35905536 /8766 0 /0 35905536 /8766
>        [AA] sdc1 35905536 /8766 0 /0 35905536 /8766
>        [AA] sdd1 35905536 /8766 0 /0 35905536 /8766
>        [AA] sde1 35905536 /8766 0 /0 35905536 /8766
>     LVs: none
> # vgdisplay --version
> vgdisplay
> vgdisplay: Logical Volume Manager 1.0.1-rc4
> Heinz Mauelshagen, Sistina Software  03/10/2001 (IOP 10)
> 
> 
> After I started vgchange -a y, most commands report :
> ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan
> 
> If I do this I get :
> # vgscan
> vgscan
>  vgscan -- reading all physical volumes (this may take a while...)
>  vgscan -- found active volume group "NUsers"
>  vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>  vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> and the error does not go away.
> 
> I tried a more recent (1.0.3) version of the tools, but this has no
> effect.
> 
> Best regards and thanks,
> 
> Paul Casteels		Paul.Casteels@ua.ac.be	Tel: +32.3.8202455
> 						Fax: +32.3.8202470
> University of Antwerp	Dpt.Physics
> Universiteitsplein 1
> B-2610 Wilrijk
> Belgium
> 
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
