Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kASKxo8v021640
	for <linux-lvm@redhat.com>; Tue, 28 Nov 2006 15:59:50 -0500
Received: from smtp.cdf.toronto.edu (smtp.cdf.toronto.edu [128.100.31.106])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	kASKxkXk026424
	for <linux-lvm@redhat.com>; Tue, 28 Nov 2006 15:59:47 -0500
Date: Tue, 28 Nov 2006 15:59:40 -0500 (EST)
From: Andrew Park <apark@cdf.toronto.edu>
Message-ID: <Pine.LNX.4.62.0611281555070.13406@skywolf.cdf.toronto.edu>
MIME-Version: 1.0
Subject: [linux-lvm] RAID5 expansion
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

I have ServeRAID 6m card which had 5 drive set. I had that expanded to 8
drive set and now that it had finished migration I wish to make OS make
use of the expanded storage.  Now the question... how?

I am using LVM2 so I thought simply running pvresize /dev/sda would do
the trick but it is doing absolutely nothing.  It stil reports back the
old RAID size.  I am running RHAS4 + update3.

So I thought perhaps fdisk may help but I don't want to risk losing my
data since this is now into 2 TB range.  So can you please advise as to
how to go about doing this?  I really need to make this happen soon
because there will be an immediate demand for the space.

Any help would be appreciated.

Thanks

p.s. : please cc me on the reply since I am not on the list

Andrew Park

________________________________________________________________________
  GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt
________________________________________________________________________
