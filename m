Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3KHBFGa027598
	for <linux-lvm@redhat.com>; Fri, 20 Apr 2007 13:11:15 -0400
Received: from nexredback-216-168-119-94.nexicom.net (mail.fibrespeed.net
	[216.168.105.35] (may be forged))
	by mx2.redhat.com (8.13.1/8.13.1) with SMTP id l3KHBDES021432
	for <linux-lvm@redhat.com>; Fri, 20 Apr 2007 13:11:13 -0400
Message-ID: <4628F42D.3040900@mikebabcock.ca>
Date: Fri, 20 Apr 2007 13:11:09 -0400
From: "Michael T. Babcock" <mike@mikebabcock.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to resize a PV located on a SAN LUN
References: <20070420114742.GA6661@mail.mhnet.de>
In-Reply-To: <20070420114742.GA6661@mail.mhnet.de>
Content-Type: multipart/alternative;
	boundary="------------030705000704060209090200"
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

This is a multi-part message in MIME format.
--------------030705000704060209090200
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Micha Holzmann wrote:
> Now i had to increase the size of partition of sda12 which is a LVM.
> I am not sure which is the right way. Within the storage managment
> software i can increase the size of the LUN. After rebooting the machine
> the additional space is appended at the end of partitions and it is
> marked as free. How can i now increase the LVM partition. Which
> tool/programm i do need for this task?
>   

The easy way would be to create a new partition to use that free space, 
then use pvcreate to make it a physical volume and then add it to the 
volume group.  This would mean you'd have two physical volumes on the 
device belonging to the same volume group.
-- 
Michael T. Babcock
http://mikebabcock.ca


--------------030705000704060209090200
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=UTF-8" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Micha Holzmann wrote:
<blockquote cite="mid20070420114742.GA6661@mail.mhnet.de" type="cite">
  <pre wrap="">Now i had to increase the size of partition of sda12 which is a LVM.
I am not sure which is the right way. Within the storage managment
software i can increase the size of the LUN. After rebooting the machine
the additional space is appended at the end of partitions and it is
marked as free. How can i now increase the LVM partition. Which
tool/programm i do need for this task?
  </pre>
</blockquote>
<br>
The easy way would be to create a new partition to use that free space,
then use pvcreate to make it a physical volume and then add it to the
volume group.  This would mean you'd have two physical volumes on the
device belonging to the same volume group.<br>
<div class="moz-signature">-- <br>
<!--
Michael T. Babcock
http://mikebabcock.ca

Ignore the stuff below
-->
<address>Michael T. Babcock<br>
<a href="http://mikebabcock.ca">http://mikebabcock.ca</a>
</address>
</div>
</body>
</html>

--------------030705000704060209090200--
