Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4S7NG031008
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 03:23:16 -0400
Received: from angle.badbox.com (bgp543256bgs.ewndsr01.nj.comcast.net
	[68.38.148.149])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4S7NFi5005482
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 03:23:16 -0400
Received: from angle.badbox.com (localhost [127.0.0.1])
	by angle.badbox.com (8.12.10/8.12.5) with ESMTP id i4S7NAbr001623
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 03:23:10 -0400
Received: (from alexy@localhost)
	by angle.badbox.com (8.12.10/8.12.10/Submit) id i4S7NA0m001616
	for linux-lvm@redhat.com; Fri, 28 May 2004 03:23:10 -0400
Date: Fri, 28 May 2004 03:23:09 -0400
From: Alexy Khrabrov <alexy.khrabrov@setup.org>
Message-ID: <20040528072309.GA1504%alexy.khrabrov@setup.org>
References: <20040528062808.GA604%alexy.khrabrov@setup.org>
	<20040528064225.GB24446@backtop.namesys.com>
	<20040528070645.GA1309%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040528070645.GA1309%alexy.khrabrov@setup.org>
Subject: [linux-lvm] Re: dd/rebuild of a small used part of a huge reiserfs
	on lvm?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM List <linux-lvm@redhat.com>


Just to add, the file name in lost+found was 2572_2574.  There were
two large jpegs, about 4 MB each, and the recovered was one of them.
They were written one after another.  Can I do something based on the file
name, if it represents some block numbers range or something analogous?
Also, I know the names of the two original jpeg files.  Can that help?

-- 
Cheers,
Alexy Khrabrov :: www.setup.org :: Age Quod Agis
