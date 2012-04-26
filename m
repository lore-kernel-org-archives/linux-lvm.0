Received: from mx2.redhat.com (ext-mx01.rdu.redhat.com [10.11.45.6])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3QF9NeH027929
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2012 11:09:23 -0400
Received: from mail-yx0-f174.google.com (mail-yx0-f174.google.com
	[209.85.213.174])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id q3QF9C1c032658
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2012 11:09:13 -0400
Received: by yenl12 with SMTP id l12so1282673yen.33
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2012 08:09:12 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 26 Apr 2012 10:09:12 -0500
Message-ID: <CA+_JKzpS_Ok7+963_WoYDQwpsPxBNdS4+1sXCqWiuAWcHxgkVw@mail.gmail.com>
From: Clay Gerrard <clay.gerrard@gmail.com>
Subject: [linux-lvm] addtag
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
To: linux-lvm@redhat.com

On Ubuntu Oneiric the man page for lvm describes the use of tags, with
an addendum about tagging snapshots:

       --addtag tag
              Add  the tag tag to a PV, VG or LV.  A tag is a word that can be
              used to group LVM2 objects of the same type together.  Tags  can
              be given on the command line in place of PV, VG or LV arguments.
              Tags should be prefixed with @ to avoid ambiguity.  Each tag  is
              expanded  by  replacing  it with all objects possessing that tag
              which are of the type expected by its position  on  the  command
              line.  PVs can only possess tags while they are part of a Volume
              Group: PV tags are discarded if the PV is removed from  the  VG.
              As  an example, you could tag some LVs as database and others as
              userdata and then activate the database ones with  lvchange  -ay
              @database.   Objects  can  possess multiple tags simultaneously.
              Only the new LVM2  metadata  format  supports  tagging:  objects
              using  the LVM1 metadata format cannot be tagged because the on-
              disk format does not support it.  **Snapshots  cannot
be  tagged.**
              Characters allowed in tags are: A-Z a-z 0-9 _ + . -

Specifically I'm concerned about "Snapshots  cannot  be  tagged."

It seems that tagging of snapshots *is* supported?

	root@myhost:~# lvcreate myvg -n vol1 -L 100M
	  Logical volume "vol1" created
	root@myhost:~# lvcreate myvg/vol1 -s -n mysnap -L 100M
	  Logical volume "mysnap" created
	root@myhost:~# lvchange --addtag mytag myvg/mysnap
	  Logical volume "mysnap" changed
	root@myhost:~# lvs @mytag
	  LV     VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
	  mysnap myvg swi-a- 100.00m vol1     0.01


Can I rely on this feature being supported for snapshots despite the
man page's statement to the contrary?

Best Regards,

-clayg
