Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BLJMCn029935
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 22:19:22 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GBePa-0000es-1Q
	for linux-lvm@redhat.com; Fri, 11 Aug 2006 22:19:22 +0100
Date: Fri, 11 Aug 2006 22:19:22 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Archive Question
Message-ID: <20060811211922.GK18633@agk.surrey.redhat.com>
References: <44DCF352.3080605@cup.hp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44DCF352.3080605@cup.hp.com>
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

On Fri, Aug 11, 2006 at 02:14:58PM -0700, John DeFranco wrote:
> /etc/lvm/archive/.lvm_ny476.cup.hp.com_24035_984827937: rename to 
> /etc/lvm/archive/vgsb1_01871.vg failed: File exists
 
> I don't know is how this happens. I cannot find any documentation on 
> this message. Any pointers?

Exactly what version of LVM is this?
(And does the file exist?   Is /etc a local, writeable filesystem?)
 
Alasdair
-- 
agk@redhat.com
