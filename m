Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8KDFM7e011556
	for <linux-lvm@redhat.com>; Mon, 20 Sep 2010 09:15:22 -0400
Received: from CGYSNEX001.encana.com (cgysnex001.encana.com [142.56.87.68])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8KDFC26012423
	for <linux-lvm@redhat.com>; Mon, 20 Sep 2010 09:15:12 -0400
Received: from CGYEX203.encana.com (unverified) by CGYSNEX001.encana.com 
	(Clearswift SMTPRS 5.3.2) with ESMTP id 
	<T983a67d1858e385744374@CGYSNEX001.encana.com> for 
	<linux-lvm@redhat.com>; Mon, 20 Sep 2010 07:15:11 -0600
Received: from CGYEX710.encana.com (unverified) by CGYEX203.encana.com 
	(Clearswift SMTPRS 5.3.2) with ESMTP id 
	<T983a67cf0c8e38c9141650@CGYEX203.encana.com> for 
	<linux-lvm@redhat.com>; Mon, 20 Sep 2010 07:15:10 -0600
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 20 Sep 2010 07:15:10 -0600
Message-ID: <F57F2AD357626644AF76410876025D75529E4F@CGYEX705.encana.com>
In-Reply-To: <chaz20100920111622.GA3547@yahoo.fr>
References: <chaz20100920111622.GA3547@yahoo.fr>
From: "Kinzel, David" <David.Kinzel@encana.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] restoring snapshots
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
To: LVM general discussion and development <linux-lvm@redhat.com>

>Hiya,
>
>I was wondering about how to restore/apply a LVM snapshot to the
>original partition. Looking at the archive, I can see it's
>advised to dump the snapshot content into a file and then dump
>that onto the original device after having removed the snapshot.
>
>What's wrong with:
>
>lvcreate -n lv -L1G vg
>...
>mount /dev/vg/lv /x
>...
>lvcreate -s -n lv_snap /dev/vg/lv
>...
>mount /dev/vg/lv_snap /y
>
>Them to apply the snapshot:
>
>umount /x /y
>dd bs=4M < /dev/mapper/vg-lv_snap > /dev/mapper/vg-lv-real
>lvremote /dev/vg/lv_snap
>
>It's still not optimal as it writes the whole volume, but at
>least, I don't have to find a storage area big enough to hold an
>extra copy of the whole volume and it's faster.
>
>It seems to be working on a test on /dev/loop. Is there any
>circumstance (as long as there's only one snapshot of the
>volume) where it wouldn't work, or what would be the potential
>pitfalls (other than if there's a crash in the middle, you're
>screwed)?
>
>Is there any plan to add the feature to efficiently
>restore/apply/commit a snapshot (that is only dump the cow data
>onto the original volume without writing the whole volume) or
>does that feature exist already and I missed it?

The newer versions do have the lvmerge feature, and it seems to work in
RHEL6 beta from what I could see.

>
>Thanks,
>Stephane
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

This email communication and any files transmitted with it may contain confidential and or proprietary information and is provided for the use of the intended recipient only.  Any review, retransmission or dissemination of this information by anyone other than the intended recipient is prohibited.  If you receive this email in error, please contact the sender and delete this communication and any copies immediately.  Thank you.
http://www.encana.com
