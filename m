From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] Problem with pvmove and linux 2.6.0-test8, lvm2
Message-ID: <20031026192841.GA29901@localhost>
References: <20031026170332.4e6679b2.benkstein@math.tu-dresden.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031026170332.4e6679b2.benkstein@math.tu-dresden.de>
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
Date: Sun Oct 26 13:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sunday, 26 October 2003, at 17:03:32 +0100,
Frank Benkstein wrote:

> I'm having some problems with a newly created volume group.
> I got 3 harddisks and I want to remove one of them so I just
> use pvmove like with lvm version 1.
> 
If I recall correctly, the "pvmove" feature is still not fully
implemented or functional on kernels 2.6.x. The people at Sistina are
working on it, and they have plans to release it "soon", but no date has
been announced so far.

Hope it helps.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.6.0-test8-mm1)
