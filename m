Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88EwsZ8009466
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 10:58:54 -0400
Received: from arvo.suso.org (mail.suso.org [216.9.132.134])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k88EwkmQ029556
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 10:58:46 -0400
Date: Fri, 8 Sep 2006 14:55:27 +0000
From: Mark Krenz <mark@suso.org>
Message-ID: <20060908145527.GA29217@arvo.suso.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM metadata checksums
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


  Before you say, DON'T DO IT THAT WAY, let me assure you that I have my
reasons and I'm aware of the risks. This is mostly related to my
question about changing UUIDs of physical volumes and volume groups.
Anyways, I thought that perhaps I could try to use hexedit to modify the
UUID within the image file.  However, after I did this I ran into all
the lvm commands complaining about checksum errors in the metadata.  So
my question is, where is the checksum stored and how is it calculated.
I noticed that there is an "LVM header near the beginning of the disk
followed by a long string:

 LABELONE........?... ...LVM2  001M0U7CEZK8M7l2Z4KnOtI1uSVjAu0cCFd

 Is that last part the checksum?  What kind is it?


-- 
Mark S. Krenz
IT Director
Suso Technology Services, Inc.
http://suso.org/
