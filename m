Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m14AaQ4v015805
	for <linux-lvm@redhat.com>; Mon, 4 Feb 2008 05:36:26 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JLygc-0006Dd-CE
	for linux-lvm@redhat.com; Mon, 04 Feb 2008 10:36:26 +0000
Date: Mon, 4 Feb 2008 10:36:26 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Incorrect metadata area header checksum
Message-ID: <20080204103626.GE8075@agk.fab.redhat.com>
References: <1202005131.5857.18.camel@localhost.localdomain>
	<47A53FC6.2040007@gmail.com>
	<20080203122106.GD8075@agk.fab.redhat.com>
	<1202062464.14540.27.camel@localhost.localdomain>
	<20080204030648.GA24285@old.davidb.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080204030648.GA24285@old.davidb.org>
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

On Sun, Feb 03, 2008 at 07:06:48PM -0800, David Brown wrote:
> You'll probably find that there is a lvm2 label there.  I'm not sure of a
> safe way of elminiating it.
 
man pvremove

And you really should upgrade lvm2 - that's a 2-year old version with numerous
known bugs in it.

Alasdair
-- 
agk@redhat.com
