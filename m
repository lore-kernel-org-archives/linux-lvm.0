Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j02G1gr30107
	for <linux-lvm@redhat.com>; Sun, 2 Jan 2005 11:01:42 -0500
Received: from ratbert.donck.com (ratbert.donck.com [212.204.192.81])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j02G1aPj002208
	for <linux-lvm@redhat.com>; Sun, 2 Jan 2005 11:01:36 -0500
Date: Sun, 2 Jan 2005 17:01:34 +0100
From: Fred Donck <fred@donck.com>
Subject: Re: [linux-lvm] LVM2 strange behaviour
Message-ID: <20050102160134.GV326@dogbert>
References: <20050102121805.GT326@dogbert>
	<200501021430.15011.erik.wasser@iquer.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200501021430.15011.erik.wasser@iquer.net>
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


Erik Wasser <erik.wasser@iquer.net>
   wrote at Sun, Jan 02, 2005 at 02:30:14PM +0100:

> On Sunday 02 January 2005 13:18, Fred Donck wrote:
> 
> > $> lvm version
> >   LVM version:     2.00.08 (2003-11-14)
> >   Library version: 1.00.17-ioctl (2004-04-19)
> >   Driver version:  4.3.0
> > $>
> 
> Very funny, I made the same mistake like you. Please upgrade your LVM2 
> to the newest version. B-)

$> ACCEPT_KEYWORDS="~x86" emerge lvm2

<snip all compiles>

$> lvm version
  LVM version:     2.00.25 (2004-09-29)
  Library version: 1.00.17-ioctl (2004-04-19)
  Driver version:  4.3.0
$> 


> 
> Read the thread 'Very long startup times of the lv*-tools'[1][2] for 
> further details.
> 
> [1]https://www.redhat.com/archives/linux-lvm/2004-December/msg00124.html
> [2]https://www.redhat.com/archives/linux-lvm/2004-December/msg00126.html
> 
> -- 
> So long... Fuzz
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--- End of erik.wasser@iquer.net's quote ---

After reboot all looks wel.
vgscan doesnt segfault anymore

cheers,
-- 

Fred
