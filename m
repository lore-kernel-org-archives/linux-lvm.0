Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6FK1MZk021693
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 16:01:22 -0400
Received: from smtp2.pacifier.net (smtp2.pacifier.net [64.255.237.172])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6FK1LjO011233
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 16:01:22 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by smtp2.pacifier.net (Postfix) with ESMTP id 94B0A6A47F
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 13:01:21 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Fri, 15 Jul 2011 13:01:15 -0700
References: <201107141946.12747.benscott@nwlink.com>
	<20110715113901.GE15253@agk-dp.fab.redhat.com>
In-Reply-To: <20110715113901.GE15253@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201107151301.15551.benscott@nwlink.com>
Subject: Re: [linux-lvm] merging snapshots and lvs bug
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
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

On July 15 04:39:01 AM Alasdair G Kergon wrote:
> On Thu, Jul 14, 2011 at 07:46:12PM -0700, ben wrote:
> > Currently the first field of the attribute bits are set to 's' for a
> > snapshot and 'S' for a merging snap. Unfortunatly 'S' was used for an
> > invalid snapshot and lvs still uses it both ways.
> 
> Invalid snapshot is meant to be shown by I (for invalid) in the 5th
> position.
> 
>               The lv_attr bits are:
> 
>               1  Volume  type:  (m)irrored,  (M)irrored  without initial
> sync, (o)rigin, (O)rigin with merging snapshot, (s)napshot, merging
> (S)napshot,   (p)vmove,  (v)irtual,  mirror  (i)mage,  mirror (I)mage
> out-of-sync, under (c)onversion
> 
>               5  State:  (a)ctive,  (s)uspended,  (I)nvalid  snapshot,
> invalid (S)uspended snapshot, mapped (d)evice present without tables,
> mapped device present with (i)nactive table
> 
> If some particular case is giving the wrong output, please show us exactly
> which case that is, and how the output looks, together with 'dmsetup info
> -c', 'dmsetup table' and 'dmsetup status'.
> 
> Alasdair

It isn't a special case. Invalid snaps use capital 'S' in the first column and 
so do merging snaps. The invalid snap 'S' dates back to old versions of LVM. 
Here we have three snaps, the first is invalid, the second is merging and the 
last is normal:

  LV      VG   Attr   LSize    Origin Snap%  Move Log Copy%  Convert
  lv1     vg01 owi-a- 1023.00m                                      
  lv2     vg01 Owi-a-    2.00g                                      
  lv3     vg01 owi-a- 1023.00m                                      
  snap1   vg01 Swi-I-  102.00m lv1    100.00                        
  [snap2] vg01 Swi-a- 1023.00m lv2     30.25                        
  snap3   vg01 swi-a-  102.00m lv3      0.00 

vg01-snap3-cow   254  11 L--w    1    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72faEpbkeDdAe81saUi0RzfzdLRlKU3uDkw9-cow 
vg01-lv3         254   8 L--w    0    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72faDeYH4cymsf09Bc3eZSzBuaA1BQnsdX2G     
vg01-lv2         254   4 L--w    0    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72fa0N2vOYUtmgPDeaNpGw2VlFDao15M6Ilw     
vg01-lv1-real    254   2 L--w    2    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72facep9w6L1Pdy03yE23PuByJVKAPXZqsWf-real
vg01-lv1         254   0 L--w    0    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72facep9w6L1Pdy03yE23PuByJVKAPXZqsWf     
vg01-snap3       254   9 L--w    0    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72faEpbkeDdAe81saUi0RzfzdLRlKU3uDkw9     
vg01-lv2-real    254   6 L--w    2    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72fa0N2vOYUtmgPDeaNpGw2VlFDao15M6Ilw-real
vg01-snap2       254   5 L--w    0    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72fal7p85XD8336q9jyIFDXa6Xb0JCl3ZPNX     
vg01-lv3-real    254  10 L--w    2    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72faDeYH4cymsf09Bc3eZSzBuaA1BQnsdX2G-real
vg01-snap1       254   1 L--w    0    1      1 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72faUWfv2h31eXQkcm0f712lGTcxPKwqgzBr     
vg01-snap1-cow   254   3 L--w    1    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72faUWfv2h31eXQkcm0f712lGTcxPKwqgzBr-cow 
vg01-snap2-cow   254   7 L--w    1    1      0 LVM-
UiEDiN8ISFoHCVpdhKbIJ3y8tmLY72fal7p85XD8336q9jyIFDXa6Xb0JCl3ZPNX-cow 

vg01-snap3-cow: 0 208896 linear 
vg01-lv3: 0 2095104 snapshot-origin 
vg01-lv2: 0 4192256 snapshot-origin 
vg01-lv1-real: 0 2095104 linear 
vg01-lv1: 0 2095104 snapshot-origin 
vg01-snap3: 0 2095104 snapshot 16/208896 16
vg01-lv2-real: 0 4192256 linear 
vg01-snap2: 0 4192256 snapshot 633768/2095104 2480
vg01-lv3-real: 0 2095104 linear 
vg01-snap1: 0 2095104 snapshot Invalid
vg01-snap1-cow: 0 208896 linear 
vg01-snap2-cow: 0 2095104 linear
