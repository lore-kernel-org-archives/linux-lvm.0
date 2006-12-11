Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBBBaHum006746
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 06:36:17 -0500
Received: from osl1smout1.broadpark.no (osl1smout1.broadpark.no [80.202.4.58])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBBBaFe2026495
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 06:36:16 -0500
Received: from osl1sminn1.broadpark.no ([80.202.4.59])
	by osl1smout1.broadpark.no
	(Sun Java System Messaging Server 6.1 HotFix 0.05 (built Oct 21 2004))
	with ESMTP id <0JA300H0SXK5JFB0@osl1smout1.broadpark.no> for
	linux-lvm@redhat.com; Mon, 11 Dec 2006 12:36:05 +0100 (CET)
Received: from [192.168.2.149] ([80.203.244.19]) by osl1sminn1.broadpark.no
	(Sun Java System Messaging Server 6.1 HotFix 0.05 (built Oct 21 2004))
	with ESMTP id <0JA300DCCXK5CGYK@osl1sminn1.broadpark.no> for
	linux-lvm@redhat.com; Mon, 11 Dec 2006 12:36:05 +0100 (CET)
Date: Mon, 11 Dec 2006 12:35:49 +0100
From: Morten Torstensen <morten@mortent.org>
Subject: Re: [linux-lvm] LVM2 and OCFS2
In-reply-to: <457D2F40.7060708@redhat.com>
Message-id: <457D4295.9060601@mortent.org>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <c5530b840612090619v2f807944h361a5dc163cb69c4@mail.gmail.com>
	<457D2F40.7060708@redhat.com>
Reply-To: morten@mortent.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Patrick Caulfield wrote:
> To get clustered LVM you need to use clvm (RPM package lvm2-cluster) which synchronises LVM metadata updates across the cluster.
> This only works with Red Hat cluster suite though - you would need you write your own cluster management plugin for OCFS2 if you
> wanted to use that (hard, but not impossible). Of course, RHCS does offer GFS as the cluster filesystem, if that's what you really need!

Another option is GPFS from IBM, free as in beer. It really is a state 
of the art cluster filesystem and well worth the effort to look into if 
you are in the market for a cluster FS.

-- 

//Morten Torstensen
//Email: morten@mortent.org
//IM: Cartoon@jabber.no morten.torstensen@gmail.com

And if it turns out that there is a God, I don't believe that he is evil.
The worst that can be said is that he's an underachiever.
