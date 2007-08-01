Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l71A37pf021773
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 06:03:07 -0400
Received: from smtp01.cdmon.com (smtp01.cdmon.com [212.36.74.230])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l71A35Gj012290
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 06:03:06 -0400
Received: from [192.168.0.174] (62.Red-217-126-43.staticIP.rima-tde.net
	[217.126.43.62])
	by smtp01.cdmon.com (Postfix) with ESMTP id BBA28F7722
	for <linux-lvm@redhat.com>; Wed,  1 Aug 2007 12:03:02 +0200 (CEST)
Message-ID: <46B05A7E.7020001@cdmon.com>
Date: Wed, 01 Aug 2007 12:03:42 +0200
From: Jordi Moles <jordi@cdmon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] mounting a lvm volume from an external machine?
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
To: linux-lvm@redhat.com

hi.

i've been googleing for days with no luck about this issue.

i've got some machines which i perform a daily backup from.
some of these machines have lvm volumes with one or more partitions.
is there any way i can mount those virtual partitions from the machines 
that performs the daily backup?

thank you.
