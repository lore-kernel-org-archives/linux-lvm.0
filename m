Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6B91M8x016648
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2007 05:01:23 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.177])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6B91Jtu025772
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2007 05:01:19 -0400
Received: by py-out-1112.google.com with SMTP id p76so3252833pyb
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2007 02:01:18 -0700 (PDT)
Message-ID: <1cd18cb0707110201r7f589cew9bf5a005f8bc30bf@mail.gmail.com>
Date: Wed, 11 Jul 2007 11:01:17 +0200
From: "Marco Antonelli" <marcoantonelli82@gmail.com>
Subject: Re: [linux-lvm] Logical Volume on two disk,
	one is broken: how to restore data from the good disk?
In-Reply-To: <20070711043839.1596A77714@mail.futurelabusa.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1cd18cb0707100731h7cef5a91qcab1051f234c61bb@mail.gmail.com>
	<20070711043839.1596A77714@mail.futurelabusa.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thank you Jim, I'll try your suggestions; I'll let you now what will happen.
Bye,
Marco

2007/7/11, Jim Schatzman <james.schatzman@futurelabusa.com>:
>  From me the amateur. You appear to have lost some data. You probably have some files that are recoverable. You have a few choices:
>
> 1) Send your disks to a professional. See http://myharddrivedied.com, for example.
>
> 2) Replace the electronics PC board on your drive. See the same above website for more info on that. This might recover all your data. It also may make no change.
>
> 3) Use dmsetup to enable a partial VG (use vgchange -Pay as explained in the article). See
> http://e2salvage.sourceforge.net/florian2.html
> Retrieve what files you can.
>
> You can also remove the bad drive entirely and do a partial VG.
>
> 4) Use dd ignoring errors to do a raw copy off the bad drive to an identical good drive.
> Use vgcfgbackup. Remove the bad drive. Install the new drive.
>
> Edit the vgcfg backup, edit the id in the logical_volumes
> sections, check your work carefully, and vgcfgrestore
>
> as mentioned by Ryan Nelson.  This is probably going to get you about what #3 does.
>
> Good luck-
>
> Jim
>
