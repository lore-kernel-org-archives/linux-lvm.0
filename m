Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i57GWZ030251
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 12:32:35 -0400
Received: from neuralscape.com (synapse.neuralscape.com [198.144.200.82])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i57GWSXn017512
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 12:32:29 -0400
Received: from shaeffer by neuralscape.com with local (Exim 4.12)
	id 1BXMza-0001MP-00
	for linux-lvm@redhat.com; Mon, 07 Jun 2004 09:28:58 -0700
Date: Mon, 7 Jun 2004 09:28:58 -0700
From: Karen Shaeffer <shaeffer@neuralscape.com>
Subject: Re: [linux-lvm] software raid or lvm?
Message-ID: <20040607162858.GA5220@synapse.neuralscape.com>
References: <40C48905.80608@blocked.name>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40C48905.80608@blocked.name>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jun 07, 2004 at 05:25:57PM +0200, philip wrote:
> hello all,
> 
> i've got mobo with nforce2 and siimage3112 chipset and two sata hd. i'd 

You can find Sil311x support in the 2.6.6 kernel. I've run it with the
Sil3114 controller.

Karen
-- 
 Karen Shaeffer
 Neuralscape, Palo Alto, Ca. 94306
 shaeffer@neuralscape.com  http://www.neuralscape.com
