Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9CDhB4v019086
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 09:43:11 -0400
Received: from ams-iport-1.cisco.com (ams-iport-1.cisco.com [144.254.224.140])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9CDh700022520
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 09:43:07 -0400
Received: from ams-core-1.cisco.com (ams-core-1.cisco.com [144.254.224.150])
	by ams-dkim-1.cisco.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9CDh2nv029792
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 15:43:02 +0200
Received: from xbh-ams-331.emea.cisco.com (xbh-ams-331.cisco.com
	[144.254.231.71])
	by ams-core-1.cisco.com (8.12.10/8.12.6) with ESMTP id k9CDh1md004055
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 15:43:02 +0200 (MEST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 12 Oct 2006 15:42:42 +0200
Message-ID: <DD0238A0AAE9B74A8F70A91BDF497C2F0149D9D3@xmb-ams-335.emea.cisco.com>
From: "Phil Lowden \(plowden\)" <plowden@cisco.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] RE: linux-lvm Digest, Vol 32, Issue 7
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

> ------------------------------
> 
> Message: 8
> Date: Thu, 12 Oct 2006 11:07:10 +0200
> From: "Olivier Verloove" <olivier.verloove@gmail.com>
> Subject: [linux-lvm] Mounting hardware snapshots/clones on the same
> 	host ?
> Hello,
> 
> I've seen this question a few times in the archives but 
> without any answer.
> 
> Is there a way to activate/mount a copy of a volume group taken with a
> disk-array based point-in-time copy on the same host ?
> 
> The issue is that the disk-array based software will copy all 
> information on the disk including PVID/VGID's which is confusing for
Linux's LVM.
> 
> Special tools are available on other platforms (vgchgid on 
> HP-UX, recreatevg on AIX) for this purpose.
> 
> Thanks in advance.
> 
> Best regards,
> Olivier

I have done this with EMC's Timefinder and SRDF functionality.
Basic steps are:

1. Do the array-based copy.
2. Reinitialze the new PV(s).
3. Edit a copy of the original LVM backup configuration file with
the UUID of the new PV(s), the new VG name, and a new VG UUID.
4. Restore the edited configuration file to the new PV(s).
5. Activate the new VG and use it.

At the risk of overly polluting the list, here are the actual 
steps on RHEL 4u4 with native MPIO and Timefinder.  The original 
VG is "vgphil" and the new one is "vgphilcopy".  
Each VG has 2 disks.  For simplicity's sake I did this with no 
file systems mounted from vgphil, so I don't show any I/O quiescing,
sync'ing, or fsck'ing, which would all be necessary
in the usual case.

# vgs -o +devices vgphil
  VG     #PV #LV #SN Attr   VSize  VFree  Devices

  vgphil   2   1   0 wz--n- 68.07G 67.97G 
/dev/mapper/SEMC_____SYMMETRIX______503263048000(0),
/dev/mapper/SEMC_____SYMMETRIX______50326304C000(0)
# symdg create lvmtest
# symld -g lvmtest -sid 3263 add dev 48
# symld -g lvmtest -sid 3263 add dev 4c
# symbcv -sid 3263 -g lvmtest associate dev 361
# symbcv -sid 3263 -g lvmtest associate dev 369
# symmir -g lvmtest -full -noprompt establish
# # wait awhile
# symmir -g lvmtest verify

All of the devices in group 'lvmtest' are in the 'Synchronized or
Restored' state.

# symmir -g lvmtest -noprompt split

'Split' operation execution is in progress for
device group 'lvmtest'. Please wait...

'Split' operation successfully executed for device group
'lvmtest'.

# cp /etc/lvm/backup/vgphil /etc/lvm/backup/vgphilcopy
# pvcreate -ff /dev/mapper/SEMC_____SYMMETRIX______503263361000
Really INITIALIZE physical volume
"/dev/mapper/SEMC_____SYMMETRIX______503263361000" of volume group
"vgphil" [y/n]? y
  WARNING: Forcing physical volume creation on
/dev/mapper/SEMC_____SYMMETRIX______503263361000 of volume group
"vgphil"
  Physical volume "/dev/mapper/SEMC_____SYMMETRIX______503263361000"
