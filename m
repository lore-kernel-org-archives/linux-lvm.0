Message-ID: <E3A1ACFEDE71D3118C000020352285A01E73D0@nbsjexm2.nbtel.nb.ca>
From: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>
Subject: RE: [linux-lvm] Seg fault on vgscan
Date: Fri, 7 Apr 2000 15:01:24 -0300 
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

> This is very bad.  You should not use LVM on existing partitions.  Does it
> not say anything in this regard in the documentation?  Probably, as a
> safety measure, the LVM commands should verify that a partition is not
> mounted before doing a pvcreate/vgcreate on it.

I've not seen this in writing anywhere, but could have missed it.  I would
hope there's a way to handle root_vg filesystems.  I thought I saw something
in the archives regarding 'encapsulating' the root partition...  
 
Thanks,
Marco
