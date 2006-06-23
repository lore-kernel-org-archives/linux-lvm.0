Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5N6sNPq006444
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 02:54:23 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.185])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5N6sGTw010232
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 02:54:16 -0400
Received: by nf-out-0910.google.com with SMTP id h2so7431nfe
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 23:54:16 -0700 (PDT)
Message-ID: <9fcb471e0606222354i6460bd02jf75fac7caebb3f2b@mail.gmail.com>
Date: Fri, 23 Jun 2006 02:54:15 -0400
From: "Argus Array" <argusarray2@gmail.com>
In-Reply-To: <9fcb471e0606222346yf25f198ve73e877d24db257c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_19959_18881252.1151045655982"
References: <9fcb471e0606222346yf25f198ve73e877d24db257c@mail.gmail.com>
Subject: [linux-lvm] Re: newbie problem with LVM
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

------=_Part_19959_18881252.1151045655982
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Terribly sorry for the double post to the mailing list, accidentally hit the
google shortcut.

I have been using LVM for several months to record video files for my PVR
across a 200GB and 160GB disk (hdb and hdc).

Recently I decided to upgrade my FC3 install to FC5.  After the install, my
LVM mount does not come up.  It appeared that all of the LVM information in
/dev/ was gone; however, only the non-LVM drive (/dev/hda) should have been
touched by the FC5 upgrade.

This is my fstab entry:
/dev/VGforMythTV/video  /var/media              xfs     defaults        1 1

This is what fdisk shows:
/dev/hdb1               1       24792   199141708+  8e  Linux LVM

/dev/hdc1               1       19929   160079661   8e  Linux LVM

In my attempt to fix this, I think I may have totally fouled things up; I
tried to create a new volume group with the same name and more PVs for the
new drives, then combine them together into an PV with the old LV name.
However, this still does not allow it to mount.

Any ideas?  Have I deleted all my data?

Thanks for any help,

Argus

