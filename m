Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8CEaSY5005150
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 10:36:29 -0400
Received: from mrz.swissptt.ch (outmail30.swisscom.com [138.190.3.150])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8CEaO3N022011
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 10:36:26 -0400
Date: Wed, 12 Sep 2007 16:36:21 +0200
From: Chris Osicki <osk@admin.swisscom-mobile.ch>
Message-ID: <20070912163621.1f951876@slopi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Q: Online resizing ext3 FS
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
To: linux-raid@vger.kernel.org, linux-lvm@redhat.com


Hi

I apologize in advance for asking a question not really appropriate
for this mailing list, but I couldn't find a better place with lots of
people managing lots of disk space. 

The question:
Has anyone of you been using ext2online to resize (large) ext3 filesystems?
I have to do it going from 500GB to 1TB on a productive system I was
wondering if you have some horror/success stories.
I'm using RHEL4/U4 (kernel 2.6.9) on this system.

Thanks for your time.

Regards,
Chris

UNIX System Engineer
Swisscom Mobile Ltd.
Switzerland
