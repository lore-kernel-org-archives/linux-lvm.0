Date: Mon, 24 Sep 2001 08:57:35 -0500
From: Mark Bainter <mark-lvm@cymry.org>
Message-ID: <20010924085734.Y2634@firinn.org>
Mime-Version: 1.0
Subject: [linux-lvm] Fix for 2.4.10 compile problem
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Looking at the patch it seems they changed the min definition to
not have a type argument, and created a new macro called min_t
that takes a type argument.  Changing the two instances of 
min() to min_t() allowed 2.4.10 to compile fine on my machine.

Dunno if this is the right answer, or if the type argument isn't
really needed and can be deleted from those two instances, but I
do know it compiles. ;-)