I've pasted my history commands below.

  548  more /etc/fstab
  549  vgcreate VGforMythTV -s 64m /dev/hda1
  550  /usr/sbin/vgcreate VGforMythTV -s 64m /dev/hda1
  551*
  552  /usr/sbin/pvcreate /dev/hdb1
  553  /usr/sbin/pvcreate /dev/hdc1
  554  /usr/sbin/vgcreate VGforMythTV /dev/hdb1 /dev/hdc1
  555  mount /dev/VGforMythTV /var/media
  556  mount /dev/VGforMythTV/video /var/media
  557  mount /dev/VGforMythTV/media /var/media
  558  lvcreate --name video VGforMythTV
  559  /usr/sbin/lvcreate --name video VGforMythTV
  560  /usr/sbin/lvcreate --name video -l VGforMythTV
  561  /usr/sbin/lvcreate --name video -l ` VGforMythTV
  562  /usr/sbin/lvcreate --name video -l 1 VGforMythTV
  563  mount /dev/VGforMythTV/media /var/media
  564  mount /dev/VGforMythTV/video /var/media
  565  mount -t xfs /dev/VGforMythTV/video /var/media
  566  mount /dev/VGforMythTV/video /var/media
  567  /usr/sbin/lvcreate --name video -l 2 VGforMythTV
  568  ls
  569  /usr/sbin/pvdisplay
  570  /usr/sbin/lvmdiskscan
  571  mount /dev/VGforMythTV /var/media/
  572  mount /dev/VGforMythTV/video /var/media/
  573  mount /dev/VGforMythTV/media /var/media/
  574  mount /dev/VGforMythTV/video /var/media/
  575  /sbin/fdisk /dev/hdb
  576  /sbin/fdisk /dev/hdc
  577  /usr/sbin/vgextend
  578  more /etc/fstab
  579  /usr/sbin/vgextend VGforMythTV /dev/hdb1
  580  /usr/sbin/vgextend VGforMythTV /dev/hdb

------=_Part_19959_18881252.1151045655982
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Terribly sorry for the double post to the mailing list, accidentally hit the google shortcut.<br><br>I have been using LVM for several months to record video files for my PVR across a 200GB and 160GB disk (hdb and hdc).<br>
<br>Recently I decided to upgrade my FC3 install to FC5.&nbsp; After the install, my LVM mount does not come up.&nbsp; It appeared that all of the LVM information in /dev/ was gone; however, only the non-LVM drive (/dev/hda) should have been touched by the FC5 upgrade.
<br><br>This is my fstab entry:<br>/dev/VGforMythTV/video&nbsp; /var/media&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xfs&nbsp;&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 1<br><br>This is what fdisk shows:<br>/dev/hdb1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 24792&nbsp;&nbsp; 199141708+&nbsp; 8e&nbsp; Linux LVM<br><br>/dev/hdc1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19929&nbsp;&nbsp; 160079661&nbsp;&nbsp; 8e&nbsp; Linux LVM
<br><br>In my attempt to fix this, I think I may have totally fouled things up; I tried to create a new volume group with the same name and more PVs for the new drives, then combine them together into an PV with the old LV name.&nbsp; However, this still does not allow it to mount.&nbsp; 
<br><br>Any ideas?&nbsp; Have I deleted all my data?<br><br>Thanks for any help,<br><br>Argus<br><br>I've pasted my history commands below.<br><br>&nbsp; 548&nbsp; more /etc/fstab<br>&nbsp; 549&nbsp; vgcreate VGforMythTV -s 64m /dev/hda1<br>&nbsp; 550&nbsp; /usr/sbin/vgcreate VGforMythTV -s 64m /dev/hda1
<br>&nbsp; 551* <br>&nbsp; 552&nbsp; /usr/sbin/pvcreate /dev/hdb1<br>&nbsp; 553&nbsp; /usr/sbin/pvcreate /dev/hdc1<br>&nbsp; 554&nbsp; /usr/sbin/vgcreate VGforMythTV /dev/hdb1 /dev/hdc1<br>&nbsp; 555&nbsp; mount /dev/VGforMythTV /var/media<br>&nbsp; 556&nbsp; mount /dev/VGforMythTV/video /var/media
<br>&nbsp; 557&nbsp; mount /dev/VGforMythTV/media /var/media<br>&nbsp; 558&nbsp; lvcreate --name video VGforMythTV<br>&nbsp; 559&nbsp; /usr/sbin/lvcreate --name video VGforMythTV<br>&nbsp; 560&nbsp; /usr/sbin/lvcreate --name video -l VGforMythTV<br>&nbsp; 561&nbsp; /usr/sbin/lvcreate --name video -l ` VGforMythTV
<br>&nbsp; 562&nbsp; /usr/sbin/lvcreate --name video -l 1 VGforMythTV<br>&nbsp; 563&nbsp; mount /dev/VGforMythTV/media /var/media<br>&nbsp; 564&nbsp; mount /dev/VGforMythTV/video /var/media<br>&nbsp; 565&nbsp; mount -t xfs /dev/VGforMythTV/video /var/media<br>&nbsp; 566&nbsp; mount /dev/VGforMythTV/video /var/media
<br>&nbsp; 567&nbsp; /usr/sbin/lvcreate --name video -l 2 VGforMythTV<br>&nbsp; 568&nbsp; ls<br>&nbsp; 569&nbsp; /usr/sbin/pvdisplay <br>&nbsp; 570&nbsp; /usr/sbin/lvmdiskscan <br>&nbsp; 571&nbsp; mount /dev/VGforMythTV /var/media/<br>&nbsp; 572&nbsp; mount /dev/VGforMythTV/video /var/media/
<br>&nbsp; 573&nbsp; mount /dev/VGforMythTV/media /var/media/<br>&nbsp; 574&nbsp; mount /dev/VGforMythTV/video /var/media/<br>&nbsp; 575&nbsp; /sbin/fdisk /dev/hdb<br>&nbsp; 576&nbsp; /sbin/fdisk /dev/hdc<br>&nbsp; 577&nbsp; /usr/sbin/vgextend <br>&nbsp; 578&nbsp; more /etc/fstab<br>
&nbsp; 579&nbsp; /usr/sbin/vgextend VGforMythTV /dev/hdb1<br>&nbsp; 580&nbsp; /usr/sbin/vgextend VGforMythTV /dev/hdb<br><br>

------=_Part_19959_18881252.1151045655982--
