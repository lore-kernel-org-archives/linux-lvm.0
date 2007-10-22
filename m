Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9M815Ir003039
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 04:01:05 -0400
Received: from mars.math-info.univ-paris5.fr (mars.math-info.univ-paris5.fr
	[193.48.200.18])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9M813pQ005625
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 04:01:04 -0400
Received: from [127.0.0.1] (mars.math-info.univ-paris5.fr [127.0.0.1])
	by mars.math-info.univ-paris5.fr (8.14.1/jtpda-5.4) with ESMTP id
	l9M8129L031999
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 10:01:03 +0200
Message-ID: <471C58BE.6040902@math-info.univ-paris5.fr>
Date: Mon, 22 Oct 2007 10:01:02 +0200
From: =?ISO-8859-1?Q?Fran=E7ois_Patte?=
	<francois.patte@math-info.univ-paris5.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] error messages
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Bonjour,

I am new to LVM and perhaps made some mistake during installation. I
changed my mind and removed VG after I created them, before recreating
them in a better way.

Now, it is working but I have some messages at boot time; here are some
samples:

couldn't find device with uuid "long-uuid"
couldn't find all PV for VG fedora

(this repeated two times)

VG fedora not found

Found VG fedora using metadata type lvm2
  "    " suppl    "      "       "   "
  "    " suppl    "      "       "   "

6 LV in VG fedora now active

Then the boot sequence goes on.... And:

Warning LVM: duplicate VG name suppl existing "long-uuid" (created here)
takes precedence over "long-uuid"

same for VG fedora

then new warning as above "couldn't find, etc...."

At the end something has FAILED

And:

6 LV in VG fedora now active
2 LV in VG suppl now active
0 LV in VG suppl now active


BTW everything seems to work! (ie: i can use my computer)

thanks for any help.

-- 
Fran�ois Patte
UFR de math�matiques et informatique
Universit� Paris Descartes
45, rue des Saints P�res
F-75270 Paris Cedex 06
T�l. +33 (0)1 44 55 35 61
http://www.math-info.univ-paris5.fr/~patte
