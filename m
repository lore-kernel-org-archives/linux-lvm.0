Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i46DaXv26616
	for <linux-lvm@redhat.com>; Thu, 6 May 2004 09:36:33 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i46DaWS27854
	for linux-lvm@redhat.com; Thu, 6 May 2004 08:36:32 -0500
Date: Thu, 6 May 2004 08:36:32 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] infinite loop in /dev/discs
Message-ID: <20040506083632.D25972@homer.msp.redhat.com>
References: <409A2F2E.6030106@laPoste.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <409A2F2E.6030106@laPoste.net>;
	from Gabriel.de-Perthuis@laPoste.net on Thu, May 06, 2004 at
	02:27:26PM +0200
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

On Thu, May 06, 2004 at 02:27:26PM +0200, Gabriel de Perthuis wrote:
> When running any lvm command (even version), lvm runs into an infinite
> loop, looking for devices like /dev/discs/disc2/discs/disc2..., disc2
> being a symlink to its parent. 

Fixed in 2.00.09.

Alasdair
-- 
agk@redhat.com
