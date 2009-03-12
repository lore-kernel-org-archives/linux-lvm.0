Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2CHltfO021137
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 13:47:55 -0400
Received: from exprod5og113.obsmtp.com (exprod5og113.obsmtp.com [64.18.0.26])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2CHl55d010363
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 13:47:11 -0400
Received: from kipc2.localdomain (unknown [3.249.4.68])
	by mail-rly-prd-01.am.health.ge.com (Postfix) with ESMTP id 6A9C93723
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 17:45:18 +0000 (GMT)
Date: Thu, 12 Mar 2009 18:46:59 +0100
From: Karl Kiniger <karl.kiniger@med.ge.com>
Message-ID: <20090312174659.GA11057@kipc2.localdomain>
References: <20090312151238.GA5816@kipc2.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20090312151238.GA5816@kipc2.localdomain>
Subject: [linux-lvm] Re: changing protection of lvm2 snapshot origin
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

> * lvcreate -m test_lv -L 4G some_vg
that should read -n test_lv
> 
> * fill test_lv with a qemu disk image
> 
> * lvchange -p r some_vg/test_lv  --- I want to make sure that nobody
>                                      will ever modify the (future) origin
>                                      unintentionally.
> * lvcreate -s -m test_lv_snap -L 1G some_vg/test_lv
and this too. grrr copy&paste

Karl

-- 
D.I. Karl Kiniger     mailto:karl.kiniger@med.ge.com
Tel: (++43) 7682-3800-710  Voip(GE): 1662 710
Fax: (++43) 7682-3800-47 C: +43 6991 3800 710
-
GE Medical Systems Kretztechnik GmbH & Co OHG - Tiefenbach 15 – A-4871 Zipf
Landesgericht Wels FN 222387s – UID (VAT-ID): ATU54086108 - DVR: 2111103 – ARA: 12816
Persönlich haftende Gesellschafterin: GE Medical Systems Kretztechnik GmbH
Tiefenbach 15 – A-4871 Zipf  - Landesgericht Wels FN 218689b
