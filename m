Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6B1VcMw024564
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 21:31:38 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6B1Vb2Y017436
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 21:31:37 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p6B1VRhQ009409
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 18:31:29 -0700
Message-ID: <4E1A526F.9090700@tlinx.org>
Date: Sun, 10 Jul 2011 18:31:27 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Inconsistent naming...?
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



I created a snapshot volume "with the name corresponding
the volume name-date-time:


ll /dev/Home+Space/
total 0
lrwxrwxrwx 1 8 Jul 10 18:16 Home-2011.07.07-00.00.00 -> ../dm-12
lrwxrwxrwx 1 7 Jul 10 18:16 Home-2011.07.10-09.42.07 -> ../dm-5

Ok and they look that way in 'lvs', but when I mount
them,  'df'' (or mount) shows:

/dev/mapper/Home+Space-Home--2011.07.07--00.00.00
                                                           
^^                ^^
                      897M  160K  897M   1% 
/home/snapdir/@GMT-2011.07.07-00.00.00
/dev/mapper/Home+Space-Home--2011.07.10--09.42.07
                      1.0T  468G  557G  46% 
/home/snapdir/@GMT-2011.07.10-09.42.07


Notice the device name.   notice how the single dashes are now displayed
as two dashes?!?!

What up with that?   Seems like a bug somewhere... -- though it doesn't
**seem** to affect how it work....but it is disturbing...I thought my
volume names had mutated somehow...
