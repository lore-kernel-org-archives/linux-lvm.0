Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA4Ix2A3019268
	for <linux-lvm@redhat.com>; Wed, 4 Nov 2009 13:59:02 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA4Iwrsv006920
	for <linux-lvm@redhat.com>; Wed, 4 Nov 2009 13:58:53 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nA4Iwqkx020686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 4 Nov 2009 13:58:52 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nA4IwpRg004415
	for <linux-lvm@redhat.com>; Wed, 4 Nov 2009 13:58:52 -0500
Date: Wed, 4 Nov 2009 13:58:51 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] kernel panic on lvcreate
In-Reply-To: <25671167.21257271245732.JavaMail.javamailuser@localhost>
Message-ID: <Pine.LNX.4.64.0911041336540.4214@bmsred.bmsi.com>
References: <25671167.21257271245732.JavaMail.javamailuser@localhost>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 3 Nov 2009, Christopher Hawkins wrote:

> Actually it looks like the reverse might be true. I tried this on a box with
> older kernel 2.6.18-92.1.22.el5 and there is no panic. I upgraded that box to
> kernel 2.6.18-164.2.1.el5, reboot, and now the panic is reproducible. Trying
> to get an oops, will post again soon. 

I believe I am getting the same thing.  An lvcreate -s ... on the root
filesystem of dom0 causes a kernel panic.  This happened at 5:30am via cron.
This has been working for years, and seems to have started when we rebooted to
load kernel-xen-2.6.18-164.el5.  After the crash, the BIOS was unable to
respond to the soft power button, and the system required a hard poweroff.
Unfortunately, the person on site this morning didn't get anything from the
console.  Just like the OP, the snapshot is created after the reboot, BUT not
attached to the origin.  The snapsnot causing the crash was c5_SNAP below:

# lvs
  LV       VG      Attr   LSize   Origin Snap%  Move Log Copy%  Convert
  backup   backvg6 -wi-ao 232.88G                                      
  BWI      rootvg  -wi-a-  20.00G                                      
  C4       rootvg  -wi-ao  30.00G                                      
  C4_SWAP  rootvg  -wi-ao 512.00M                                      
  CentOS5  rootvg  -wi-a-   9.75G                                      
  DFL      rootvg  -wi-a-  10.00G                                      
  DFL_SWAP rootvg  -wi-a- 512.00M                                      
  GEN      rootvg  -wi-a-  10.00G                                      
  GENSWAP  rootvg  -wi-a- 512.00M                                      
  SPAN     rootvg  -wi-a-  30.00G                                      
  SPD      rootvg  -wi-ao  20.00G                                      
  SPD_SWAP rootvg  -wi-ao 512.00M                                      
  USEXP    rootvg  -wi-a-  10.00G                                      
  c5       rootvg  -wi-ao  40.00G                                      
  c5_SNAP  rootvg  -wi-a-   2.00G                                      
  c5_swap  rootvg  -wi-ao   2.00G      
# rpm -q kernel-xen lvm2
kernel-xen-2.6.18-164.el5
lvm2-2.02.46-8.el5
# diff backup/rootvg archive/rootvg_01566.vg
6c6
< description = "Created *after* executing '/usr/sbin/lvcreate -s -L 2G -n c5_SNAP /dev/rootvg/c5'"
---
> description = "Created *before* executing '/usr/sbin/lvcreate -s -L 2G -n c5_SNAP /dev/rootvg/c5'"
13c13
<       seqno = 2340
---
>       seqno = 2339
345,363d344
< 
<               c5_SNAP {
<                       id = "vdbcj3-1E3H-5ywU-QSJ8-M3W6-dLbj-FDr035"
<                       status = ["READ", "WRITE", "VISIBLE"]
<                       flags = []
<                       segment_count = 1
< 
<                       segment1 {
<                               start_extent = 0
<                               extent_count = 64       # 2 Gigabytes
< 
<                               type = "striped"
<                               stripe_count = 1        # linear
< 
<                               stripes = [
<                                       "pv3", 1920
<                               ]
<                       }
<               }

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
