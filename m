From: Tobias Wagener <tobias-lvm@tobias.wagener.nu>
Subject: Re: [linux-lvm] Can I dd one disc of a lv
Message-ID: <20031106135231.A1157@wagener.nu>
References: <20031106130748.A15981@wagener.nu> <3FAA3C95.8010708@webhackande.se> <20031106134246.A16570@wagener.nu> <3FAA42D1.3080102@webhackande.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FAA42D1.3080102@webhackande.se>; from richie@webhackande.se on Thu, Nov 06, 2003 at 01:47:13PM +0100
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
Date: Thu Nov  6 06:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

After I switched the new disc to the "hdX" of the old one? Or in which way
knows the lvm to use the new disc?

On 06/11/03 13:47, Rickard Olsson wrote:
> Tobias Wagener wrote:
> 
> > vgexport the VG, and then vgimport with the new device? Or do I use
> > a "vgcfgrestore" and "vgcfgbackup" also?
> 
> vgexport/import shouldn't be needed. pvcreate the new disk, 
> vgcfgrestore, vgscan and vgchange -ay.
> 
>     / Rickard Olsson,IT-Konsult/
>    / Telefon: +46 70 635 01 42/
>   / http://www.webhackande.se/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
