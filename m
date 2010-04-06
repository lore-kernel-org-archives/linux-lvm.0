Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o36Mn0lT012867
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2010 18:49:00 -0400
Received: from Ishtar.sc.tlinx.org
	(173-164-175-65-SFBA.hfc.comcastbusiness.net [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o36MmgrG002332
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2010 18:48:42 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o36MmdkC000383
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2010 15:48:42 -0700
Message-ID: <4BBBBA47.5040006@tlinx.org>
Date: Tue, 06 Apr 2010 15:48:39 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Error
	message:lib64/libdevmapper-event-lvm2snapshot.so.2.02:
	undefined symbol: lvm2_run
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
To: LVM general discussion and development <linux-lvm@redhat.com>


I am trying to run a 2.6.33.1 kernel with a Suse11.2 runtime, which
I think uses a 2.6.31.12 kernel.

Has some user-space library changed that I need to rebuild so I can use
the newer kernel, or ---
	WHAT the heck is going on?! :-)

Entire error message (and related messages) from logs:

 Home-2010.04.05--18.00.01: event registration failed: 22892:9 libdevmapper-event-lvm2snapshot.so.2.02 dlopen failed: /lib64/libdevmapper-event-lvm2snapshot.so.2.02: undefined symbol: lvm2_run
  Home/snapshot0: snapshot segment monitoring function failed.

Thanks for any pointers in telling me how to go about fixing this
new snafu! 

Sigh...
Suse 11.2 has been such a pain to upgrade to!

-linda
