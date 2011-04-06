Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p36LX1DG022455
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 17:33:01 -0400
Received: from mail.ynet.co.nz (mail.ynet.co.nz [210.48.92.21])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p36LWu1A017860
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 17:32:57 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.ynet.co.nz (Postfix) with ESMTP id E87D4272158
	for <linux-lvm@redhat.com>; Thu,  7 Apr 2011 09:32:55 +1200 (NZST)
Received: from mail.ynet.co.nz ([127.0.0.1])
	by localhost (mail.ynet.co.nz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZchiaxAOSTW6 for <linux-lvm@redhat.com>;
	Thu,  7 Apr 2011 09:32:52 +1200 (NZST)
Received: from [10.10.10.10] (unknown [210.48.92.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: omiha@ynet.co.nz)
	by mail.ynet.co.nz (Postfix) with ESMTPSA id 1D109272104
	for <linux-lvm@redhat.com>; Thu,  7 Apr 2011 09:32:52 +1200 (NZST)
Message-ID: <4D9CDC03.9020507@omiha.com>
Date: Thu, 07 Apr 2011 09:32:51 +1200
From: Jan Bakuwel <jan.bakuwel@omiha.com>
MIME-Version: 1.0
References: <4D9A9E2A.7070106@diala.gl3> <1302079983.27047.454.camel@localhost>
In-Reply-To: <1302079983.27047.454.camel@localhost>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM corruption/diagnosis
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi Radu, all,

> I hope this helps you debug the issue you had. It would also be
> interesting if you could try to zero the *original* LVM volume (the one
> that didn't work) and then restore the image once again and see if it
> works. It would prove (or disprove) my theory :)

Even though I still consider your theory (of zeroing the blocks before
restoring the image) the most plausible, something else showed up when I
looked at zeroing the partition (I have to wait restoring the image as
this is a production system).

The old LV apparently is still online/active and I cannot deactivate
it/take it offline even though I'm sure it is not in use. This is
something (with LVM2) I've seen before: LVs are marked to be in use (and
cannot be taken offline) even though none of the running VMs is using
the LV.

# lvchange -a n /dev/d/xm.wxp
LV d/xm.wxp in use: not deactivating

If something else is using the LV as well as the VM, it would be logical
that the VM experiences corruptions (even if it's running code from
Redmond :-P ).

I've tried using kpartx in the past (as suggested in some places) but
without much success. In the following list, d-xm.wxp is the old LV
(that no longer works [pre zeroing the blocks]), d-xm.wxp2 is the new LV
(that is currently in use) and I don't know what d-xm.wxp1 is...
possible the first partition d-xm.wxp that keeps it online?

brw-rw----  1 root disk 254, 22 2011-03-30 04:58 d-xm.wxp
brw-rw----  1 root disk 254, 24 2011-03-28 09:18 d-xm.wxp1
brw-rw----  1 root disk 254, 25 2011-04-01 05:56 d-xm.wxp2
# kpartx -d /dev/d/d-xm.wxp
failed to stat() /dev/d/d-xm.wxp
# kpartx -d /dev/d/d-xm.wxp1
failed to stat() /dev/d/d-xm.wxp1

I wouldn't know though what else could be using the LV and I am not
aware of any methods to find out... any suggestions?

best regards,
Jan
