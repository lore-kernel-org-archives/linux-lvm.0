Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9HFrM0k027321
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 11:53:22 -0400
Received: from victor.provo.novell.com (victor.provo.novell.com
	[137.65.250.26])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9HFrF3V010579
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 11:53:16 -0400
From: "Peter W. Morreale" <pmorreale@novell.com>
Date: Wed, 17 Oct 2007 09:50:22 -0600
Message-Id: <1192636222.4275.97.camel@hermosa.morrealenet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] new LVM2 feature?
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
To: linux-lvm@redhat.com


Hello all,

I'm wondering whether there is interest (or development :-) on a new
feature for LVM2. I did look through the wiki and it doesn't appear that
this idea is on the roadmap, save for the "Stacking LVs" listed on the
roadmap page.  However there is no discussion AFAIK about stacking.

The idea is COW LV stacking below a primary LV.  The intent is to allow
a number of 'users' the ability to share a common dataset, and
independently save their changes to to a 'private' LV.    

On to the requisite bad ascii drawing:

   lv-1      lv-2      lv-[n]
     \         |        /
      \        |       /
       \       |      /
         shared ro lv
        /      |      \
       /       |       \
      /        |        \
     /         |         \
  cow_lv-1  cow_lv-2    cow_lv3

So, any changed blocks sent to "lv-1" are routed to "cow_lv-1", and
changed blocks sent to "lv-2" are routed to "cow_lv-2", etc.  The
simple, but as yet to-be-determined algorithm for reads is: if the block
'exists' in the cow, return the cow version, else return the shared
version. 

Changes from independent paths are saved to independent volumes.   From
there I can decide to destroy the COW LV, or perhaps merge it with the
shared LV to create a new "shared LV" for creation of a new set.  

Is there any interest in such a feature?  

Has this already been considered and perhaps dropped? 

Is this consistent (and/or possible) with the architecture of LVM2?

What are the source changes I need to make?  That was humor.

Thanks,
-PWM
