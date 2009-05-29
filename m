Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4TKHun2026289
	for <linux-lvm@redhat.com>; Fri, 29 May 2009 16:17:56 -0400
Received: from Mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n4TKHg1g027232
	for <linux-lvm@redhat.com>; Fri, 29 May 2009 16:17:42 -0400
Received: from jfsnew.stoffel.org (97-95-180-151.dhcp.oxfr.ma.charter.com
	[97.95.180.151]) (authenticated bits=0)
	by Mycroft.westnet.com (8.14.0/8.14.0) with ESMTP id n4TKHeqg009337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 29 May 2009 16:17:41 -0400 (EDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <18976.17124.473500.978226@stoffel.org>
Date: Fri, 29 May 2009 16:17:40 -0400
From: "John Stoffel" <john@stoffel.org>
Subject: [linux-lvm] Mirroring disks: LVM->MD or LVM->lvconvert -m 1 better?
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Hi guys,

I'm setting up a new server, and it's going to be a remote box for me,
with only limited access.  To make it robust, I want to mirror the two
disks inside it.

I can either do the traditional LVM on top of MD, but I was thinking
that maybe using LVM's builtin 'lvconvert -m ...' stuff would be
simpler.

Ideally, I'd like to either disk to be able to fail, and the system to
still be able to bootup.  It's not completely critical, but hey, it's
also a good learning experience.

Thanks,
John
