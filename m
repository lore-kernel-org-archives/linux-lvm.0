Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6SAPw5t021794
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 06:25:58 -0400
Received: from web51102.mail.yahoo.com (web51102.mail.yahoo.com
	[206.190.38.144])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k6SAPm8W026721
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 06:25:48 -0400
Message-ID: <20060728102543.71001.qmail@web51102.mail.yahoo.com>
Date: Fri, 28 Jul 2006 03:25:43 -0700 (PDT)
From: Dave <davo_muc@yahoo.com>
Subject: Re: [linux-lvm] LVM1 - "VGDA in kernel and lvmtab are NOT
	consistent"error following lvm operations
In-Reply-To: <20060728094727.4F95112EDE@bluewhale.planbit.co.uk>
MIME-Version: 1.0
Reply-To: Dave <davo_muc@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roger Lucas <roger@planbit.co.uk>, LVM general discussion and development <linux-lvm@redhat.com>

Hi Roger,

Thanks for your reply.  I'm not sure if I'm facing the same issue, but I can tell you this...  I have 4 servers, 2 sets of 2 node clusters.  One application cluster of 2 servers, and one database cluster of servers.  Both servers in a cluster are attached via a QLogic HBA card to the SAN.  The setup is such that normally only one server in the cluster activates the VGs and mounts the volumes, but we have a failover setup, so that if there is a problem on one machine, that machine unmounts the file systems, deactivates the volumes, and then the backup machine scans for volumes, activates them and mounts them.  We've tested the failover scenario extensively and it works fine moving the volumes back and forth between the 2 machines.  But, perhaps after 2 switches and 2 machines doing a "vgscan", some sort of inconsistency is caused?!?!  Perhaps some info is different from the scan on each machine, which is causing the issue.  But, I would think that the information should be
 identical on both servers in the cluster.

Any additional thoughts on that?

Thanks,
Dave

----- Original Message ----
From: Roger Lucas <roger@planbit.co.uk>
To: Dave <davo_muc@yahoo.com>; LVM general discussion and development <linux-lvm@redhat.com>
Sent: Friday, July 28, 2006 11:47:17 AM
Subject: RE: [linux-lvm] LVM1 - "VGDA in kernel and lvmtab are NOT consistent"error following lvm operations

Small world - I was chasing a similar problem this morning with LVM2.

I don't know if your problem is the same as mine, but...

In my system I am using LVM within Dom0.  I am then creating "disks" for the
DomUs from the LVM partitions.  E.g.

(Hydra = Dom0)

root@hydra:~# pvs
  PV         VG    Fmt  Attr PSize   PFree
  /dev/hda3  xenvg lvm2 a-   176.05G 162.43G
root@hydra:~# vgs
  VG    #PV #LV #SN Attr   VSize   VFree
  xenvg   1   7   0 wz--n- 176.05G 162.43G
root@hydra:~# lvs
  LV           VG    Attr   LSize   Origin Snap%  Move Log Copy%
  backupimage  xenvg -ri-ao 512.00M
  harpseal     xenvg -wi-ao   5.00G
  harpseal-lvm xenvg -wi-ao   1.00G
  octopus      xenvg -wi-ao   1.00G
  octopus-lvm  xenvg -wi-ao   1.00G
  tarantula    xenvg -wi-ao   5.00G
  userdisk     xenvg -wi-a- 128.00M
root@hydra:~# cat /etc/xen/octopus
kernel = "/boot/vmlinuz-2.6.16-xen"
ramdisk = "/boot/initrd.img-2.6.16-xen"
memory = 128
name = "octopus"
# Remember in Xen we are limited to three virtual network interfaces per
DomU...
vif = ['mac=aa:00:00:00:00:e7,bridge=xenbr0',
'mac=aa:00:00:00:01:01,bridge=xenbr1',
'mac=aa:00:00:00:02:01,bridge=xenbr2']
disk = ['phy:/dev/xenvg/octopus,hda1,w','phy:/dev/xenvg/octopus-lvm,hda2,w']
hostname = "octopus"
root = "/dev/hda1 ro"
extra = "4"
root@hydra:~#

Now, the DomU is also using LVM:

root@octopus:~# pvs
  PV         VG      Fmt  Attr PSize    PFree
  /dev/hda2  storage lvm2 a-   1020.00M 380.00M
root@octopus:~# vgs
  VG      #PV #LV #SN Attr   VSize    VFree
  storage   1   2   0 wz--n- 1020.00M 380.00M
root@octopus:~# lvs
  LV          VG      Attr   LSize   Origin Snap%  Move Log Copy%
  backupimage storage -ri-ao 512.00M
  userdisk    storage -wi-a- 128.00M
root@octopus:~#


Now we have the problem!  When the Dom0 scans for LVs, it will look on
/dev/hda3 and find the "xenvg" and all its LVs.  It will then look _inside_
these LVs and find the "/dev/storage" group that really belongs to the DomU.
At this point, you have two machines accessing the same LV, which is "bad".

The solution is to restrict the Dom0 LVM to only use the devices that we
know are for scanning.  This is not the default behaviour - the default
behaviour (at least under Debian/(K)Ubuntu) is to scan pretty much every
block device in /dev - and this why the problem occurs.

I changed by Dom0 LVM configuration to only scan /dev/hda as below.

root@hydra:~# cat /etc/lvm/lvm.conf
devices {
    dir = "/dev"
    scan = [ "/dev" ]
    filter =[ "a|/dev/hda|", "r|.*|" ]
    cache = "/etc/lvm/.cache"
    write_cache_state = 1
    sysfs_scan = 1
    md_component_detection = 1
}
/snip/
root@hydra:~#

I'm not an LVM expert and I cannot tell enough from your e-mail to know if
this is your problem, but hopefully this will help you (or maybe someone
else).

BR,

Roger


> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Dave
> Sent: 28 July 2006 10:39
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] LVM1 - "VGDA in kernel and lvmtab are NOT
> consistent"error following lvm operations
> 
> Hello,
> 
> I've been using LVM (1.08), which comes by default with RedHat AS3update5,
> for over a year now and am consistently running into a problem.  I hope
> there are still some LVM version 1 users out there who have some knowledge
> about this!!
> 
> After a reboot, LVM typically functions as expected, however, oftentimes,
> after some LVM operations, I get the following sequence:
> 
> [root@mucrrp10 vb]# vgdisplay
> vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
> run vgscan
> 
> [root@mucrrp10 vb]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "prdxptux"
> vgscan -- found exported volume group "prdtuxPV_EXP"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> groups
> 
> [root@mucrrp10 vb]# vgdisplay
> vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
> run vgscan
> 
> This is troublesome because it makes it difficult to reliably use certain
> LVM commands and trust their results.  I need to minimize reboots as much
> as possible.
> 
> Any help in understanding the cause of this problem, and how to resolve
> it, or avoid it, are greatly appreciated!!
> 
> Here is some version info about the system and software (I can provide
> more information if needed):
> 
> [root@mucrrp10 vb]# cat /etc/redhat-release
>  Red Hat Enterprise Linux AS release 3 (Taroon Update 5)
>  [root@mucrrp10 vb]# uname -a
>  Linux mucrrp10 2.4.21-32.ELsmp #1 SMP Fri Apr 15 21:17:59 EDT 2005 i686
> i686 i386 GNU/Linux
>  [root@mucrrp10 vb]# rpm -qa|grep lvm
>  lvm-1.0.8-12.2
> 
> Thanks in advance for any assistance.
> Regards,
> David
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
