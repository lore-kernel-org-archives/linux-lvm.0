Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k0PEZnRq009939
	for <linux-lvm@redhat.com>; Wed, 25 Jan 2006 14:35:49 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1F1lkT-0003gH-ON
	for linux-lvm@redhat.com; Wed, 25 Jan 2006 14:35:49 +0000
Date: Wed, 25 Jan 2006 14:35:49 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] file descriptor 3 left open
Message-ID: <20060125143549.GU4280@agk.surrey.redhat.com>
References: <CF88E297901EB040B49935FE71B99A2D01F4A1F7@CTTRBEXVS01.oxhp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CF88E297901EB040B49935FE71B99A2D01F4A1F7@CTTRBEXVS01.oxhp.com>
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

On Wed, Jan 25, 2006 at 09:33:35AM -0500, Kapadia, Nayan U. wrote:
> How do I fix this bug in nash ? 
 
Upgrade your mkinitrd package and rebuild your initrd.

Alasdair
-- 
agk@redhat.com
