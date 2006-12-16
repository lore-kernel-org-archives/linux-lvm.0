Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBG1mOXl025822
	for <linux-lvm@redhat.com>; Fri, 15 Dec 2006 20:48:25 -0500
Received: from mail.cnr.colostate.edu (clavin.cnr.colostate.edu
	[129.82.112.67])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBG1mOo2011655
	for <linux-lvm@redhat.com>; Fri, 15 Dec 2006 20:48:24 -0500
Received: from nrelsmtp.nrel.colostate.edu (newman [129.82.112.30])
	by mail.cnr.colostate.edu (8.13.7/8.13.7) with ESMTP id kBG1mHv8013767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 15 Dec 2006 18:48:17 -0700
Received: from [129.82.104.126] (donbot [129.82.104.126])
	by nrelsmtp.nrel.colostate.edu (8.13.7/8.13.7) with ESMTP id
	kBG1mF3D013762
	for <linux-lvm@redhat.com>; Fri, 15 Dec 2006 18:48:16 -0700
Message-ID: <4583505F.1050605@nrel.colostate.edu>
Date: Fri, 15 Dec 2006 18:48:15 -0700
From: "Ty! Boyack" <ty@nrel.colostate.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Control of which devices are used for striping (or
	mirroring)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Folks,

Is there anyway to control which devices a logical volume gets striped 
across?

The reason for the question is that we have a situation with multiple 
raid arrays that can be expanded. but present new luns when they are 
expanded.  The first array is partially populated and gives us LUN 0.  
The second array is also partially populated and also gives us LUN 0.  
We put both of those luns (as PVs) in a volume group, and then build our 
LVs striped across both LUNS for performance. 

When we add equal disks to both arrays, we get a new LUN 1 on each 
array.  I would expect to add these new volums into the save VG.  If I 
make a new LV saying --stripe 2, I don't want it to end up striping 
across LUN 0 and LUN 1 on the same array, since that will only hurt 
performance.

Naturally, the same issue occurs with mirroring.  If I mirror on LUN0 
and LUN1 of the same array, and that array goes bad, then the mirror 
isn't doing a whole lot of good ;-)

Even better than controlling which devices get mapped at lvcreate time, 
I'd love it if there was a way to create a "grouping" of PVs that LVM 
knew were really the same device, and therefore provide no benefit to 
striping or mirroring.  Any way to do that?

I'm certainly open to suggestions about striping or mirroring outside of 
LVM, but this will be used in a clustered environment, so I'd like to 
keep as much as possible in (C)LVM or find cluster-safe tools to work 
with outside of LVM.

Thanks,

-Ty!

-- 
-===========================-
  Ty! Boyack
  NREL Unix Network Manager
  ty@nrel.colostate.edu
  (970) 491-1186
-===========================-
