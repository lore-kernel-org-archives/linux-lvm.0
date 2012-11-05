Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qA5LxFqQ005615
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2012 16:59:15 -0500
Received: from chkenon.earlham.edu (chkenon.earlham.edu [159.28.1.87])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id qA5LxDK2016029
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2012 16:59:13 -0500
Received: from tdream.lly.earlham.edu (tdream.lly.earlham.edu [159.28.7.241])
	by chkenon.earlham.edu with ESMTP id K13b1rARASrURls8 for
	<linux-lvm@redhat.com>; Mon, 05 Nov 2012 16:59:10 -0500 (EST)
Date: Mon, 5 Nov 2012 16:59:10 -0500 (EST)
From: Randy Schultz <schulra@earlham.edu>
Message-ID: <alpine.BSF.2.00.1211051646040.1851@tdream.lly.earlham.edu>
MIME-Version: 1.0
Subject: [linux-lvm] how to swap a bad drive on a non-standard mirror
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hey all,

I have a system that somebody set up, reportedly during the RHEL install, to have the 2 on-board drives
mirrored.  We lost the second drive.  I know how to do deal with this on a standard setup with 2 PV's, but it
looks like there is only 1 PV and I cannot find any documentation on how to deal with this.

The system has 2 drives partitioned this way:
      ? fdisk -l

      Disk /dev/sda: 1000.2 GB, 1000204886016 bytes
      255 heads, 63 sectors/track, 121601 cylinders
      Units = cylinders of 16065 * 512 = 8225280 bytes

         Device Boot      Start         End      Blocks   Id  System
      /dev/sda1   *           1          13      104391   83  Linux
      /dev/sda2              14      121600   976647577+  8e  Linux LVM

      Disk /dev/sdb: 1000.2 GB, 1000204886016 bytes
      255 heads, 63 sectors/track, 121601 cylinders
      Units = cylinders of 16065 * 512 = 8225280 bytes

         Device Boot      Start         End      Blocks   Id  System
      /dev/sdb1   *           1          13      104391   83  Linux
      /dev/sdb2              14      121600   976647577+  8e  Linux LVM


The fstab mounts things as:
      ? cat /etc/fstab
      /dev/VolGroup00/LogVol00 /                       ext3    defaults        1 1
      /dev/VolGroup00/LogVol02 /var                    ext3    defaults        1 2
      /dev/VolGroup00/LogVol03 /opt                    ext3    defaults        1 2
      LABEL=/boot             /boot                   ext3    defaults        1 2
      tmpfs                   /dev/shm                tmpfs   defaults        0 0
      devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
      sysfs                   /sys                    sysfs   defaults        0 0
      proc                    /proc                   proc    defaults        0 0
      /dev/VolGroup00/LogVol01 swap                    swap    defaults        0 0


giving these mountpoints:
      ? df -h
      Filesystem            Size  Used Avail Use% Mounted on
      /dev/mapper/VolGroup00-LogVol00
                             24G  9.1G   14G  41% /
      /dev/mapper/VolGroup00-LogVol02
                             24G  555M   22G   3% /var
      /dev/mapper/VolGroup00-LogVol03
                            770G   45G  686G   7% /opt
      /dev/mapper/isw_ccebcbejfi_Volume0p1
                             99M   26M   69M  28% /boot
      tmpfs                  14G     0   14G   0% /dev/shm

There are no md devices:
      ? cat /proc/mdstat
      Personalities :
      unused devices: <none>


DMsetup shows:
      ? dmsetup status
      isw_ccebcbejfi_Volume0p2: 0 1953295155 linear
      isw_ccebcbejfi_Volume0p1: 0 208782 linear
      VolGroup00-LogVol03: 0 1666580480 linear
      VolGroup00-LogVol02: 0 51183616 linear
      VolGroup00-LogVol01: 0 184287232 linear
      VolGroup00-LogVol00: 0 51183616 linear
      isw_ccebcbejfi_Volume0: 0 1953519352 mirror 2 8:0 8:16 14905/14905 1 AR 1 core


Here's where things get weird.  Pvscan shows only 1 device:
      ? pvscan -v
          Wiping cache of LVM-capable devices
          Wiping internal VG cache
          Walking through all physical volumes
        PV /dev/mapper/isw_ccebcbejfi_Volume0p2   VG VolGroup00   lvm2 [931.38 GB / 0    free]
        Total: 1 [931.38 GB] / in use: 1 [931.38 GB] / in no VG: 0 [0   ]


So, if I understand this correctly, sda2 and sdb2 were tied together somehow as a mirror, then this was
presented to lvm as the PV.  Cool, but how do I swap out sdb?!

--
  Randy    (schulra@earlham.edu)      765.983.1283         <*>

nosce te ipsum
