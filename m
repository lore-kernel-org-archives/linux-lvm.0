Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k11Gcu120599
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 11:38:56 -0500
Received: from smtpout04-04.prod.mesa1.secureserver.net
	(smtpout04-04.prod.mesa1.secureserver.net [64.202.165.199])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k11Gcl2f017039
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 11:38:47 -0500
Message-ID: <43E0E3E3.3030407@starnetworks.us>
Date: Wed, 01 Feb 2006 10:37:55 -0600
From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 'snapshot' target still experimental :-(
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I noticed that this is still the case... but I want to use it :-)

I need to set up simple snapshot/rsync backups of XFS filesystems, so 
I'm wondering what the current thinking in the community is. Is it 
reliable enough to trust not to crash my server or do other nasty things?
