Return-Path: <fabian.herschel@suse.de>
From: fabian herschel <fabian.herschel@suse.de>
Subject: Re: [linux-lvm] vgscan does not found my VG, but pvscan does...
Date: Wed, 25 Apr 2001 10:06:58 +0200
References: <000901c0cd36$a80064a0$7d80a8c0@dyndns.org>
In-Reply-To: <000901c0cd36$a80064a0$7d80a8c0@dyndns.org>
MIME-Version: 1.0
Message-Id: <01042510065800.15131@workstation>
Content-Transfer-Encoding: 8bit
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

On Wednesday 25 April 2001 05:20, you wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Have you tried a vgimport?

Yes I did. vgimport does not want to import the VG, because it is not an 
exported one :((.

On an other machine I had the same problem and I tried to make a vgexport.
The _export_ went well (the VG was exported but I could not re-import it ).

I tried some things last night... 
  - First I have saved the heder blocks (VGDA) with dd (dd if=/dev/sda1   \
     of=/root/HEAD_sda1 count=4596 bs=512) 
  - Then I called a vgcfgrestore -n sysvg /dev/sda1.
  - Now pvscan tells me both PVs are in the VG sysvg. 
  - "vgchange -ay sysvg" activated the VG and the LVs could me mounted 

BUT
  - vgscan does NOT find the sysvg!!!
  - After a reboot the sysvg is not available.
  - Every time I have to call a vgcfgrestore :((

I have written a C-program which could retrieve all data from a LV, if pvdata 
-E reports correctly, but the LV could not be activated. But this is only a 
very bad work arround to retrieve my data. But I need a way to reactivate my 
VG, so it could be found by vgscan.

I'm hopeful we will find a solution.
Fabian Herschel
