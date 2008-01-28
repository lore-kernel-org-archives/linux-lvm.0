Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0SLqr35002090
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 16:52:53 -0500
Received: from pd3mo3so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0SLqMd8030630
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 16:52:23 -0500
Received: from pd2mr4so.prod.shaw.ca
	(pd2mr4so-qfe3.prod.shaw.ca [10.0.141.107]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0JVD00LE9JFAFG00@l-daemon> for linux-lvm@redhat.com; Mon,
	28 Jan 2008 14:52:22 -0700 (MST)
Received: from pn2ml4so.prod.shaw.ca ([10.0.121.148])
	by pd2mr4so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JVD00IUPJFAJE60@pd2mr4so.prod.shaw.ca> for
	linux-lvm@redhat.com; Mon, 28 Jan 2008 14:52:22 -0700 (MST)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JVD00F95JF9X750@l-daemon> for linux-lvm@redhat.com; Mon,
	28 Jan 2008 14:52:21 -0700 (MST)
Date: Mon, 28 Jan 2008 14:52:20 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Subject: RE: [linux-lvm] LVM limits?
In-reply-to: <200801281801.m0SI10Xi010185@beta.mvs.co.il>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C9385030AC683C@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
References: <479DAD35.1080209@cesca.es> <479E2BEF.1090703@cesca.es>
	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>
	<200801281801.m0SI10Xi010185@beta.mvs.co.il>
Content-Transfer-Encoding: 8bit
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
To: "'ehud@unix.mvs.co.il'" <ehud@unix.mvs.co.il>, 'LVM general discussion and development' <linux-lvm@redhat.com>

>It took less then 90 minutes.
>
>Ehud.

90 Minutes, how "enterprisable" is that? Just cause you can, doesn't mean you should: What if that server tanked during working hours at the corp? You would have to sit and wait for it to come back up. Worse than that are the rebuild times for degraded arrays. Try to rebuild a **huge** array on **huge** discs during production with lots of IO and hope you don't lose another disc. There are practical alternatives with thoughtful management to circumvent the need for and 8EB or larger array, but YMMV :)

jlc
