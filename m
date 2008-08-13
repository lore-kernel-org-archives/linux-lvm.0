Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7DG69ew016281
	for <linux-lvm@redhat.com>; Wed, 13 Aug 2008 12:06:09 -0400
Received: from italy.iontrading.com (italy.iontrading.com [84.233.155.161])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7DG5r8V026785
	for <linux-lvm@redhat.com>; Wed, 13 Aug 2008 12:05:53 -0400
Received: from eva11 (eva11.ionpisa.it [192.168.150.57])
	by italy.iontrading.com (Postfix) with ESMTP id 1C2A16C1EC
	for <linux-lvm@redhat.com>; Wed, 13 Aug 2008 18:05:47 +0200 (CEST)
From: "Andrea Ghelardi" <a.ghelardi@iontrading.com>
References: <54AA5D29CDD96948959171E0DF2990295352@EMC1.uvic.ca>
Subject: RE: [linux-lvm] LVM with large arrays,
	one large or mutiple small PV's?
Date: Wed, 13 Aug 2008 18:05:52 +0200
Message-ID: <60C9D6EAB551452DB8F4A5074E0C25C9@eva11>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <54AA5D29CDD96948959171E0DF2990295352@EMC1.uvic.ca>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi all,

Could I "push" this request?

I'm in a very similar situation, and I googled for two entire days but it
seems that there is no "advanced" documentation on this topic.

Also, do we have some ideas about the overhead introduced by having more
smaller PVs instead of a few bigger ones?

Thanks!


Andrea Ghelardi

Via San Martino, 52, 56125 Pisa, ITALY
T: +39 050 220 371   
a.ghelardi@iontrading.com
http://www.iontrading.com
 
 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of David S. Broome
Sent: Tuesday, August 12, 2008 5:53 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] LVM with large arrays, one large or mutiple small PV's?

Hello - This is a best practices style question.

LVM with large arrays, one large or mutiple small PV's?

What is the suggested physical partition layout with large hardware RAID
arrays (is NAS or SAN) in the case where there can be one VG?

ie I have two Raid 5 Arrays that can either present one large logical volume
ie 3.5T and 2.9T each or a multiple smaller logical volumes ie 500G.

Would it be better have the hardware present add multiple smaller logical
volumes to as PV's or the single larger volumes?

If there is a need for multiple VG's then obviously there needs to be
multiple PVs.

The smaller volumes would have the advantage of being able to pvmoved to
other hardware in the future with more flexibility due to the size of PV's.

There would be some overhead space lost due to the multiple PV's, although
this would be small.

Thanks in advance for any comments.

Dave,
--
David Broome  Sr. Programmer Analyst @ FineArts.UVic.CA /BSc
250.721-6307 | dbroome@uvic.ca | FIA 221



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
