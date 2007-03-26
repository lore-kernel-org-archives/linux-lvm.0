Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2Q0BAoB027850
	for <linux-lvm@redhat.com>; Sun, 25 Mar 2007 20:11:10 -0400
Received: from smtp1.pacifier.net (smtp1.pacifier.net [64.255.237.171])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2Q0B7OQ011806
	for <linux-lvm@redhat.com>; Sun, 25 Mar 2007 20:11:07 -0400
Received: from bedroom.boskone (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	by smtp1.pacifier.net (Postfix) with ESMTP id 5280682442
	for <linux-lvm@redhat.com>; Sun, 25 Mar 2007 17:11:06 -0700 (PDT)
From: ben scott <benscott@nwlink.com>
Date: Sun, 25 Mar 2007 17:11:05 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703251711.05482.benscott@nwlink.com>
Subject: [linux-lvm] vg attributes (vg_attr) in vgs program don't seem to
	match the man page
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
To: linux-lvm@redhat.com

The explanation of the attribute bits printed by the program "vgs" in the man 
page are as follows:

The vg_attr bits are:  (w)riteable, (r)ead only, resi(z)eable, e(x)ported, 
(p)artial and (c)lustered.

However "vgs" on my debian Etch system prints out this way:

wz--n-


  LVM version:     2.02.07 (2006-07-17)
  Library version: 1.02.12 (2006-10-13)
  Driver version:  4.7.0


Could someone please explain to me what the "n" stands for and which columns 
get the other bits. I am trying to write a parser for this output. 

Thank you. 
