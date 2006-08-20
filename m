Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7KHanF2023284
	for <linux-lvm@redhat.com>; Sun, 20 Aug 2006 13:36:49 -0400
Received: from exfe01.apparatushosting.net (exfe01.apparatushosting.net
	[209.43.5.6])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7KHabfk006807
	for <linux-lvm@redhat.com>; Sun, 20 Aug 2006 13:36:37 -0400
From: Andrew Jones <ajones@apparatus.net>
Content-Type: multipart/mixed; boundary="=-MWjVhyIvBTiPMGeVyCrp"
Date: Sun, 20 Aug 2006 13:34:54 -0400
Message-Id: <1156095294.3778.5.camel@dividebyzero.somewhere.localtld>
Mime-Version: 1.0
Subject: [linux-lvm] after vgreduce --remove-missing,
	*no* lvm commands work correctly
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-MWjVhyIvBTiPMGeVyCrp
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm at the end of my rope on this one.  I added a new RAID array to a
system, started a pvmove, then hardware failure forced me to abort it.
"pvmove --abort" didn't appear to do anything, so I attempted to move on
with "vgreduce --remove-missing vg0".

Now, absolutely no commands work on the vg0 group.  Attached the output
of vgscan -v -v and vgchange -a y -v -v, but all commands have very
similar output, with the same old error of "Couldn't find volume
'pvmove0' for segment 'start_extent'."



--=-MWjVhyIvBTiPMGeVyCrp
Content-Disposition: attachment; filename=vgscan.out
Content-Type: text/plain; name=vgscan.out; charset=UTF-8
Content-Transfer-Encoding: 7bit

Script started on Sun Aug 20 13:27:05 2006
root@Amnesiac#vgscan -v -v
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
      /dev/ram0: size is 16384 sectors
      /dev/ram0: size is 16384 sectors
      /dev/ram0: No label detected
      /dev/hda: size is 240121728 sectors
      /dev/md0: size is 937744896 sectors
      /dev/md0: size is 937744896 sectors
      /dev/md0: lvm2 label detected
      /dev/hdc: size is 58633344 sectors
      /dev/ram1: size is 16384 sectors
      /dev/ram1: size is 16384 sectors
      /dev/ram1: No label detected
      /dev/hda1: size is 240121665 sectors
      /dev/hda1: size is 240121665 sectors
      /dev/md1: size is 480242944 sectors
      /dev/md1: size is 480242944 sectors
      /dev/md1: lvm2 label detected
      /dev/hdc1: size is 4192902 sectors
      /dev/hdc1: size is 4192902 sectors
      /dev/hdc1: No label detected
      /dev/ram2: size is 16384 sectors
      /dev/ram2: size is 16384 sectors
      /dev/ram2: No label detected
      /dev/md2: size is 937729536 sectors
      /dev/md2: size is 937729536 sectors
      /dev/md2: lvm2 label detected
      /dev/hdc2: size is 208845 sectors
      /dev/hdc2: size is 208845 sectors
      /dev/hdc2: No label detected
      /dev/ram3: size is 16384 sectors
      /dev/ram3: size is 16384 sectors
      /dev/ram3: No label detected
      /dev/hdc3: size is 2 sectors
      /dev/ram4: size is 16384 sectors
      /dev/ram4: size is 16384 sectors
      /dev/ram4: No label detected
      /dev/hdc4: size is 38588130 sectors
      /dev/hdc4: size is 38588130 sectors
      /dev/hdc4: No label detected
      /dev/ram5: size is 16384 sectors
      /dev/ram5: size is 16384 sectors
      /dev/ram5: No label detected
      /dev/hdc5: size is 15631182 sectors
      /dev/hdc5: size is 15631182 sectors
      /dev/hdc5: No label detected
      /dev/ram6: size is 16384 sectors
      /dev/ram6: size is 16384 sectors
      /dev/ram6: No label detected
      /dev/ram7: size is 16384 sectors
      /dev/ram7: size is 16384 sectors
      /dev/ram7: No label detected
      /dev/ram8: size is 16384 sectors
      /dev/ram8: size is 16384 sectors
      /dev/ram8: No label detected
      /dev/ram9: size is 16384 sectors
      /dev/ram9: size is 16384 sectors
      /dev/ram9: No label detected
      /dev/ram10: size is 16384 sectors
      /dev/ram10: size is 16384 sectors
      /dev/ram10: No label detected
      /dev/ram11: size is 16384 sectors
      /dev/ram11: size is 16384 sectors
      /dev/ram11: No label detected
      /dev/ram12: size is 16384 sectors
      /dev/ram12: size is 16384 sectors
      /dev/ram12: No label detected
      /dev/ram13: size is 16384 sectors
      /dev/ram13: size is 16384 sectors
      /dev/ram13: No label detected
      /dev/ram14: size is 16384 sectors
      /dev/ram14: size is 16384 sectors
      /dev/ram14: No label detected
      /dev/ram15: size is 16384 sectors
      /dev/ram15: size is 16384 sectors
      /dev/ram15: No label detected
      Locking /var/lock/lvm/V_vg1 RB
    Finding volume group "vg1"
      /dev/md2: lvm2 label detected
      /dev/md2: lvm2 label detected
  Found volume group "vg1" using metadata type lvm2
      Unlocking /var/lock/lvm/V_vg1
      Locking /var/lock/lvm/V_vg0 RB
    Finding volume group "vg0"
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
  Couldn't find volume 'pvmove0' for segment 'start_extent'.
  Couldn't read all logical volumes for volume group vg0.
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
  Couldn't find volume 'pvmove0' for segment 'start_extent'.
  Couldn't read all logical volumes for volume group vg0.
      /dev/ram0: No label detected
      /dev/md0: lvm2 label detected
      /dev/ram1: No label detected
      /dev/md1: lvm2 label detected
      /dev/hdc1: No label detected
      /dev/ram2: No label detected
      /dev/md2: lvm2 label detected
      /dev/hdc2: No label detected
      /dev/ram3: No label detected
      /dev/ram4: No label detected
      /dev/hdc4: No label detected
      /dev/ram5: No label detected
      /dev/hdc5: No label detected
      /dev/ram6: No label detected
      /dev/ram7: No label detected
      /dev/ram8: No label detected
      /dev/ram9: No label detected
      /dev/ram10: No label detected
      /dev/ram11: No label detected
      /dev/ram12: No label detected
      /dev/ram13: No label detected
      /dev/ram14: No label detected
      /dev/ram15: No label detected
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
  Couldn't find volume 'pvmove0' for segment 'start_extent'.
  Couldn't read all logical volumes for volume group vg0.
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
  Couldn't find volume 'pvmove0' for segment 'start_extent'.
  Couldn't read all logical volumes for volume group vg0.
  Volume group "vg0" not found
      Unlocking /var/lock/lvm/V_vg0
