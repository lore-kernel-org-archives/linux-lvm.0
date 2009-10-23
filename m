Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NEDa97006306
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 10:13:36 -0400
Received: from mailstore03.fastname.no (mailstore03.fastname.no [85.19.150.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NEDOrj018873
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 10:13:25 -0400
Received: from [84.49.98.38] (helo=[192.168.3.20])
	by mailstore03.fastname.no with esmtpa (Exim 4.69)
	(envelope-from <morten@mortent.org>) id 1N1Kt8-0007xR-V3
	for linux-lvm@redhat.com; Fri, 23 Oct 2009 16:13:06 +0200
Message-ID: <4AE1B9FB.504@mortent.org>
Date: Fri, 23 Oct 2009 16:13:15 +0200
From: Morten Torstensen <morten@mortent.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mirrored LVs
Reply-To: morten@mortent.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Why cannot the mirrorlog be stored persistently in one or more LEs in 
the LV? Why the need for a seperate PV for this?

Since most servers I work with have two disks for the system, this force 
me to use md for mirroring, adding unneeded complexity for a simple mirror.

-- 

//Morten Torstensen
//Email: morten@mortent.org
//IM: morten.torstensen@gmail.com

I can't listen to that much Wagner. I start getting the urge to conquer 
Poland.
	-- Woody Allen
