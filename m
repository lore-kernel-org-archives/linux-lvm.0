Return-Path: <thornber@btconnect.com>
Date: Fri, 13 Jul 2001 09:43:31 +0100
Subject: Re: [linux-lvm] LVM 0.9.1 beta 7 & CVS differences ?
Message-ID: <20010713094331.E1563@btconnect.com>
References: <005a01c10b2a$148cd370$0f01a8c0@ws1>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <005a01c10b2a$148cd370$0f01a8c0@ws1>; from list@showme.wox.org on Fri, Jul 13, 2001 at 01:26:30AM +0200
From: Joe Thornber <thornber@btconnect.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Migration tool has been written (pvversion), and is being tested at
the moment.  Please roll back to beta7 tools until we're sure it's correct.

- Joe


On Fri, Jul 13, 2001 at 01:26:30AM +0200, Bas wrote:
> Hi,
> 
> I'm using an XFS enabled 2.4.6 kernel. It used to run with 0.9.1 beta 6, and
> could be upgraded to 0.9.1 beta 7. LVM is not compiled as a module, it's in
> the kernel.
> 
> I applied the CVS patch today (after the Oops ... message), and tried to
> boot using a newly generated initrd. Now it can't seem to find my volume
> group. Whenever I start using my old LVM kernel, it can read my VG and all
> assiocated LV's. When I run the new tools on my old kernel, it says
> 
> lsvg -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> vgscan. Whenever I run vgscan, I end up with an empty /etc/lvmtab.d and an
> empty  /etc/lvmtab, but it doesn't change anything.
> 
> pvscan returns:
> [bigdude]#pvscan -u
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ERROR "pv_read(): LVM structure version" reading physical volumes
> 
> I recompiled the 0.9.1 beta 7 tools, and it returns:
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/scsi/host0/bus0/target0/lun0/part2" of VG
> "rootvg" [8.45 GB / 3.89 GB free]
> pvscan -- total: 1 [8.45 GB] / in use: 1 [8.45 GB] / in no VG: 0 [0]
> 
> Is there some kind of migration tool ?
> 
> Thanks,
> Bas.
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
