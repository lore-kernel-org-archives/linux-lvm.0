Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8C0j387012949
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 20:45:03 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8C0ixkI006807
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 20:44:59 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.sc.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p8C0imbF020432
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 17:44:50 -0700
Message-ID: <4E6D5600.4060008@tlinx.org>
Date: Sun, 11 Sep 2011 17:44:48 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] more vg problems or oddities...not using dmsetup remove
	seems to be bad?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



tried to remove an unmounted active snapshot.

lvremove said it wouldn't remove an active snapshot.

Tried -an -- can't change active snapshot.


Tried turning off monitoring --monitor -n
It gave no message
tried removing again...can't remove active snap

tried --ignoremonitoring

no message but still can't remove

tried -- merging it...

Said it couldn't merge with open origin,
then merging with origin on next activation...

Now still can't remove, but says "
  Can't remove merging snapshot logical volume "Home-2011.09.03-00.28.36"
...

decided to try dmsetup remove --

it couldn't remove it either -- resource/device busy...

So now I'm concerned...is it going to try to merge back any changes it 
recorded by reversing them?

i.e. put the original volume back the way it was when the snapshot started?

Says it couldn't do it on open volume -- does that mean it won't start 
this until I reboot,
then it will take a long time to become active?

seems like the dmsetup remove of the parts was the safest way to
kill off an active snapshot...but this feels contorted.

I'm wondering if I really want this 'merge' it wants to do...and if not, 
how do I abort
it?

Thanks!

(hoping system stays up until I get this sorted out!)...
