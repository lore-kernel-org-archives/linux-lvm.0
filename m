Message-ID: <38C5B910.8F32EF32@msede.com>
Date: Wed, 08 Mar 2000 03:21:04 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: LVM+e2label
References: <Pine.LNX.4.21.0003071349060.17755-100000@p64p17bia59.aigf.sncf.fr>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: EXT / DEVOTEAM VAROQUI Christophe <ext.devoteam.varoqui@sncf.fr>, linux-lvm@msede.com

EXT / DEVOTEAM VAROQUI Christophe (ext.devoteam.varoqui@sncf.fr)
wrote:
> The mount command is able to mount filesystems naming them by their
> label instead of their device-name :
> Thus, you're free to move your disks over different targets, hosts,
> even free to insert a new host in your pci chain (feature that
> devfs doesn't provide)
> 
> Question is :
> Are the lvm-tools able to create PV and VG naming partitions by
> label instead of device-names
> If not, is it planed to do so ?

You do not need it because LVM already should do this on its own.

vgscan scans all physical devices and creates its own map in
/etc/lvmtab. With LVM block devices have symbolic names 
(/dev/vg00/lvol1) and the physical devices are discovered/associated 
by their VGDA during vgscan. The physical address should not really 
matter.

I did not actually try this but it should work.

Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
