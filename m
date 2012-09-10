Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8AAWWZd010941
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2012 06:32:32 -0400
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8AAWVvq015641
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2012 06:32:31 -0400
Received: by wibhm6 with SMTP id hm6so1543782wib.9
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2012 03:32:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGQjrKa5_w0haG9YYDSxYF9XeFT0V4805bC2aLvnzDwkrr5kUg@mail.gmail.com>
References: <CAGQjrKa5_w0haG9YYDSxYF9XeFT0V4805bC2aLvnzDwkrr5kUg@mail.gmail.com>
From: Fran Garcia <franchu.garcia@gmail.com>
Date: Mon, 10 Sep 2012 11:32:09 +0100
Message-ID: <CAD+pdNckaWNCyeh+edEewiosxc1OO_NGDVLgv2KO+Y2MjUSwOg@mail.gmail.com>
Subject: Re: [linux-lvm] merge two lvms on same VG
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Sep 5, 2012 at 1:16 PM, tariq wali <ganaiwali@gmail.com> wrote:
> Hi, I had a situation to combine two LVM's on the same VG , other than
> wiping the existing ones and recreating a new one is there a way to merge
> the two on same VG ?

vgmerge.  You need to have the source VG with all your LVs inactive
and the PE size must be the same in both VGs.


Basically this would be:

lvchange -a n /dev/vg02/lv01
lvchange -a n /dev/vg02/lv02
lvchange -a n /dev/vg02/lv03
...
vgmerge vg01 vg02
vgchange -ay


this would put all the LVs from vg02 into the vg01 VG.

HTH
