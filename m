From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Problems after upgrading LVM
Message-ID: <20011203130616.E20168@auctionwatch.com>
References: <1007411943.2423.2.camel@ultra>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1007411943.2423.2.camel@ultra>
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
Date: Mon Dec  3 15:04:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 03, 2001 at 09:39:03PM +0100, Klaus Agnoletti wrote:
> Hi,
> I recently updated from linux 2.4.6 to 2.4.13-ac8, from LVM 0.9something
> to 1.0.1rc4.
> I am using debian, so I grabbed the two packages - lvm10 and lvm-common.
> Something must be wrong though, cause I can't mount my LVM anymore.

    2.4.13-ac8 is no good on Intel, regress to ac7. 

    I had some problems with ac8, and asked about it on the linux-kernel
    mailing list and was told by about 96G people that it was bad. 

    I don't know if this is your problem. 

> This is what happens :
> 
> Vault:~# mount /glftpd/site
> mount: /dev/site_vg/lvol1 is not a valid block device
> Vault:~# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hda8"  is associated to an unknown VG (run
> vgscan)
> pvscan -- inactive PV "/dev/hdb1"  is associated to an unknown VG (run
> vgscan)
> pvscan -- total: 2 [71.35 GB] / in use: 2 [71.35 GB] / in no VG: 0 [0]
> 
> Vault:~# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> Vault:~# vgcfgrestore -n site_vg /dev/hdb1
> vgcfgrestore -- ERROR: different structure size stored in
> "/etc/lvmconf/site_vg.conf" than expected in file vg_cfgrestore.c [line
> 139]
> vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
> "site_vg"
> 
> Vault:~# vgchange -ay
> vgchange -- no volume groups found
> 
> What's the matter ? Is it a problem that can be fixed by uuid_fixer ?
> 
> Thanks in advance,
> 
> Klaus
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Share and Enjoy. 
