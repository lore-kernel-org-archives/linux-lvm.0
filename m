Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0CGeqDx009344
	for <linux-lvm@redhat.com>; Fri, 12 Jan 2007 11:40:52 -0500
Received: from rozz.csail.mit.edu (mail@rozz.csail.mit.edu [128.30.2.16])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0CGelQc012487
	for <linux-lvm@redhat.com>; Fri, 12 Jan 2007 11:40:48 -0500
Received: from burton-one-thirty-two.mit.edu ([18.247.5.132])
	by rozz.csail.mit.edu with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.63)
	(envelope-from <hug@mit.edu>) id 1H5PSO-0007g6-60
	for linux-lvm@redhat.com; Fri, 12 Jan 2007 11:40:44 -0500
Message-ID: <45A7BA03.6030205@mit.edu>
Date: Fri, 12 Jan 2007 11:40:35 -0500
From: Caleb Hug <hug@mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: FC6: pvmove gives "device-mapper: reload ioctl
 failed: Invalid argument"
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

Hi,
I had exactly the same problem.  My guess is that it has something to do 
with the device-mapper not getting along with the x86_64 kernel. 

This is how I proceeded:
1) booted knoppix
2) loaded the dm-mod, and the dm-mirror modules:
    modprobe dm-mod
    modprobe dm-mirror
3) pvmove /dev/sddc1 ... and so on

seems to work fine,
~caleb
