Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6DHYU2S005833
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2011 13:34:31 -0400
Received: from ciomail2.sc.gov (ciomail2.sc.gov [167.7.36.2])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p6DHYSwN031550
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2011 13:34:29 -0400
From: "Males, Jess" <jmales@cio.sc.gov>
Date: Wed, 13 Jul 2011 13:34:15 -0400
Message-ID: <0A03EDA0F33C5C428BFFF019C40D609E9D3AE24268@SCMBXC01.bcbad.state.sc.us>
References: <4E1A526F.9090700@tlinx.org>
	<20110711025811.GF7857@agk-dp.fab.redhat.com>	<4E1D77A7.4030801@tlinx.org>
	<alpine.LRH.2.00.1107131137130.28748@bmsred.bmsi.com>
	<20110713161141.GX7857@agk-dp.fab.redhat.com>
In-Reply-To: <20110713161141.GX7857@agk-dp.fab.redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Inconsistent naming...?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

>
>Oh - you've just reminded me:
>  dmsetup splitname
>
>Alasdair
>

That works, but it's not exactly convenient.

[root@system ~]# dmsetup splitname /dev/mapper/tempvg-lvspare1
VG                 LV       LVLayer
/dev/mapper/tempvg lvspare1        

If /dev/tempvg/lvspare1 is the optimal naming scheme, cut or awk is needed to recreate the name from that output.  How about a 'dmsetup canonical' that takes <device> and provides /dev/<vg>/<lv>?

-- Jess
