From: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Subject: RE: [linux-lvm] consistent lvcreate core dump (rc4 - 2.4.10)
Date: Fri, 5 Oct 2001 09:30:12 -0400
Message-ID: <00bb01c14da1$dc743040$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.OSF.4.21.0110051348090.939-100000@europa.sanger.ac.uk>
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

I had that problem aswell.  I was using the stock compiler with RedHat
and switched to egcs 1.1.2 and it worked fine.

> -----Original Message-----
> From: linux-lvm-admin@sistina.com 
> [mailto:linux-lvm-admin@sistina.com] On Behalf Of Tony Cox
> Sent: October 5, 2001 8:58 AM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] consistent lvcreate core dump (rc4 - 2.4.10)
> 
> 
> 
> 
> I'm new to LVM so apologies if this is a FAQ.
> 
> I just installed LVM-1.0.1-rc4 on a 486-based linux box 
> running 2.4.10. It only has SCSI disks running via a 53c710 
> chip on the motherboard. It also has an adaptec 1540B scsi 
> card installed but that only hosts a scsi CDROM.
> 
> The LVM kernel patch, module build and install went without a 
> hitch. I have 5 2GB scsi disk each divided into 2 x 1GB 
> partitions. I set the 8e partion flag and created the PVs 
> without and problem. I then created a VG with 4 of the 
> partitions (sda1/2 and sdb1/2). This went OK.
> 
> Finally when I came to create an LV I got a seg fault. Using 
> the -v flag I found that it got up to the part where it was: 
> "creating logical volume VGDA in kernel". Then it crashed.
> 
> The LV create command was:
> 
> lvcreate -V -L 1000M -n backup vg1
> 
> Could anybody tell me if I am doing something wrong? - or how 
> to track down the problem? 
> 
> The pvscan and vgscan utilties reported no problems and I 
> tried restarting LVM, inactivating, reactivating the GV and 
> even deleting the whole thing including the PVs and repeating 
> the process - so it is completely reproduceable in my situation.
> 
> thanks
> 
> Tony
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com 
> http://lists.sistina.com/mailman/listinfo/linu> x-lvm
> read the 
> LVM HOW-TO at 
> http://www.sistina.com/lvm/Pages/howto.html
> 
