Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kA51jBIt018473
	for <linux-lvm@redhat.com>; Sat, 4 Nov 2006 20:45:11 -0500
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.187])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kA51jACC000760
	for <linux-lvm@redhat.com>; Sat, 4 Nov 2006 20:45:10 -0500
Received: by nf-out-0910.google.com with SMTP id o63so1906766nfa
	for <linux-lvm@redhat.com>; Sat, 04 Nov 2006 17:45:09 -0800 (PST)
Message-ID: <eea181bf0611041745u7dc6340dl8e7e266d638aa054@mail.gmail.com>
Date: Sat, 4 Nov 2006 17:45:08 -0800
From: "Patrick bakker" <patrickbakker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] recovering volume group metadata - LVM volumes from FC5
	disappeared in FC6 install
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
I originally posted a message to fedora-devel
(https://www.redhat.com/archives/fedora-devel-list/2006-October/msg00822.html)
detailing how I lost my LVM volume groups from FC5 (or earlier) while
installing FC6. The short version is I now have FC6 installed on
plain-old ext3 partitions and the volume groups from FC5 are untouched
since anaconda messed them up. Since /etc with the LVM backups was
part of the volume groups ... its no longer available. If I fdisk
/dev/hda I can still see the LVM partition:

> fdisk /dev/hda
> p

  Device Boot      Start         End      Blocks   Id  System
/dev/hda1               1        3648    29302528+   5  Extended
/dev/hda2            3649       24792   169839180   8e  Linux LVM
/dev/hda5               1         608     4883697   83  Linux
/dev/hda6             609        1216     4883728+  83  Linux
/dev/hda7            1217        1824     4883728+  83  Linux
/dev/hda8            1825        2432     4883728+  83  Linux
/dev/hda9            2433        3040     4883728+  83  Linux
/dev/hda10  *        3041        3053      104391   83  Linux

> pvscan -vvv

Finds nothing.

Is it possible to recreate the volume groups by hand somehow or search
through the partition for sectors that look like they belong to LVM
and fix things that way?

Patrick Bakker
