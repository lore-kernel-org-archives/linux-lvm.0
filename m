Subject: Re: re[2]: [linux-lvm] [Q] LVM snapshot volume extendable?
Mime-Version: 1.0 (Apple Message framework v551)
From: "Dale J. Stephenson" <dalestephenson@mac.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <002701c2bdb8$6cf51b70$c600a8c0@COMPAQ>
Message-Id: <F0EF28DE-29AD-11D7-A9B9-0003937830E4@mac.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Jan 16 17:54:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

On Thursday, January 16, 2003, at 06:38  PM, Sean Oh wrote:

> What I found out testing with a few FS available for Linux is that 
> only the
> snapshot for ext2 is extendable. I and extend ext2 snapshots with 
> 'lvextend'
> command and it keep staying mountable.
>
> Snapshots for LV on Reiserfs, XFS and even ext3 are not
> extendable(mountable).
>
> Very strange, since LVM snapshot does not hold FS. Am I right?
>
At the FS layer, it should appear to be the same size as before (the 
size of the original).  I've had no trouble at all reducing or 
extending XFS snapshot volumes while they were mounted, but I don't 
think I've tried it unmounted.

Dale J. Stephenson
dalestephenson@mac.com
