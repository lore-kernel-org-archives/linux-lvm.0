Date: Mon, 08 Oct 2001 12:54:55 -0400
From: Chris Mason <mason@suse.com>
Message-ID: <4650000.1002560095@tiny>
In-Reply-To: <20011008155346.A741C76E3B@oscar.casa.dyndns.org>
References: <20011003230330.508E91104F@oscar.casa.dyndns.org>
 <20011008012906.D790A11069@oscar.casa.dyndns.org> <77260000.1002507094@tiny>
 <20011008155346.A741C76E3B@oscar.casa.dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Re: [OOPS] full snapshot (with test vfs locking patch for reiserfs
 snapshots in 11-pre)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Ed Tomlinson <tomlins@CAM.ORG>
Cc: linux-lvm@sistina.com


On Monday, October 08, 2001 11:53:46 AM -0400 Ed Tomlinson
<tomlins@CAM.ORG> wrote:

> Hi Chris,
> 
> To summerize, with 2.4.11-pre5 and lvm-1.01-rc4 + your test vfslocking
> patch  for 2.4.11-pre I, unlike you, was able to make snapshots and
> reiserfsck them without  problems.  Then I tried a debench 50 run and got
> an oops.

Confirmed, similar oops here.  Do you get this with rc4 in 2.4.10?

-chris
