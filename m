From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM2 on 2.4.22. (Fedora core 1 with nptl)
Message-ID: <20031121185911.GF16523@percy.comedia.it>
References: <1069370480.3fbd4c706cd12@netmail.pipex.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1069370480.3fbd4c706cd12@netmail.pipex.net>
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
Date: Fri Nov 21 13:00:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 20, 2003 at 11:21:20PM +0000, tugg wrote:
>Trying to install LVM2 on 2.4.22. (Fedora core 1 with nptl)
>
>For device mapper: did configure followed by make install. There is no patch 
>for 2.4.22 so I assumed that the kernel was already patched (mistake?). LVM and 
Mistake

>device mapper are already loadable modules, so no need to recompile kernel 
>(correct?). Added script to /etc/modules.conf and reboot. DMESG shows LVM 
Incorrect

>version 1.0.5+(22/07/2002) module loaded.
>
>pvscan -h gives me the following:
>
>Logical Volume Manager 1.0.3
>Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
>
>	
>Why is it telling me 1.0.3 when DMESG says 1.0.5+?

1.0.5+ is the kernel driver version
1.0.3 is the version of the pvscan proram

>After trying all of the above, found patches for 2.4.22 via mailing list 
>archives (2.4.22-dm-1.tar.bz2) and upacked to get directory 2.4.22-dm-1 
>containing patch files 00001 through 00016 and INDEX. Used cat to create one 
>large patch file (file patches-2.4.22.patch attached) with all the patches 
>(mistake?) and did patch --dry-run -p1 
i would try appliyng them one by one.

>with this file (only dry run, so nothing applied yet). This indicates some 
>patches will apply, some are already applied, and quite a few will fail (see 
>attached patches-2.4.22.log file). Is this because I installed device mapper 
>before the patches, or do these patches just not fit my system? 
2.4.22-dm-1.tar.bz2appliest to vanilla 2.4.22 kernel
redhat/fedora kernel has been modified from vanilla
either you are able to massage those patches or you use vanilla or you
bug fedora developers to patch their kernel for dm.

>Also, HOWTO says I need 1.0.6 or later (I assume this is the driver version, 
>not the library version?) - do I need another kernel patch to do that, is it 
>included in the patches I am trying to apply, or will that install as part of 
>LVM2?
1.0.6 is for lvm 1, redhat lvm1 is heavily modified as well
if you devide for a vanilla kernel and want both lvm1 and lvm2 i;d
suggest using recent lvm tolls as well.
If you have not the skill to o all this, stay with fedora and wait for
them to upgrade


>cvs dm 1.0
>--- diff/Documentation/Configure.help	2003-08-26 13:49:59.000000000 +0100
>+++ source/Documentation/Configure.help	2003-08-26 13:59:04.000000000 +0100
NEVER EVER ATTACH A 350K FILE AGAIN!

L>
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
