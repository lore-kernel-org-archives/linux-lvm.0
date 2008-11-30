Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAUIJwY4028649
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 13:19:58 -0500
Received: from mail.nosys.net (mail.nosys.net [62.93.171.218])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAUIJhw3000702
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 13:19:44 -0500
Date: Sun, 30 Nov 2008 19:19:42 +0100
From: "J. Javier Maestro" <jjmaestro@ieee.org>
Subject: Re: [linux-lvm] LVM snapshots overflow due to initial "overhead"?
Message-ID: <20081130181942.GA11789@2jotas.com>
References: <20081130160648.GA11393@2jotas.com>
	<20081130163733.GH13235@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20081130163733.GH13235@agk.fab.redhat.com>
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

On Nov Sun 30 2008 16:37, Alasdair G Kergon wrote:
> On Sun, Nov 30, 2008 at 05:06:48PM +0100, J. Javier Maestro wrote:
> > http://www.tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html
> >     **If the snapshot size equals the origin size, it will never overflow.**
> 
> That's simply inaccurate and should be corrected.

I agree with you, but it would be much more interesting to see why it is
incorrect. I mean, as I mentioned in my email, why are those chunks used
upfront?  By doing that, the whole nice idea of a snapshot breaks completely.
It would be much, much better to account for that and move those chunks out
of the snapshot.

-- 
 .''`.  
: :'  :   J. Javier Maestro
`. `'`   <jjmaestro@ieee.org>
  `-
