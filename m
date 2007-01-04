Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l04EtYi4008753
	for <linux-lvm@redhat.com>; Thu, 4 Jan 2007 14:55:34 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1H2U0E-0006L1-Af
	for linux-lvm@redhat.com; Thu, 04 Jan 2007 14:55:34 +0000
Date: Thu, 4 Jan 2007 14:55:34 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Persistent minor number problem in lvm2
Message-ID: <20070104145534.GM21980@agk.surrey.redhat.com>
References: <200701041524.50995.krienke@uni-koblenz.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200701041524.50995.krienke@uni-koblenz.de>
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

On Thu, Jan 04, 2007 at 03:24:47PM +0100, Rainer Krienke wrote:
> So I guess that this bug should have been fixed. Can anyone tell me if this is 
> true, so that minor numbers are really persisent and what version of lvm I 
> need to get this persistence to work correctly?
 
See http://sources.redhat.com/cgi-bin/cvsweb.cgi/~checkout~/LVM2/WHATS_NEW?content-type=text/plain&cvsroot=lvm2&only_with_tag=HEAD

  Version 2.02.07 - 17th July 2006
  ================================
    Don't ignore persistent minor numbers when activating.

Alasdair
-- 
agk@redhat.com
