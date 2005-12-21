Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBL3gJ125627
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 22:42:19 -0500
Received: from mail7.amherst.edu (mail7.amherst.edu [148.85.136.41])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBL3gDhZ018061
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 22:42:13 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 20 Dec 2005 22:42:11 -0500
Message-ID: <0456A130F613AD459887FF012652963F33EC0E@mail7.amherst.edu>
From: "Steffen Plotner" <swplotner@amherst.edu>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM Snapshot Remove troubles....
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

Hello,

I have been debugging and struggling with the following problem:

On 2.6.13-1.1532_FC4:

1. create a logical volume of size 10GB (the size does not matter, some
size...)
2. create a snapshot for this logical volume (50% of the original)
3. Switch to another console window, and do 

	dd if=/dev/zero of=/dev/vg_test/lv_test bs=1M

	that simply writes a lot of zero'd pages to the original volume,
causing a lot of data written into a snapshot which is fine and
expected. Now comes the problem.

4. Go to another console window, and do

	lvremove /dev/vg_test/lv_test_snap

	to remove the snapshot (WHILE the dd command is running!), say
YES when asked to confirm and you will find that the system cannot
remove the snapshot until all IO ends (most times). Let's continue this
scenario

5. on another console window, do

	lvscan

	it hangs and is not able to enumerate all logical volumes
(pressing ^C exists)

6. Go to another console windows, and do 

	dd if=/dev/vg_test/lv_test of=/dev/null bs=1M

	and you will see that this process reads for a little while and
then eventually all IO on /dev/vg_test/lv_test ceases and the system
ends up being hung.

This has occurred with various FC4 kernels (2.6.12, 2.6.13, 2.6.14) and
after upgrading as recommended to device-mapper 1.02.02 (original:
1.01.02), lvm 2.02.01 (original 2.01.08) I find that I get kernel
crashes. The following thread on google demonstrates the result which
appears to have been around for a while:

http://groups.google.com/group/linux.kernel/browse_thread/thread/6af10a7
680948714/d69cbfa7b18b63e6?lnk=st&q=client_free_pages&rnum=3#d69cbfa7b18
b63e6

I apologize for being lengthy and I would like to acknowledge the hard
word everyone is putting into the open source community. I would like to
hear from others who have experienced problems removing snapshots while
the system is under heavy IO load. Is this a known issue? Is there a
possible workaround?

Thank you

Steffen.
