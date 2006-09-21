Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8LDSMQD032065
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 09:28:22 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.191])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8LDSGVI020856
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 09:28:16 -0400
Received: by nf-out-0910.google.com with SMTP id q29so834698nfc
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 06:28:16 -0700 (PDT)
Message-ID: <ab53550609210628v3fbaf1a0sb9f569faf8542389@mail.gmail.com>
Date: Thu, 21 Sep 2006 09:28:15 -0400
From: "Bernard Fay" <bernard.fay@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_727_21425049.1158845295838"
Subject: [linux-lvm] pvs and pvscan does not show my PV's
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
To: linux-lvm <linux-lvm@redhat.com>

------=_Part_727_21425049.1158845295838
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I have created 28 linux-lvm partitions on 7 disks ( 4 linux-lvm partitions
per disk).  pvs or pvscan shows no physical volume unless a PV is assigned
to a VG.  If a PV is assigned to a VG, pvs or pvscan will show this PV but
none of the unassigned PV's.  Also, if I do for example,  pvscan
/dev/sde[1234], pvscan will show the 4 PV's.

From another system, I know if I do pvscan it will show me all PV's,
assigned or unassigned.

Does someone can tell my why on my actual system pvs or pvscan does not list
the PV's?

Thanks
Bernard

------=_Part_727_21425049.1158845295838
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,<br><br>I have created 28 linux-lvm partitions on 7 disks ( 4
linux-lvm partitions per disk).&nbsp; pvs or pvscan shows no physical volume
unless a PV is assigned to a VG.&nbsp; If a PV is assigned to a VG, pvs or
pvscan will show this PV but none of the unassigned PV's.&nbsp; Also, if I
do for example,&nbsp; pvscan /dev/sde[1234], pvscan will show the 4 PV's.
<br><br>From another system, I know if I do pvscan it will show me all PV's, assigned or unassigned.<br><br>Does someone can tell my why on my actual system pvs or pvscan does not list the PV's?<br><br>Thanks<br><span>
Bernard<br><br></span>


------=_Part_727_21425049.1158845295838--
