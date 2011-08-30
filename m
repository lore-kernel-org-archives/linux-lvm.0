Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7UBWHbj002331
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 07:32:17 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7UBWDrM016965
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 07:32:13 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.sc.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p7UBW2wL027001
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 04:32:04 -0700
Message-ID: <4E5CCA32.4000000@tlinx.org>
Date: Tue, 30 Aug 2011 04:32:02 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Proper way to delete an active snapshot?
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




If you have a snapshot of a volume running... how are you supposed to delete
it?

i.e. after you unmount it... if I just do a lvremove, I get a warning 
about it being
an active volume -- so I tried doing a dmsetup remove on it first -- and 
that
stops the warning -- but I just noticed, I had a bunch of inactive 'cow'
volume names under 'dmsetup ls', that referred to the old snapshot names.

so I'm guessing that using dmsetup to remove the dev first, then lvremove is
NOT the best way to be doing this...(as it results in stuff that needs 
to be cleaned
up...)... 

So how do I remove the volume w/o getting warnings about it being 'active'?

(Unless, of course it is still mounted or something lame like that -- I 
mean I want
a warning to actually mean something...otherwise I start ignoring them, 
which is bad
(at least for me..)).
