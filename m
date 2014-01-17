Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0HKI8gT007450
	for <linux-lvm@redhat.com>; Fri, 17 Jan 2014 15:18:08 -0500
Received: from p01c11o149.mxlogic.net (p01c11o149.mxlogic.net [208.65.144.72])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0HKI36S023750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 17 Jan 2014 15:18:05 -0500
Received: from EXHQ1.corp.stratus.com (exhq1.corp.stratus.com
	[134.111.200.125])
	by mailhub4.stratus.com (8.12.11/8.12.11) with ESMTP id s0HKI2cn007858
	for <linux-lvm@redhat.com>; Fri, 17 Jan 2014 15:18:02 -0500
Message-ID: <52D98FFA.7020203@stratus.com>
Date: Fri, 17 Jan 2014 15:18:02 -0500
From: Nate Dailey <nate.dailey@stratus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------010907090701010705030508"
Subject: [linux-lvm] system won't boot after disk pull, vgreduce,
 reboot after re-inserting disk
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
To: linux-lvm@redhat.com

--------------010907090701010705030508
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi, I'm looking for some advice as to how to deal with this situation.

A disk is pulled. Then vgreduce is used to take it out of the volume 
group. System is shut down. Disk is re-inserted. Now the system won't 
boot because "Recovery of volume group failed".

This is because in the initramfs, read-only locking is used. I verified 
that if I changed the initramfs to use file locking (locking_type = 1), 
it boots fine. I gather that this isn't safe though (it's unclear to me 
why).

Is this something that could ever be fixed in LVM, or is there just no 
way out of this without manual intervention? Maybe some way that LVM 
could automatically ignore the problem device?

Thanks,

Nate



Here's a demonstration of the problem without requiring a reboot:

[root@node0 ~]# vgcreate testvg /dev/sdd2 /dev/sde2
   Volume group "testvg" successfully created

[root@node0 ~]# lvcreate -n testlv1 -L 1G testvg /dev/sdd2
   Logical volume "testlv1" created

[root@node0 ~]# lvcreate -n testlv2 -L 1G testvg /dev/sde2
   Logical volume "testlv2" created

[root@node0 ~]# echo 1 > /sys/block/sde/device/delete

[root@node0 ~]# vgreduce --force --removemissing testvg
   /dev/testvg/testlv2: read failed after 0 of 4096 at 1073676288: 
Input/output error
   /dev/testvg/testlv2: read failed after 0 of 4096 at 1073733632: 
Input/output error
   /dev/testvg/testlv2: read failed after 0 of 4096 at 0: Input/output error
   /dev/testvg/testlv2: read failed after 0 of 4096 at 4096: 
Input/output error
   Couldn't find device with uuid Nf66FO-dgXw-4pTa-lmB7-YAfL-AM4W-0iy6CA.
   Removing partial LV testlv2.
   Logical volume "testlv2" successfully removed
   Wrote out consistent volume group testvg

[root@node0 ~]# emacs /etc/lvm/lvm.conf (change locking_type to 4 to 
simulate initramfs environment)

[root@node0 ~]# echo "- - -" > /sys/class/scsi_host/host0/scan

[root@node0 ~]# lvscan
   Read-only locking type set. Write locks are prohibited.
   Recovery of volume group "testvg" failed.
   Internal error: Attempt to unlock unlocked VG testvg.
   Skipping volume group testvg

(this is what I see during the failed boot)

[root@node0 ~]# emacs /etc/lvm/lvm.conf (change locking_type back to 1)

[root@node0 ~]# lvscan
   WARNING: Inconsistent metadata found for VG testvg - updating to use 
version 5
   Removing PV /dev/sde2 (Nf66FO-dgXw-4pTa-lmB7-YAfL-AM4W-0iy6CA) that 
no longer belongs to VG testvg
   ACTIVE            '/dev/testvg/testlv1' [1.00 GiB] inherit


--------------010907090701010705030508
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font size="-1">Hi, I'm looking for some advice as to how to deal
      with this situation.<br>
      <br>
      A disk is pulled. Then vgreduce is used to take it out of the
      volume group. System is shut down. Disk is re-inserted. Now the
      system won't boot because </font><font size="-1"><font size="-1">"Recovery
        of volume group failed".<br>
        <br>
        This is because in the initramfs, read-only locking is used. I
        verified that if I changed the initramfs to use file locking
        (locking_type = 1), it boots fine. I gather that this isn't safe
        though (it's unclear to me why).<br>
        <br>
        Is this something that could ever be fixed in LVM, or is there
        just no way out of this without manual intervention? Maybe some
        way that LVM could automatically ignore the problem device?<br>
        <br>
        Thanks,<br>
        <br>
        Nate<br>
        <br>
        <br>
        <br>
        Here's a demonstration of the problem without requiring a
        reboot:<br>
        <br>
      </font>[root@node0 ~]# vgcreate testvg /dev/sdd2 /dev/sde2<br>
      &nbsp; Volume group "testvg" successfully created<br>
      <br>
      [root@node0 ~]# lvcreate -n testlv1 -L 1G testvg /dev/sdd2<br>
      &nbsp; Logical volume "testlv1" created<br>
      <br>
      [root@node0 ~]# lvcreate -n testlv2 -L 1G testvg /dev/sde2<br>
      &nbsp; Logical volume "testlv2" created<br>
      <br>
      [root@node0 ~]# echo 1 &gt; /sys/block/sde/device/delete<br>
      <br>
      [root@node0 ~]# vgreduce --force --removemissing testvg<br>
      &nbsp; /dev/testvg/testlv2: read failed after 0 of 4096 at 1073676288:
      Input/output error<br>
      &nbsp; /dev/testvg/testlv2: read failed after 0 of 4096 at 1073733632:
      Input/output error<br>
      &nbsp; /dev/testvg/testlv2: read failed after 0 of 4096 at 0:
      Input/output error<br>
      &nbsp; /dev/testvg/testlv2: read failed after 0 of 4096 at 4096:
      Input/output error<br>
      &nbsp; Couldn't find device with uuid
      Nf66FO-dgXw-4pTa-lmB7-YAfL-AM4W-0iy6CA.<br>
      &nbsp; Removing partial LV testlv2.<br>
      &nbsp; Logical volume "testlv2" successfully removed<br>
      &nbsp; Wrote out consistent volume group testvg<br>
      <br>
      [root@node0 ~]# emacs /etc/lvm/lvm.conf (change locking_type to 4
      to simulate initramfs environment)<br>
      <br>
      [root@node0 ~]# echo "- - -" &gt; /sys/class/scsi_host/host0/scan
      <br>
      <br>
      [root@node0 ~]# lvscan<br>
      &nbsp; Read-only locking type set. Write locks are prohibited.<br>
      &nbsp; Recovery of volume group "testvg" failed.<br>
      &nbsp; Internal error: Attempt to unlock unlocked VG testvg.<br>
      &nbsp; Skipping volume group testvg<br>
      <br>
      (this is what I see during the failed boot)<br>
      <br>
      [root@node0 ~]# emacs /etc/lvm/lvm.conf (change locking_type back
      to 1)<br>
      <br>
      [root@node0 ~]# lvscan<br>
      &nbsp; WARNING: Inconsistent metadata found for VG testvg - updating to
      use version 5<br>
      &nbsp; Removing PV /dev/sde2 (Nf66FO-dgXw-4pTa-lmB7-YAfL-AM4W-0iy6CA)
      that no longer belongs to VG testvg<br>
      &nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '/dev/testvg/testlv1' [1.00 GiB] inherit<br>
      <br>
    </font>
  </body>
</html>

--------------010907090701010705030508--
