Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l177pG9H030685
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 02:51:16 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l177pEZI031689
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 02:51:15 -0500
Date: Wed, 7 Feb 2007 08:51:13 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] pvscan does not detect lvm1 exported volume group
Message-ID: <20070207075112.GB12469@percy.comedia.it>
References: <C40752F5-E7A4-4B4A-98F1-3DFF485DD152@cmpmail.ucsf.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C40752F5-E7A4-4B4A-98F1-3DFF485DD152@cmpmail.ucsf.edu>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Feb 01, 2007 at 08:21:00AM -0800, Nico Stuurman wrote:
>The relevant output of pvscan -vvvv is copied below.  The volume  
>group consists of /dev/sdb1 and /dev/sdc1.  Apparently, pvscan sees  
>some kind of md raid information on /dev/sdb1 and decides to skip it?

I don't know why there is a md superblock at the end of sdb1 and sdc1,
maybe you used to mirror or stripe them before, then forgot to remove
the superblock when you quit md.
anyway you can use mdadm to examine and remove the superblock from sdb1
and sdc1.
In alternative you can disable md_component_detection in
/etc/lvm/lvm.conf (if you will never use lvm over md anymore, that is)

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
