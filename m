Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104251553.f3PFr1j7031199@webber.adilger.int>
Subject: Re: [linux-lvm] vgscan does not found my VG, but pvscan does...
In-Reply-To: <01042510065800.15131@workstation> "from fabian herschel at Apr
 25, 2001 10:06:58 am"
Date: Wed, 25 Apr 2001 09:53:01 -0600 (MDT)
MIME-Version: 1.0
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

Fabian Herschel writes:
> I tried some things last night... 
>   - First I have saved the heder blocks (VGDA) with dd (dd if=/dev/sda1   \
>      of=/root/HEAD_sda1 count=4596 bs=512) 
>   - Then I called a vgcfgrestore -n sysvg /dev/sda1.
>   - Now pvscan tells me both PVs are in the VG sysvg. 
>   - "vgchange -ay sysvg" activated the VG and the LVs could me mounted 
> 
> BUT
>   - vgscan does NOT find the sysvg!!!
>   - After a reboot the sysvg is not available.
>   - Every time I have to call a vgcfgrestore :((

Can you post "pvdata -PPU <dev>" for each PV in the VG?  Also, can you
look through "vgscan -v -d" output to see why it is not finding all of
the PVs it wants?  This sounds like the old UUID problem.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
