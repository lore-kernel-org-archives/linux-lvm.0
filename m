Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5DHHcss022609
	for <linux-lvm@redhat.com>; Fri, 13 Jun 2008 13:17:38 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.155])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5DHHQOJ031918
	for <linux-lvm@redhat.com>; Fri, 13 Jun 2008 13:17:26 -0400
Received: by fg-out-1718.google.com with SMTP id e21so3270087fga.7
	for <linux-lvm@redhat.com>; Fri, 13 Jun 2008 10:17:25 -0700 (PDT)
Message-ID: <1c748a490806131017i5958c950n47d0fdc2f3b080c7@mail.gmail.com>
Date: Fri, 13 Jun 2008 10:17:25 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_8844_16957353.1213377445518"
Subject: [linux-lvm] reconstituting a logical volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Scott Smyth <scotts@cuttedge.com>

------=_Part_8844_16957353.1213377445518
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

In the thread "lvm partition on ramdisk," circa May 19, you helped me get a
FAT32 instance running on a lv that was a combination of a ramdisk (actually
3 of them) and an 8TB RAID array. Can someone tell me if the following is
trivial, or possible, under LVM:

unmount the fs
dd the ramdisk[s] to equal sized volume[s] "rdcopy" on the array
break the composite ramdisk+8TB lv
create a rdcopy+8TB lv with the fs and its data undamaged and ready to mount

TIA,

Larry Dickson
Cutting Edge Networked Storage

------=_Part_8844_16957353.1213377445518
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hi all, </div>
<div>&nbsp;</div>
<div>In the thread &quot;lvm partition on ramdisk,&quot; circa May 19, you helped me get a FAT32 instance running on a lv that was a combination of a ramdisk (actually 3 of them) and an 8TB RAID array. Can someone tell me if the following is trivial, or possible, under LVM:</div>

<div>&nbsp;</div>
<div>unmount the fs</div>
<div>dd&nbsp;the ramdisk[s] to equal sized volume[s] &quot;rdcopy&quot; on the array</div>
<div>break the composite ramdisk+8TB lv</div>
<div>create a rdcopy+8TB lv with the fs and its&nbsp;data&nbsp;undamaged and ready to mount</div>
<div>&nbsp;</div>
<div>TIA,</div>
<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage</div>

------=_Part_8844_16957353.1213377445518--
