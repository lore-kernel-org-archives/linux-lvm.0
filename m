Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i95M4Gr25839
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2004 18:04:16 -0400
Received: from storix.com ([206.71.178.18])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i95M4AUe001440
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2004 18:04:10 -0400
Received: from [192.168.1.126] (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id 58780158D3
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2004 14:52:29 -0700 (PDT)
From: rich turner <rich@storix.com>
Message-Id: <1097014162.3577.16.camel@rich>
Mime-Version: 1.0
Date: Tue, 05 Oct 2004 15:09:22 -0700
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvcreate error
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

i have created a bunch of logical volumes on a single system with the
following commands:
#lvcreate -C n -l 512 -n backuplv -p rw --persistent y --major 253
--minor 255 -r 0 vg0
#lvcreate -C n -l 512 -n datalv -p rw --persistent y --major 253 --minor
254 -r 0 vg0
#lvcreate -C n -l 512 -n homelv -p rw --persistent y --major 253 --minor
253 -r 0 vg0
#lvcreate -C n -l 256 -n optlv -p rw --persistent y --major 253 --minor
252 -r 0 vg0
#lvcreate -C n -l 64 -n rootlv -p rw --persistent y --major 253 --minor
251 -r 0 vg0
#lvcreate -C n -l 128 -n swaplv -p rw --persistent y --major 253 --minor
250 -r 0 vg0
#lvcreate -C n -l 50 -n testllv1 -p rw --persistent y --major 253
--minor 249 -r 0 vg0
#lvcreate -C n -l 50 -n testllv2 -p rw --persistent y --major 253
--minor 248 -r 0 vg0
#lvcreate -C n -l 50 -n testllv3 -p rw --persistent y --major 253
--minor 247 -r 0 vg0
#lvcreate -C n -l 50 -n testllv4 -p rw --persistent y --major 253
--minor 246 -r 0 vg0
#lvcreate -C n -l 50 -n testllv5 -p rw --persistent y --major 253
--minor 245 -r 0 vg0
#lvcreate -C n -l 50 -n testllv6 -p rw --persistent y --major 253
--minor 244 -r 0 vg0
#lvcreate -C n -l 768 -n tmplv -p rw --persistent y --major 253 --minor
243 -r 0 vg0

when i try to create the next one it fails with the following error:
#lvcreate -C n -l 640 -n usrlv -p rw --persistent y --major 253 --minor
242 -r 0 vg0
Physical extent 0 of /dev/hdb2 referenced by more thatn one logical
volume. Couldn't fill extent allocation bitmaps vg0.

what did i do wrong?
