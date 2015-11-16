Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAGFv3wG024051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2015 10:57:03 -0500
Received: from mailrelay.lanline.com (mailrelay.lanline.com [216.187.10.16])
	by mx1.redhat.com (Postfix) with ESMTPS id B682AC0DCCE6
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2015 15:57:01 +0000 (UTC)
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay.lanline.com (8.14.5/8.14.5) with ESMTP id tAGFmY8o022818
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2015 10:48:34 -0500 (EST)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id tAGFg5l0016307
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2015 10:42:06 -0500 (EST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22089.64209.262142.237949@quad.stoffel.home>
Date: Mon, 16 Nov 2015 10:48:33 -0500
From: "John Stoffel" <john@stoffel.org>
References: <561EB8A1.10806@windriver.com>
	<90c8e9f78fb27d380b22d2afdd6225be@alukardd.org>
	<561F70D7.7040302@gmail.com>
Subject: [linux-lvm] lvmcache - performance and real life usage?
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


Hi all,

I've finally upgraded my main server which hosts my home directories
and other files on a bunch of 1Tb and 2Tb disks, all mirrored (triple
mirrors in general since I'm paranoid).

So they're starting to die and give me problems, and it's time to
replace them.  I'm thinking of getting a pair of 500Gb SSDs for
boot/lvmcache and a pair of 4Tb WD Blacks for the backend storage.

I've got some KVM running, NFS home directories, LDAP, samba, etc.
I'm willing to dedicate 256Gb of SSD for cache, but before I do this,
I'm curious to know if anyone else is doing this, and how the
performance is in their setup?

I'm running upto date Debbian Jessie on an AMD Phenom(tm) II X4 945
Processor with 16Gb of RAM and a bunch of internal disks on an LSI 8
port controller.  Been very nice, but my mix of SATA I, II and III
disks are showing their age.

Thanks for the comments,
John
