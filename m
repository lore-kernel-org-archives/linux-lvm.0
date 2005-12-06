Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB6NbwV10010
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 18:37:58 -0500
Received: from mail.duth.gr (mail.duth.gr [192.108.114.110])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jB6NbsEH015414
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 18:37:55 -0500
Received: from [192.168.1.7] (r-esties.xan.duth.gr [193.92.238.254])
	(authenticated bits=0)
	by mail.duth.gr (8.13.1/8.13.1) with ESMTP id jB6NbitD056417
	for <linux-lvm@redhat.com>; Wed, 7 Dec 2005 01:37:49 +0200 (EET)
	(envelope-from kkyriak@ee.duth.gr)
Message-ID: <439620CE.1030902@ee.duth.gr>
Date: Wed, 07 Dec 2005 01:37:50 +0200
From: kyr <kkyriak@ee.duth.gr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] If one disk fails i loose everything?
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


  I have tree simple questions about LVM that just could not be answered
  after 4 hours of search in LVM howto, Google, Linux questions and
  linux-lvm Archives.


  I have a small file server with 600Gbytes in one liner volume group
  consisting of 3 200 Gbyte Hard disk. My questions are:


  1. If one hard disk fails (hardware) do I loose all the data stored on
  the VG?


  2. Can I add a new hard disk in the VG without having to format it
  before? (I mean if it is full of data can I just add it?)


  3. In case of failure can I recover the data from a single disk on
  another box?


  Thanks in advance


  Kyriakos


  Greece
