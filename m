Subject: Re: [linux-lvm] JFS or XFS
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20040116002242.47690445@souldaemon>
References: <20040116002242.47690445@souldaemon>
Content-Transfer-Encoding: 7bit
Message-Id: <1074209572.2152.74.camel@localhost.localdomain>
Mime-Version: 1.0
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
Date: Thu Jan 15 18:33:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2004-01-15 at 17:22, neuron wrote:
> reiserfs, guaranteed personally.  Especially on a mail server.
> I've used jfs, I crashed it twice on purpose (network swap, then
> disable network card), both times jfs failed to boot.  (this is
> because it trusts it's own journal, which a lot of people love about
> it, both times for me it was wrong..)
> 
> Personally I haven't had any problems with XFS though, but I haven't
> used it that much.
> 

As a note, any journaling FS that uses metadata for updates will have
issues with server AbEnds where there is data in-flux. The
meta-log(journal) will be in some state of flux and depending on the
timing of the AbEnd, then you can be in trouble. The recent XFS code
finally fixes a lot of issues about this with a meta journal update
daemon and set of sysctls that are configurable. Also, another way to
ensure your journal is safe, both with JFS, XFS, ext3 in full logging
mode, is to put your journal on a separate device that may not be
affected by the AbEnd. I can reveal more, but am short on time. I would
personally ask each list of the FS your interested in after you've read
about each.

It should be noted as well that each journaling FS has it's own issues
which are application dependent. i.e. works better in some cases than
others based on usage patterns, file types, etc.
-- 
Austin Gonyou <austin@coremetrics.com>
Coremetrics, Inc.
