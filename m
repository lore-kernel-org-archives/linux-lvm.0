Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i22AVF804058
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 05:31:15 -0500
Received: from pegasus.siol.net (pegasus.siol.net [193.189.160.25])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i22AVEb09286
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 05:31:14 -0500
Received: from kudu.siol.net ([10.10.10.22]) by pegasus.siol.net
          (InterMail vK.4.03.05.03 201-232-132-103 license 1cbf71897a39210db31154c99f0b4628)
          with ESMTP id <20040302103113.GRWH15612.pegasus@kudu.siol.net>
          for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 11:31:13 +0100
Received: from vector ([193.77.156.30]) by kudu.siol.net
          (InterMail vK.4.03.05.03 201-232-132-103 license 1cbf71897a39210db31154c99f0b4628)
          with SMTP id <20040302103113.GAHD1595.kudu@vector>
          for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 11:31:13 +0100
Message-ID: <001301c40041$7fdeab30$0400a8c0@vector>
From: "Perplexer" <perplexer@thz.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] What if a drive dies ?
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  2 05:29:07 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello.

I'm sorry if I ask something that's be asked a million times before but I
prefer answers to my specific questions. I hope someone will try to help.

I have a VG with several differently sized PVs and one LV. It is working
fine but I am affraid that one day one of the drives would fail. I'd like to
know what I'll be looking at when that happens. What if one drive would
fail in that VG ? Can I remove it and 'repair' the VG/LV to run on with
one drive less (data is written in striped mode). That would mean I got
my VG/LV back on-line but the data that was on the bad disk would be
missing (a small price to pay actually). Would I need to resize the filesystem
again with some tool or anything special ?

Thanks for the answer(s).

---------
Perplexer
