From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] exporting/importing a LVM volume
Message-ID: <20031216192441.B18654@sistina.com>
References: <001201c3c24c$cc77c450$0200000a@ray1>
Mime-Version: 1.0
In-Reply-To: <001201c3c24c$cc77c450$0200000a@ray1>; from brad.p@frisurf.no on Sun, Dec 14, 2003 at 03:15:59PM +0100
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
Date: Tue Dec 16 12:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ray,

your output below shows /dev/sdb[12] as PVs, so your
vgimport command line should read:

# vgimport design /dev/sdb[12]


On Sun, Dec 14, 2003 at 03:15:59PM +0100, brad.p@frisurf.no wrote:
> Hi all, 
>  
>  
> I need to move a lvm volme over to a new os install. And this is what i
> did.
>  
> Before installing the new os, i did a vgexport name
> and acording to the howto, all i need to do on my new os is pvscan and
> then vgimport name /dev/dev1 + + + + 
>  
> (http://tldp.org/HOWTO/LVM-HOWTO/x978.html)
>  
> However when trying to import it i get these messages:
>  
> pvscan -- reading all physical volumes (this may take a while....)
> pvscan -- inactive PV "/dev/sdc1" is in no VG [111.76GB]
> pvscan -- total: 1 [111.76GB] / in use: 0 [0] / in no VG: 1 [111.76GB]
>  
> Its supposed to say something like this: (paste from the howto)
>  
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sdb1"  is in EXPORTED VG "design" [996 MB /
> 996 MB free]
> pvscan -- inactive PV "/dev/sdb2"  is in EXPORTED VG "design" [996 MB /
> 244 MB free]
> pvscan -- total: 2 [1.95 GB] / in use: 2 [1.95 GB] / in no VG: 0 [0]
> 
> If i try the vgimport i get this message:
>  
> vgimport -- ERROR "pv_read(): PV identifier invalid" reading physical
> volume "/dev/sda1"
>  
> Anyone got a hint what i need to do to get this LVM up and running again
> ?
>  
> Ray

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
