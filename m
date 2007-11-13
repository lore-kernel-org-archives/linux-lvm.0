Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lADGcGke024235
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 11:38:16 -0500
Received: from mexforward.lss.emc.com (mexforward.lss.emc.com [128.222.32.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lADGcA1W011584
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 11:38:10 -0500
Received: from hop04-l1d11-si01.isus.emc.com (HOP04-L1D11-SI01.isus.emc.com
	[10.254.111.54])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lADGbs5C021106
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 11:37:59 -0500 (EST)
Received: from mailhub.lss.emc.com (uraeus.lss.emc.com [10.254.144.14]) by
	hop04-l1d11-si01.isus.emc.com (Tablus Interceptor) for
	<linux-lvm@redhat.com>; Tue, 13 Nov 2007 11:37:34 -0500
Received: from corpussmtp3.corp.emc.com (corpussmtp3.corp.emc.com
	[10.254.64.53])
	by mailhub.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lADGaPtI004785
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 11:37:07 -0500 (EST)
From: pham_cuong@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Beginner Questions
Date: Tue, 13 Nov 2007 11:36:37 -0500
Message-ID: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A2BA@CORPUSMX20A.corp.emc.com>
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88E@an-ex.ActiveNetwerx.int>
References: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int><20071112215854.GU22843@agk.fab.redhat.com><1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88C@an-ex.ActiveNetwerx.int><20071112223338.GV22843@agk.fab.redhat.com><1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88D@an-ex.ActiveNetwerx.int><20071112230026.GW22843@agk.fab.redhat.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88E@an-ex.ActiveNetwerx.int>
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
To: linux-lvm@redhat.com

One last thing:

While your physical drive is said to be 1.5 GB, I think that is the
marketing GB (1E+30) and not engineering GB (2^30 Bytes).  Performing
the calculations using the info you've provided shows that there is
372.98 GB unaccounted for, not 500 GB as you've expected.

==========  ==========  ================================================
Block size	No blocks	                      Size		
==========  ==========  ================================================
  [KB]	  [KB]	    [KB]	          [MB]	        [GB]
==========  ==========  ================================================
 4,096 	 190,718 	 781,180,928 	 762,872.00 	 744.99 
 4,096 	 357,626 	 1,464,836,096 	 1,430,504.00 	 1,396.98 
==========  ==========  ================================================

(1396.98-1024) GB  = 372.98 GB.

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Joseph L. Casale
Sent: Monday, November 12, 2007 6:29 PM
To: 'LVM general discussion and development'
Subject: RE: [linux-lvm] Beginner Questions

Ok,
So when I do a pvdisplay and see "1024.00 GB / not usable 8192.00 EB"
that is misreported on both sides of the /?

Thanks everyone for all the guidance!

jlc

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Alasdair G Kergon
Sent: Monday, November 12, 2007 4:00 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Beginner Questions

On Mon, Nov 12, 2007 at 03:48:27PM -0700, Joseph L. Casale wrote:
>   /dev/sdb1  iSCSI_dvr  lvm2 a-   744.99G 744.99G 745.00G
yQyVCe-tiS4-Ma1E-hilJ-niuG-KXL9-jkKVIk
>   /dev/sdc1  iSCSI_dvr  lvm2 a-     1.36T   1.36T   1.36T
PURHhY-Lo1T-5bif-HjGP-dP3o-NVTs-71ZKUm
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
              All   sizes   are   output  in  these  units:
(h)uman-readable,
              (s)ectors,  (b)ytes,  (k)ilobytes,   (m)egabytes,
(g)igabytes,
              (t)erabytes.  Capitalise to use multiples of 1000 (S.I.)
instead
              of 1024.  Can also specify custom (u)nits e.g.  --units 3M

Alasdair
--
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
