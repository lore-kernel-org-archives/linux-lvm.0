Message-ID: <20021212162759.36500.qmail@web40710.mail.yahoo.com>
From: udo <udovdh@yahoo.com>
Subject: Re: [linux-lvm] vgcreate on md: vgcreate -- ERROR "pv_read(): read" reading physical volumes
In-Reply-To: <200212120801.48777.defranco@cup.hp.com>
MIME-Version: 1.0
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
Date: Thu Dec 12 10:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: defranco@cup.hp.com
Cc: linux-lvm@sistina.com

Hello,

--- John DeFranco <defranco@cup.hp.com> wrote:
> Did you pvcreate the /dev/md2 first? Didn't indicate
> that below.

I didn't write that but I did, following the howto
from http://tldp.org/HOWTO/LVM-HOWTO.
I couldn't solve the problem so I started a wipe of
/dev/md2 to be sure the disk was clear. (this took
quite some time on this slow machine)
I had to wait for that to finish so I could reboot to
single user (init=/bin/sh) again.
Then things worked!
Pfew...... ;-)

Thanks,
Udo

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
