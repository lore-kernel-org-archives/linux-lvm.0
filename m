Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lACMnWmW017958
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 17:49:32 -0500
Received: from pd2mo1so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lACMnPcs005030
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 17:49:25 -0500
Received: from pd4mr5so.prod.shaw.ca (pd4mr5so-qfe3.prod.shaw.ca [10.0.141.50])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JRF005WU0OUDF10@l-daemon> for linux-lvm@redhat.com; Mon,
	12 Nov 2007 15:48:30 -0700 (MST)
Received: from pn2ml8so.prod.shaw.ca ([10.0.121.152])
	by pd4mr5so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JRF00JLT0OU1170@pd4mr5so.prod.shaw.ca> for
	linux-lvm@redhat.com; Mon, 12 Nov 2007 15:48:31 -0700 (MST)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JRF001DH0OT8I20@l-daemon> for linux-lvm@redhat.com; Mon,
	12 Nov 2007 15:48:29 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])	by mail.activenetwerx.com
	(Postfix) with ESMTP id 9712CFD311	for <linux-lvm@redhat.com>; Mon,
	12 Nov 2007 15:48:29 -0700 (MST)
Received: from an-ex.ActiveNetwerx.int (unknown [192.168.5.3])
	by mail.activenetwerx.com (Postfix) with ESMTP id EA6EAFD2DD	for
	<linux-lvm@redhat.com>; Mon, 12 Nov 2007 15:48:28 -0700 (MST)
Date: Mon, 12 Nov 2007 15:48:27 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Subject: RE: [linux-lvm] Beginner Questions
In-reply-to: <20071112223338.GV22843@agk.fab.redhat.com>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88D@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
References: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
	<20071112215854.GU22843@agk.fab.redhat.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88C@an-ex.ActiveNetwerx.int>
	<20071112223338.GV22843@agk.fab.redhat.com>
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

Pvs -v
  /dev/sdb1  iSCSI_dvr  lvm2 a-   744.99G 744.99G 745.00G yQyVCe-tiS4-Ma1E-hilJ-niuG-KXL9-jkKVIk
  /dev/sdc1  iSCSI_dvr  lvm2 a-     1.36T   1.36T   1.36T PURHhY-Lo1T-5bif-HjGP-dP3o-NVTs-71ZKUm

Still baffling me is that fdisk -l shows:
Disk /dev/sdc: 1499.9 GB, 1499998453760 bytes
255 heads, 63 sectors/track, 182364 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdc1               1      182364  1464838798+  8e  Linux LVM

And 1499.9 GB = ~1.46 terabytes

Thanks!
jlc


-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Alasdair G Kergon
Sent: Monday, November 12, 2007 3:34 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Beginner Questions

On Mon, Nov 12, 2007 at 03:30:00PM -0700, Joseph L. Casale wrote:
> Thanks Alasdair, but where did the ~475 GB's go on the second? Is there some limit on PV size, I can't find anything with Google (Not that I can see 1024GB being a likely figure).

Post the output of:
  pvs -v

Alasdair
--
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
