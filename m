Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0TDSdTd010281
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 08:28:39 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0TDSOV4019338
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 08:28:24 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o0TDSNnZ003088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 08:28:23 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o0TDSNow027118
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 08:28:23 -0500
Date: Fri, 29 Jan 2010 08:28:22 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20100128211720.GA23619@us.ibm.com>
Message-ID: <Pine.LNX.4.64.1001290822570.27080@bmsred.bmsi.com>
References: <824411.76784.qm@web87113.mail.ird.yahoo.com>
	<20100128211720.GA23619@us.ibm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] alternative to pvmove on root volume
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 28 Jan 2010, malahal@us.ibm.com wrote:

> > given that pvmove also works by mirroring I'm not convinced I haven't
> > just been lucky so far .  So does anyone have any ideas or even better
> > experiance on whether this is likely to work or am I setting myself up
> > for a world of pain if I try it on a live server?
> 
> Yes, pvmove works very similar. It will create a mirror for each segment
> one at a time, so it may have to create lot more mirrors depending on
> your configuration. If it ends up needing more 'lvconverts' (suspends),
> then the probability of failure (deadlock) will increase.

It seems to me, that if disk space is available, pvmove could minimize
metadata updates by mirroring as many LEs as possible at once.  This
would reduce to the equivalent of mirroring then reducing the entire LE
when space is available.  What happens in case of memory log and crash,
however?  Does it still remember which mirror is the "original"?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