successfully created
# pvcreate -ff /dev/mapper/SEMC_____SYMMETRIX______503263369000
Really INITIALIZE physical volume
"/dev/mapper/SEMC_____SYMMETRIX______503263369000" of volume group
"vgphil" [y/n]? y
  WARNING: Forcing physical volume creation on
/dev/mapper/SEMC_____SYMMETRIX______503263369000 of volume group
"vgphil"
  Physical volume "/dev/mapper/SEMC_____SYMMETRIX______503263369000"
successfully created
# pvdisplay /dev/mapper/SEMC_____SYMMETRIX______503263361000
|grep UUID
  PV UUID               W9qfnc-D4g5-U0aa-zPl4-UYLt-ldOX-iY35On
# pvdisplay /dev/mapper/SEMC_____SYMMETRIX______503263369000|grep UUID
  PV UUID               TiuG51-lgAS-CfY6-rMUU-OXFb-JJ5f-zmktV1
# cp /etc/lvm/backup/vgphilcopy /etc/lvm/backup/vgphilcopy.bck
# # edit vgname and UUID and pv UUIDs
# vi /etc/lvm/backup/vgphilcopy
# diff -C 1 /etc/lvm/backup/vgphilcopy /etc/lvm/backup/vgphilcopy.bck
*** /etc/lvm/backup/vgphilcopy  2006-10-12 09:18:53.000000000 -0400
--- /etc/lvm/backup/vgphilcopy.bck      2006-10-12 09:16:32.000000000
-0400
***************
*** 10,12 ****
  
! vgphilcopy {
!       id = "PlyjQO-PRiR-JtHS-C3f5-SqiG-eJPB-2e3kdz"
--- 10,12 ----
  
! vgphil {
!       id = "plyjQO-PRiR-JtHS-C3f5-SqiG-eJPB-2e3kdz"
***************
*** 21,23 ****
                pv0 {
!                       id = "W9qfnc-D4g5-U0aa-zPl4-UYLt-ldOX-iY35On"
                        device = "/dev/dm-1"    # Hint only
--- 21,23 ----
                pv0 {
!                       id = "hwNSpt-rnD5-CYg1-3Xnk-clv0-2leP-qlKMTz"
                        device = "/dev/dm-1"    # Hint only
***************
*** 30,32 ****
                pv1 {
!                       id = "TiuG51-lgAS-CfY6-rMUU-OXFb-JJ5f-zmktV1"
                        device = "/dev/dm-2"    # Hint only
--- 30,32 ----
                pv1 {
!                       id = "wlM7pO-KFIo-nEBs-Rj0Z-v17Q-x0eQ-6FDnNj"
                        device = "/dev/dm-2"    # Hint only

# vgcfgrestore -f /etc/lvm/backup/vgphilcopy vgphilcopy
  Restored volume group vgphilcopy
# vgchange -ay vgphilcopy
  1 logical volume(s) in volume group "vgphilcopy" now active
# vgs -a | egrep 'VG|phil'
  VG         #PV #LV #SN Attr   VSize  VFree 
  vgphil       2   1   0 wz--n- 68.07G 67.97G
  vgphilcopy   2   1   0 wz--n- 68.07G 67.97G
# vgs -o +devices vgphil
  VG     #PV #LV #SN Attr   VSize  VFree  Devices

  vgphil   2   1   0 wz--n- 68.07G 67.97G
/dev/mapper/SEMC_____SYMMETRIX______503263048000(0),/dev/mapper/SEMC____
_SYMMETRIX______50326304C000(0)
# vgs -o +devices vgphilcopy
  VG         #PV #LV #SN Attr   VSize  VFree  Devices

  vgphilcopy   2   1   0 wz--n- 68.07G 67.97G
/dev/mapper/SEMC_____SYMMETRIX______503263361000(0),/dev/mapper/SEMC____
_SYMMETRIX______503263369000(0)
# lvs -a vgphil
  LV     VG     Attr   LSize   Origin Snap%  Move Log Copy% 
  lvphil vgphil -wi--- 104.00M                              
# lvs -a vgphilcopy
  LV     VG         Attr   LSize   Origin Snap%  Move Log Copy% 
  lvphil vgphilcopy -wi-a- 104.00M         
  
Hope this helps.

Phil Lowden
