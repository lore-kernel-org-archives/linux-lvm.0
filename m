Date: Sun, 15 Aug 2004 21:54:00 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problem creating logical volumes
Message-ID: <20040815205400.GA6264@agk.surrey.redhat.com>
References: <200408142108.52705.stephen_nesbitt@alumni.mckenna.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200408142108.52705.stephen_nesbitt@alumni.mckenna.edu>
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
To: stephen_nesbitt@alumni.mckenna.edu
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Aug 14, 2004 at 09:08:52PM -0700, Stephen Nesbitt wrote:
> Configuration is Fedora Core 2. When trying to create a logical volume I get a 
> message of the form :
>   device-mapper ioctl cmd 9 failed: Invalid argument
>   Couldn't load device 'vg01-jukebox''.
>   Failed to activate new LV.
 
> I have seen a couple of posts asking for help regarding this problem
> but no solutions. Anyone?

I'd better improve that error message to suggest people look at the 
logs for more information:-)
 
The most common cause is people trying to use snapshots or mirrors (pvmove)
while running a kernel that doesn't support them: fix is to upgrade.
(Newer code already detects those cases and gives more specific messages.)

Alasdair
-- 
agk@redhat.com
