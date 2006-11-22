Received: from eriador.mornfall.net (vpn-4-26.str.redhat.com [10.32.4.26])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAMFNg6Z021729
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 10:23:42 -0500
Date: Wed, 22 Nov 2006 16:23:38 +0100
From: Peter Rockai <prockai@redhat.com>
Subject: Re: [linux-lvm] LVM2 snapshot contents on a reboot
Message-ID: <20061122152336.GA7459@mornfall.net>
References: <9cf248670611220621s4899578btf40320037c620473@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cf248670611220621s4899578btf40320037c620473@mail.gmail.com>
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
To: linux-lvm@redhat.com

On Wed, Nov 22, 2006 at 07:51:33PM +0530, Vasan V S wrote:
[snip]
> For the creation of snapshot:
> 
> lvcreate -s -L <snap size> -n <snapshot Name> -p <R-W permission> <original
> volume>
> 
> For deleting the snapshot:
> 
> lvremove -f <snap shot node entry>
Why/when are you removing the snapshot?

> However, if the server (running Linux 2.6.15.4) is not rebooted, the
> snapshot contents are correctly shown even if there has been any changes on
> the source volume.
As expected.

> Should we do anything specific at the time of the server shutdown to ensure
> that the snapshot contents should not be getting synced with the source
> volume on start up?
No, you just create the snapshot once and leave it be, it'll stay
around until you lvremove it.

Yours, Peter.

-- 
Peter Rockai | me()mornfall!net | prockai()redhat!com
 http://blog.mornfall.net | http://web.mornfall.net

"In My Egotistical Opinion, most people's C programs should be
 indented six feet downward and covered with dirt."
     -- Blair P. Houghton on the subject of C program indentation
