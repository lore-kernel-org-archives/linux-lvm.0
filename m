From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] Keep snapshots active for 24 hours?
Message-ID: <20011216202511.D26924@tiger.bigcats.invalid>
References: <20011214113804.I940@lynx.no> <NBBBKLKHMJHIJLHOGAOJKELIJCAA.steve.wray@the.net.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJKELIJCAA.steve.wray@the.net.nz>; from steve.wray@the.net.nz on Sat, Dec 15, 2001 at 10:52:17AM +1300
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
Date: Sun Dec 16 13:36:05 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Steve!

Steve Wray (steve.wray@the.net.nz) wrote 70 lines:

> - take a snapshot, install something or try something out
> that might break something, then restore *directly* from
> the snapshot if anything goes wrong; without having to actually
> back it up to media and restore it.

Even better would be writable snapshots for that: 
- make a snapshot of (everything where the install writes to
- install the program
- test it on the snapshot
- junk the snapshot if the install is bad

and, of course, you might want to migrate changes from the
snapshot to the original FS (or vice versa).  That however
is a second feature.  Until then you'd have to do the install
all over again -- once we actually get writable shnapshots.

-Wolfgang
