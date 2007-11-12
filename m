Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lACNU1L9001284
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 18:30:01 -0500
Received: from pd3mo3so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lACNTsNT028046
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 18:29:55 -0500
Received: from pd3mr5so.prod.shaw.ca (pd3mr5so-qfe3.prod.shaw.ca [10.0.141.12])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JRF002LF2KFCVC0@l-daemon> for linux-lvm@redhat.com; Mon,
	12 Nov 2007 16:29:04 -0700 (MST)
Received: from pn2ml3so.prod.shaw.ca ([10.0.121.147])
	by pd3mr5so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JRF00HDL2KE3JA0@pd3mr5so.prod.shaw.ca> for
	linux-lvm@redhat.com; Mon, 12 Nov 2007 16:29:03 -0700 (MST)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun Java System Messaging Server 6.2-7.05 (built Sep 5
	2006))
	with ESMTP id <0JRF00I1E2KDA760@l-daemon> for linux-lvm@redhat.com; Mon,
	12 Nov 2007 16:29:02 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])	by mail.activenetwerx.com
	(Postfix) with ESMTP id 28F58FD311	for <linux-lvm@redhat.com>; Mon,
	12 Nov 2007 16:29:00 -0700 (MST)
Received: from an-ex.ActiveNetwerx.int (unknown [192.168.5.3])
	by mail.activenetwerx.com (Postfix) with ESMTP id 21F06FD2DD	for
	<linux-lvm@redhat.com>; Mon, 12 Nov 2007 16:28:59 -0700 (MST)
Date: Mon, 12 Nov 2007 16:28:58 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Subject: RE: [linux-lvm] Beginner Questions
In-reply-to: <20071112230026.GW22843@agk.fab.redhat.com>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88E@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
References: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
	<20071112215854.GU22843@agk.fab.redhat.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88C@an-ex.ActiveNetwerx.int>
	<20071112223338.GV22843@agk.fab.redhat.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88D@an-ex.ActiveNetwerx.int>
	<20071112230026.GW22843@agk.fab.redhat.com>
Content-Transfer-Encoding: 8bit
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Ok,
So when I do a pvdisplay and see "1024.00 GB / not usable 8192.00 EB" that is misreported on both sides of the /?

Thanks everyone for all the guidance!

jlc

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Alasdair G Kergon
Sent: Monday, November 12, 2007 4:00 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Beginner Questions

On Mon, Nov 12, 2007 at 03:48:27PM -0700, Joseph L. Casale wrote:
>   /dev/sdb1  iSCSI_dvr  lvm2 a-   744.99G 744.99G 745.00G yQyVCe-tiS4-Ma1E-hilJ-niuG-KXL9-jkKVIk
>   /dev/sdc1  iSCSI_dvr  lvm2 a-     1.36T   1.36T   1.36T PURHhY-Lo1T-5bif-HjGP-dP3o-NVTs-71ZKUm
> Disk /dev/sdc: 1499.9 GB, 1499998453760 bytes

This is what I see for a similar volume:

# pvs -v --units H
1.50T

# pvs -v --units h
1.36T

# pvs -v --units G
1500.00G

man page:

       --units hsbkmgtHKMGT
              All   sizes   are   output  in  these  units:  (h)uman-readable,
              (s)ectors,  (b)ytes,  (k)ilobytes,   (m)egabytes,   (g)igabytes,
              (t)erabytes.  Capitalise to use multiples of 1000 (S.I.) instead
              of 1024.  Can also specify custom (u)nits e.g.  --units 3M

Alasdair
--
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