root@Amnesiac#^D
Script done on Sun Aug 20 13:27:11 2006

--=-MWjVhyIvBTiPMGeVyCrp
Content-Disposition: attachment; filename=vgchange.out
Content-Type: text/plain; name=vgchange.out; charset=UTF-8
Content-Transfer-Encoding: 7bit

Script started on Sun Aug 20 13:26:42 2006
root@Amnesiac#vgscan -[K[K[K[K[Kchange -a -y[K[Ky -v -v 
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Finding all volume groups
      /dev/ram0: No label detected
      /dev/md0: lvm2 label detected
      /dev/ram1: No label detected
      /dev/md1: lvm2 label detected
      /dev/hdc1: No label detected
      /dev/ram2: No label detected
      /dev/md2: lvm2 label detected
      /dev/hdc2: No label detected
      /dev/ram3: No label detected
      /dev/ram4: No label detected
      /dev/hdc4: No label detected
      /dev/ram5: No label detected
      /dev/hdc5: No label detected
      /dev/ram6: No label detected
      /dev/ram7: No label detected
      /dev/ram8: No label detected
      /dev/ram9: No label detected
      /dev/ram10: No label detected
      /dev/ram11: No label detected
      /dev/ram12: No label detected
      /dev/ram13: No label detected
      /dev/ram14: No label detected
      /dev/ram15: No label detected
      Locking /var/lock/lvm/V_vg1 RB
    Finding volume group "vg1"
      /dev/md2: lvm2 label detected
      /dev/md2: lvm2 label detected
  0 logical volume(s) in volume group "vg1" now active
      Unlocking /var/lock/lvm/V_vg1
      Locking /var/lock/lvm/V_vg0 RB
    Finding volume group "vg0"
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
  Couldn't find volume 'pvmove0' for segment 'start_extent'.
  Couldn't read all logical volumes for volume group vg0.
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
  Couldn't find volume 'pvmove0' for segment 'start_extent'.
  Couldn't read all logical volumes for volume group vg0.
    Wiping cache of LVM-capable devices
      /dev/ram0: size is 16384 sectors
      /dev/ram0: size is 16384 sectors
      /dev/ram0: No label detected
      /dev/hda: size is 240121728 sectors
      /dev/md0: size is 937744896 sectors
      /dev/md0: size is 937744896 sectors
      /dev/md0: lvm2 label detected
      /dev/hdc: size is 58633344 sectors
      /dev/ram1: size is 16384 sectors
      /dev/ram1: size is 16384 sectors
      /dev/ram1: No label detected
      /dev/hda1: size is 240121665 sectors
      /dev/hda1: size is 240121665 sectors
      /dev/md1: size is 480242944 sectors
      /dev/md1: size is 480242944 sectors
      /dev/md1: lvm2 label detected
      /dev/hdc1: size is 4192902 sectors
      /dev/hdc1: size is 4192902 sectors
      /dev/hdc1: No label detected
      /dev/ram2: size is 16384 sectors
      /dev/ram2: size is 16384 sectors
      /dev/ram2: No label detected
      /dev/md2: size is 937729536 sectors
      /dev/md2: size is 937729536 sectors
      /dev/md2: lvm2 label detected
      /dev/hdc2: size is 208845 sectors
      /dev/hdc2: size is 208845 sectors
      /dev/hdc2: No label detected
      /dev/ram3: size is 16384 sectors
      /dev/ram3: size is 16384 sectors
      /dev/ram3: No label detected
      /dev/hdc3: size is 2 sectors
      /dev/ram4: size is 16384 sectors
      /dev/ram4: size is 16384 sectors
      /dev/ram4: No label detected
      /dev/hdc4: size is 38588130 sectors
      /dev/hdc4: size is 38588130 sectors
      /dev/hdc4: No label detected
      /dev/ram5: size is 16384 sectors
      /dev/ram5: size is 16384 sectors
      /dev/ram5: No label detected
      /dev/hdc5: size is 15631182 sectors
      /dev/hdc5: size is 15631182 sectors
      /dev/hdc5: No label detected
      /dev/ram6: size is 16384 sectors
      /dev/ram6: size is 16384 sectors
      /dev/ram6: No label detected
      /dev/ram7: size is 16384 sectors
      /dev/ram7: size is 16384 sectors
      /dev/ram7: No label detected
      /dev/ram8: size is 16384 sectors
      /dev/ram8: size is 16384 sectors
      /dev/ram8: No label detected
      /dev/ram9: size is 16384 sectors
      /dev/ram9: size is 16384 sectors
      /dev/ram9: No label detected
      /dev/ram10: size is 16384 sectors
      /dev/ram10: size is 16384 sectors
      /dev/ram10: No label detected
      /dev/ram11: size is 16384 sectors
      /dev/ram11: size is 16384 sectors
      /dev/ram11: No label detected
      /dev/ram12: size is 16384 sectors
      /dev/ram12: size is 16384 sectors
      /dev/ram12: No label detected
      /dev/ram13: size is 16384 sectors
      /dev/ram13: size is 16384 sectors
      /dev/ram13: No label detected
      /dev/ram14: size is 16384 sectors
      /dev/ram14: size is 16384 sectors
      /dev/ram14: No label detected
      /dev/ram15: size is 16384 sectors
      /dev/ram15: size is 16384 sectors
      /dev/ram15: No label detected
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
  Couldn't find volume 'pvmove0' for segment 'start_extent'.
  Couldn't read all logical volumes for volume group vg0.
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
  Couldn't find volume 'pvmove0' for segment 'start_extent'.
  Couldn't read all logical volumes for volume group vg0.
  Unable to find volume group "vg0"
      Unlocking /var/lock/lvm/V_vg0
root@Amnesiac#^Dexit

Script done on Sun Aug 20 13:26:50 2006

--=-MWjVhyIvBTiPMGeVyCrp--
