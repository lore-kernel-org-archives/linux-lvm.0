From: Ed Tomlinson <tomlins@CAM.ORG>
Date: Mon, 8 Oct 2001 13:05:48 -0400
References: <20011003230330.508E91104F@oscar.casa.dyndns.org> <20011008155346.A741C76E3B@oscar.casa.dyndns.org> <4650000.1002560095@tiny>
In-Reply-To: <4650000.1002560095@tiny>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011008170549.3B15E76467@oscar.casa.dyndns.org>
Subject: [linux-lvm] Re: [OOPS] full snapshot (with test vfs locking patch for reiserfs snapshots in 11-pre)
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
To: Chris Mason <mason@suse.com>
Cc: linux-lvm@sistina.com

On October 8, 2001 12:54 pm, Chris Mason wrote:
> On Monday, October 08, 2001 11:53:46 AM -0400 Ed Tomlinson
>
> <tomlins@CAM.ORG> wrote:
> > Hi Chris,
> >
> > To summerize, with 2.4.11-pre5 and lvm-1.01-rc4 + your test vfslocking
> > patch  for 2.4.11-pre I, unlike you, was able to make snapshots and
> > reiserfsck them without  problems.  Then I tried a debench 50 run and got
> > an oops.
>
> Confirmed, similar oops here.  Do you get this with rc4 in 2.4.10?

Funny you should ask...  Guess what was runing when this email arrived?  The 
answer is that with 2.4.10 + lvm 1.01-rc4 the snapshot deactivates correctly - 
I do not see an oops.

Ed Tomlinson
