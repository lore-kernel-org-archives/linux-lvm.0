From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] One PV destroyed - now the whole VG isn't working anymore
Message-ID: <20031103110555.E1850@sistina.com>
References: <20031101142538.34423cb0.sebastian@beneke-it.de>
Mime-Version: 1.0
In-Reply-To: <20031101142538.34423cb0.sebastian@beneke-it.de>; from sebastian@beneke-it.de on Sat, Nov 01, 2003 at 02:25:38PM +0100
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
Date: Mon Nov  3 04:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Sebastian,

you either want to use LVM2/device-mapper and try the "vgchange -P ..."
option to activate partially available VGs

-or-

a quick hack to get LVM1 going:

mkdir /etc/lvmtab.d
cp /etc/lvmconf/storage.conf /etc/lvmtab.d/storage
echo -ne "storage\0" > /etc/lvmtab
vgchange -ay storage

If you have those contents in /etc/lvmtab and /etc/lvmtab.d/storage restored
anyway, "vgchange -ay storage" is all you need to do.

Either way presumes, that enough logical extends are accessable fine.
Backup your data and recreate the VG afterwards.

Regards,
Heinz    -- The LVM Guy --


On Sat, Nov 01, 2003 at 02:25:38PM +0100, Sebastian Beneke wrote:
> Hi there,
> 
> i've got a really big problem. My VG "storage" consists of two PVs:
> /dev/hdc (120GB full) and /dev/hde (160GB, 40 GB free). Now /dev/hde
> was destroyed by"dd if=/dev/zero of=/dev/diskname bs=1k count=1"
> 
> I did these steps until now:
> 
> 1.) copy back my old files: /etc/lvmconf/ /etc/lvmtab
> /etc/lvmtab.d/
> 
> 2.) take a new hdd (same type and size as my old /dev/hde)
> 
> 3.) pvcreate /dev/hde
> 
> 4.) vgcfgrestore -f /etc/lvmconf/storage.conf -n storage /dev/hde
> 
> ===> This gave me following error: vgcfgrestore -- ERROR
> "vg_cfgrestore(): pv_check_consistency" restoring volume group
> "storage"
> 
> So just replacing the old disk doesn't work for me. I gave it up. But
> there are still 120GB of data on /dev/hdc, is there any way I can
> rescue this data? It hurts enough to lose 100GB, but I couldn't take
> it to lose another 120GB!
> 
> I hope anybody can help me out here!
> 
> 
> Best Regards
> Sebastian
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
