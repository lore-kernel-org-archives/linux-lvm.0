Message-ID: <20021129090605.GA1842@reti>
Mime-Version: 1.0
Content-Disposition: inline
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] 2.5.50-dm-2
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
Date: Fri Nov 29 03:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, lvm-devel@sistina.com

http://people.sistina.com/~thornber/patches/2.5-stable/2.5.50/2.5.50-dm-2.tar.bz2

Revision 6:
  minor change for dm-strip.c. Tests for correct chunksize before it allocates
  the stripe context. [Heinz Mauelshagen]

Revision 7:
  There's a bug in the dm-stripe.c constructor failing top check if enough
  destinations are handed in. [Heinz Mauelshagen]
