Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB7Dspr11967
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 08:54:51 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.195])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB7DsjFw008965
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 08:54:45 -0500
Received: by rproxy.gmail.com with SMTP id c16so374917rne
	for <linux-lvm@redhat.com>; Tue, 07 Dec 2004 05:54:40 -0800 (PST)
Message-ID: <b9a453c204120705542e927fac@mail.gmail.com>
Date: Tue, 7 Dec 2004 14:54:39 +0100
From: =?ISO-8859-1?Q?=D2scar_=C1lvarez_Vilaplana?= <grimborg@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't access LVM volume group after changing a non-LVM
	partition
Reply-To: =?ISO-8859-1?Q?=D2scar_=C1lvarez_Vilaplana?= <grimborg@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hi,

When I try to access my lvm group (for example, running vgdisplay) I
get the following error:
  Couldn't find device with uuid '5VBBLW-70Dj-fwjf-Xvzc-7VZr-icQa-l9XQ2N'.
  Couldn't find all physical volumes for volume group data.
  Couldn't find device with uuid '5VBBLW-70Dj-fwjf-Xvzc-7VZr-icQa-l9XQ2N'.
  Couldn't find all physical volumes for volume group data.
  Volume group "data" doesn't exist

It happened just right after I deleted a /dev/hda6 (a *non-lvm*
partition) and created two partitions in the space that the deleted
partition was occupying (/dev/hda6 and /dev/hda8) (my idea was to
shrink /dev/hda6, and that did work).

Here's what the partition table looked before and after the change:

before:
   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1        1459    11719386   8e  Linux LVM
/dev/hda2            1460        3891    19535040   83  Linux
/dev/hda3            3892       14593    85963815    5  Extended
/dev/hda5            3892        5107     9767488+  8e  Linux LVM
/dev/hda6            5108       14225    73240303+  83  Linux
/dev/hda7           14226       14471     1975963+  8e  Linux LVM
/dev/hda8           14472       14593      979933+  82  Linux swap

after:
/dev/hda1   *           1        1459    11719386   8e  Linux LVM
/dev/hda2            1460        3891    19535040   83  Linux
/dev/hda3            3892       14593    85963815    5  Extended
/dev/hda5            3892        5107     9767488+  8e  Linux LVM
/dev/hda6           11796       14225    19518943+  8e  Linux LVM
/dev/hda7           14226       14471     1975963+  8e  Linux LVM
/dev/hda8            5108       11795    53721328+  83  Linux


I looked up (in /etc/lvm) the uuid lvm was complaining about and found
out it corresponds to /dev/hda7. This seems odd, /dev/hda7 should not
have been affected by the partition deleting & creation... its start
and end cylinder remained the same throughout the process and there
was no partition overlapping.

I thought maybe changing the uuid for /dev/hda7 in the /etc/lvm files,
but I couldn't find how to get the correct uuid for /dev/hda7.

What course of action do you suggest? Is it possible to get the data back?

Thanks a lot,
Oscar.
