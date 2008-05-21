Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4LEt9WZ012140
	for <linux-lvm@redhat.com>; Wed, 21 May 2008 10:55:09 -0400
Received: from jugis.itk.ppke.hu (jugis.itk.ppke.hu [193.225.109.42])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4LEssaP010212
	for <linux-lvm@redhat.com>; Wed, 21 May 2008 10:54:54 -0400
Received: from jugis (jugis [127.0.0.1])
	by checked.jugis.itk.ppke.hu (Postfix) with ESMTP id BD80D210418
	for <linux-lvm@redhat.com>; Wed, 21 May 2008 16:54:53 +0200 (CEST)
Received: from rivendell (rivendell.itk.ppke.hu [193.225.109.193])
	by jugis.itk.ppke.hu (Postfix) with ESMTP id E8B141F1669
	for <linux-lvm@redhat.com>; Wed, 21 May 2008 16:54:39 +0200 (CEST)
Date: Wed, 21 May 2008 16:54:39 +0200
From: Csillag Tamas <cstamas@digitus.itk.ppke.hu>
Message-ID: <20080521145439.GH3610@digitus>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] recovering with missing PV -s
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Dear lvm list,

We have a DS4700 disk storage system which exports 9 LUNs to a given
machine each one is 1.5TB (because it has 2TB limit on each).
One VG is created from this 9 PV without striping and one LV is built
on it. The filesystem is reiserfs3.

Two days ago one eclosure has failed. 3 PVs out of 9 are missing. The
space usage was about 10%.
Is there a way to recover from this failure with LVM?

Thanks in advance.

Regards,
  cstamas
-- 
CSILLAG Tamas (cstamas) - http://digitus.itk.ppke.hu/~cstamas
Pazmany Peter Catholic University
The Faculty of Information Technology

When hitting yourself on the head with a hammer starts to give you                                  
headaches, the solution is not to put padding on the hammer.
