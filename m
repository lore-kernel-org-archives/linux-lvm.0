Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9KCKSV19943
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 08:20:28 -0400
Received: from eproxy.vsaa.lv (eproxy.vsaa.lv [81.198.191.140])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9KCKQ9V019864
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 08:20:26 -0400
Message-ID: <43578B7E.7060805@hq.vsaa.lv>
Date: Thu, 20 Oct 2005 15:20:14 +0300
From: Rich <rich@hq.vsaa.lv>
MIME-Version: 1.0
Subject: Re: [linux-lvm] xfs_freeze & lvm2
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@redhat.com

i'm sorry for breaking the thread, but i am reading responses through 
web archive ;)

..

 >> as i understand it, consistent copy is created when lvcreate is
 >> issued, not when snapshot volume is mounted - is this right ?

 > As i understood things, no. Mounttime matters ;-) see
 > <http://www.tldp.org/HOWTO/LVM-HOWTO/snapshotintro.html> and as 
example <http://www.tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html>.

well, supposedly there is no way to see wether changes are propogated to 
snapshot between lvcreate and mount because you must mount it to see 
(reminds about cats & boxes) ;)

but there are two things that lead me to believe it is lvcreate that 
matters :

1. "You should remove snapshot volume when you have finished with them 
because they take a copy of all data written to the original volume and 
this can hurt performance."

note, it says "remove", not unmount. additionally, you can easily mount 
and unmount snapshot several times - it would be pretty hard to have a 
consistent copy in such a case;

2. i did some testing before : created a snapshot (but did not mount 
it), made some modifications to original data and checked wether used 
space would increase for snapshot volume (with lvdisplay). well, it did 
  - so i assumed snapshot is created, well, when it is created :)

..

 >> if it actually is done together with snapshot, does this mean that i
 >> really can forget about xfs_freeze and just create snapshots ?

well, what about this part ?
from what i have read here and also in other places, xfs filesystem 
should be consistent, but i would like to be sure (though i might try to 
test this by simulating activity during lvcreate, i would prefer not to)

 >> must i specify ro in mount options or is this optional ?
 > Well, if i'm wrong ( and to be honest, i didn't play around with all
 > the stuff for 1 1/2 years now :-( ) somebody might correct me, but if
 > i remember postings from linux-xfs mailing list, rw-snapshots with XFS
 > is not quite unstable ...

well, as i don't need r/w anyway, i'll stick with ro, just to be sure 
then :)

 > Cheers
 > Klaus
-- 
  Rich
