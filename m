Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l17F9Yab006577
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 10:09:36 -0500
Received: from ati.es (mail.ati.es [212.170.227.221])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l17F9TiU012582
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 10:09:32 -0500
Message-Id: <200702071509.l17F9TiU012582@mx2.redhat.com>
From: "Cesar O. Pablo" <cesar@ati.es>
Date: Wed, 07 Feb 2007 16:09:09 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Doubts about LVM2 real limits
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi,


 We have plans to build a 30TB aprox. data storage using a set of SAN boxes configured as 
RAID 5, our understanding is that using LVM2 with Red Hat 4 and our 64 bit AMD opteron 
processors shall allow us to do that. Our concern is to know in advance if our approach is 
wrong or even better if somebody else has been successfully taking the same road before.

 Documentation tells us that the limit is in the order of the 8 Exabytes (8TB for IA-32) 
but this is not enough as this is a go / no go decision.

  Thanks for any help or pointer to a similar rig.

 Cesar O. Pablo
 




Cesar
