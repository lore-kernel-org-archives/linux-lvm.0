Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8JCjEV09010
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 08:45:14 -0400
Received: from www.geoinf.fu-berlin.de (www.geoinf.fu-berlin.de [160.45.89.23])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8JCjDZM020236
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 08:45:13 -0400
Received: from [160.45.89.15] (callisto.geoinf.fu-berlin.de [160.45.89.15])
	by www.geoinf.fu-berlin.de (Postfix) with ESMTP id 71785A1E03
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 14:44:48 +0200 (CEST)
Message-ID: <432EB2AF.9050500@alice-it.net>
Date: Mon, 19 Sep 2005 14:44:31 +0200
From: Sebastian <sebastian@alice-it.net>
MIME-Version: 1.0
Subject: [Fwd: [linux-lvm] EMERGENCY: killing pvmove]
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

And, more important, what is worse: to put the sane data on an insane pv 
using pvmove, or
to kill the pvmove command leaving a few unreadable sectors?

I'm prefering version #2 at the moment, I will apply it shortly before 
the new pv will be used.

-------- Original Message --------


After that -- everything went ok, even resizing the ext3 partition -- I
got Input/Output errors while writing to the newly resized partition
(writing to the extended part of the partition). As realising this, I
put all the data off this partition, deleted it and was then trying to
remove the Raid subsystem with pvmove. While doing "pvmove /dev/sdg" I
just got an "segmentation fault".

How to stop it? Is a SIGTERM or SIGKILL allowed? Pleas help, I'm running
out of time!
