Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k34JlClM007894
	for <linux-lvm@redhat.com>; Tue, 4 Apr 2006 15:47:12 -0400
Received: from hotmail.com (bay102-f8.bay102.hotmail.com [64.4.61.18])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k34Jl8gH019103
	for <linux-lvm@redhat.com>; Tue, 4 Apr 2006 15:47:08 -0400
Message-ID: <BAY102-F8BC0F278803728236BD67EFCA0@phx.gbl>
In-Reply-To: <20060404123532.GD21526@dragonhold.org>
From: "Christopher Probst" <probst_christopher@hotmail.com>
Date: Tue, 04 Apr 2006 18:58:27 +0000
Mime-Version: 1.0
Subject: [linux-lvm] pvmove on a root partition
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello LVMers

Doing a pvmove

pvmove /dev/hdb1 /dev/hdb2 where /dev/hdb1 is mounted on "/"

makes my system unuseable. I can't log into my machine even in a text 
console. Has anybody tried this before?

Christo
