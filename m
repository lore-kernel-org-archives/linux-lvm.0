Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lB43VBIC027317
	for <linux-lvm@redhat.com>; Mon, 3 Dec 2007 22:31:11 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IzOV5-0008Q6-8r
	for linux-lvm@redhat.com; Tue, 04 Dec 2007 03:31:11 +0000
Date: Tue, 4 Dec 2007 03:31:11 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm amnesia (Incorrect metadata area header checksum)
Message-ID: <20071204033111.GO22843@agk.fab.redhat.com>
References: <20071203190203.51068ac31da99c5a25b4d9fb7ad88fd1.61b74e1b4b.wbe@email.secureserver.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20071203190203.51068ac31da99c5a25b4d9fb7ad88fd1.61b74e1b4b.wbe@email.secureserver.net>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Dec 03, 2007 at 07:02:03PM -0700, Dave Scott wrote:
> I have the archive file and the data. How do I get the lvm to see it
> once again?

add a 'vgcfgrestore' after the pvcreate
 
Alasdair
-- 
agk@redhat.com
