Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4G5xCgX015815
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 01:59:12 -0400
Received: from smtp.andrew.cmu.edu (smtp.andrew.cmu.edu [128.2.10.82])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4G5x4fp003895
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 01:59:04 -0400
Received: from [192.168.0.235] (c-24-61-19-11.hsd1.ma.comcast.net
	[24.61.19.11]) (user=jluxenbe mech=PLAIN (0 bits))
	by smtp.andrew.cmu.edu (8.13.5/8.13.6) with ESMTP id k4G5x49r008892
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 01:59:04 -0400
Message-ID: <44696A27.5050500@andrew.cmu.edu>
Date: Tue, 16 May 2006 01:59:03 -0400
From: Jared Luxenberg <jluxenbe@andrew.cmu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Forgot to export my volume group...
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
To: linux-lvm@redhat.com

I forgot to run export on my volume group before disconnecting it from 
my system.  Is there any way to mount the volume group without access to 
the original machine?

If I could get the machine back up, but without this volume group 
attached, is there any way to get the metadata I need from some system 
files somewhere on the drive?  Or do I have to physically bring the 
volume group to the machine (not possible)?

Thanks,
Jared
