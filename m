Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88HFE36016297
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 13:15:14 -0400
Received: from arvo.suso.org (mail.suso.org [216.9.132.134])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k88HF6Z6032252
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 13:15:07 -0400
Date: Fri, 8 Sep 2006 17:11:47 +0000
From: Mark Krenz <mark@suso.org>
Subject: Re: [linux-lvm] Altering a Physical Volume's UUID [solved]
Message-ID: <20060908171145.GF29217@arvo.suso.org>
References: <20060908125506.GA30379@arvo.suso.org>
	<20060908153510.GI19633@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060908153510.GI19633@percy.comedia.it>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


  Hey, that works!  Thank you very much Luca.  For other people's
benifit that may find this in a search, here is what I did:

This assumes that you ALREADY have a disk file called lvmdisk1 with lvm partitions on it

# losetup /dev/loop0 lvmdisk1
# vgscan
# vgcfgbackup -f TemplateVG.cfg TemplateVG

Now edit TemplateVG.cfg file and change the IDs for the volume group,
physical volume and logical volumes too.  I made it easy by just
incrementing the last character by one, a becomes b, x becomes y, etc.
Keep track of what ID you gave the physical volume.

# vgchange -a n TemplateVG 

Now run pvcreate using the --uuid option and use the NEW uuid that you
generated an changed to in the VG config file.

# pvcreate -ff --uuid CFhjSe-EqSc-pnDz-4UcP-ylxh-hcY6-oV6BGR --restorefile TestDiskVG.cfg /dev/loop2

It will complain that it couldn't find the physical volume with the
specified uuid, but it will still create the physical volume.


# vgcfgrestore -f TemplateVG.cfg TemplateVG

# vgchange -a y TemplateVG

That's it, now you can change the volume group name if that's what you
need to do.  You should try mounting one of the logical volumes now to
make sure the data is still in tact.




On Fri, Sep 08, 2006 at 03:35:10PM GMT, Luca Berra [bluca@comedia.it] said the following:
> On Fri, Sep 08, 2006 at 12:55:06PM +0000, Mark Krenz wrote:
> > So is there a way to change the UUID of a physical volume and volume
> >group?
> >
> i'd try with vgcfgbackup, sed, pvcreate, vgcfgrestore.
> 
> L.
> 
> -- 
> Luca Berra -- bluca@comedia.it
>        Communication Media & Services S.r.l.
> /"\
> \ /     ASCII RIBBON CAMPAIGN
>  X        AGAINST HTML MAIL
> / \
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


-- 
Mark S. Krenz
IT Director
Suso Technology Services, Inc.
http://suso.org/
