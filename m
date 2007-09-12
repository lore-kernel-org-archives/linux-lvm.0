Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8CKeLHH028190
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 16:40:21 -0400
From: Turbo Fredriksson <turbo@bayour.com>
Date: Wed, 12 Sep 2007 21:40:03 +0200
Message-ID: <87ejh3n04s.fsf@pumba.bayour.com>
MIME-Version: 1.0
Sender: Turbo Fredriksson <turbo@pumba.redhat.com>
Subject: [linux-lvm] Rename physical volume
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
To: linux-lvm@sistina.com

I made a little mistake a few months ago
when I added a disk to my VG:

----- s n i p -----
celia:~# pvdisplay | egrep 'PV Name|Allocatable'
  PV Name               /dev/md0
  Allocatable           yes (but full)
  PV Name               /dev/hdc
  Allocatable           yes (but full)
  PV Name               /dev/sdd1
  Allocatable           yes (but full)
  PV Name               /dev/md2
  Allocatable           yes (but full)
  PV Name               /dev/md3
  Allocatable           yes
----- s n i p -----

What id like to do is move all data from sdd1
(372Gb) to the new md3 (just added - empty 465Gb)
and then remove sdd1 and create it as md1 and
move the data back.

But I'm afraid of holes in the FS (XFS)...

Also, hdc is just a 80Gb disk which I forgot
to remove when I added sdd1 (I had a 80Gb disk
laying around and not enough money) so I'd
like to remove it completely (move the physical
data to some other PV - md3 because of free
space on that).


Any advice in which procedure I should use
to accomplish this?
-- 
arrangements Uzi SDI Waco, Texas Saddam Hussein Noriega KGB security
tritium colonel FSF NORAD FBI Qaddafi domestic disruption
[See http://www.echelonwatch.org/ for more about this]
http://www.theregister.co.uk/2001/09/06/eu_releases_echelon_spying_report/
http://www.aclu.org/safefree/nsaspying/23989res20060131.html#echelon
