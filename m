Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3608hZF030701
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:08:43 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3608dMR014186
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:08:40 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p3608cC2004033
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:08:38 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p3608cdW020889
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:08:38 -0400
Date: Tue, 5 Apr 2011 20:08:38 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D9BAD26.5010405@abpni.co.uk>
Message-ID: <alpine.LRH.2.00.1104052007130.20818@bmsred.bmsi.com>
References: <4D64FF3C.6080602@abpni.co.uk> <4D656817.6060900@gmail.com>
	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>
	<4D6572C0.6070008@abpni.co.uk>
	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>
	<4D65A1A9.1040205@abpni.co.uk>
	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>
	<4D65A839.50107@abpni.co.uk> <4D65A8F5.8040606@abpni.co.uk>
	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>
	<4D6609E4.10800@abpni.co.uk>
	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>
	<4D6671D7.7020301@abpni.co.uk>
	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>
	<4D667743.3010102@abpni.co.uk> <4D9B7715.7090509@abpni.co.uk>
	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>
	<4D9B8015.2060503@abpni.co.uk> <4D9B82C5.3020704@ankh.org>
	<4D9B8B5A.2070104@abpni.co.uk> <4D9B9AB9.8070202@ankh.org>
	<4D9B9D48.5010008@abpni.c! o.uk> <4D9BA196.20006@ankh.org>
	<4D9BA39A.8020008@abpni.co.uk> <4D9BA845.10607@an! kh.org>
	<4D9BAD26.5010405@abpni.co.uk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshots and disk re-use
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 6 Apr 2011, Jonathan Tripathy wrote:

> lvcreate -nNewCustomerLV -L20G vg0
>
> where vg0 is /dev/vg0
> and vg0 is a volume group which uses an entire physical partition (Which I 
> guess is called a PV).
>
> Now, if I were to create my snapshots on a seperate vg, eg:

You can't do that.  Snapshots must be on the same VG.  James is suggesting you
create them on the same VG, but a different PV reserved for backup snapshots.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
