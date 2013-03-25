Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2PE1qh3028223
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 10:01:52 -0400
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2PE1oHr010315
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 10:01:51 -0400
Received: by mail-bk0-f48.google.com with SMTP id jf3so303389bkc.7
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 07:01:50 -0700 (PDT)
From: "=?iso-8859-1?Q?Bj=F6rn_Nadrowski?=" <bjrnfrdnnd@gmail.com>
Message-Id: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
Date: Mon, 25 Mar 2013 15:01:47 +0100
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vg disappeared after replacing disc in raid10
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello, 

After replacing a disc in my raid10 system (ubuntu 12.04), my volume group (that contained all my data and my system) was gone.

Problem description is here:

http://ubuntuforums.org/showthread.php?t=2128504

I managed to retrieve the metadata of the volume group and the logical volumes underneath, but I did not succeed using

vgcfgrestore 

successfully in order to regain access to my data.

It seems I might have to try dmsetup, but I am afraid I might destroy my data if I use it. I have no experience with that program.


If any of you has any idea or any experience with restoring lvm volumes or using dsetup, please help me!
