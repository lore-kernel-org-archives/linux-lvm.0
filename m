Message-ID: <20011113030010.62924.qmail@web13605.mail.yahoo.com>
From: Todd Roy <todd_m_roy@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] 1.0.1rc4 tools don't like me!
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
Date: Mon Nov 12 20:58:03 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Well, with lvm in the kernel at 1.0.1rc4(ish), I
decided that it might be nice to actually update
my tools from 1.0 to 1.0.1rc4.  So I did...

On the next reboot
vgchange -a y in rc.d/rc.S couldn't find my volume
group.

Manually, once I logged in as root, vgchange -a y and
mount -a
voila... everything just fine...

I shrugged, did another vgscan and rebooted.  Same
problem.  I reverted to 1.0 tools, all is well and I'm
breathing easier.

The only thing I know is that I did upgrade my
pvversion -2 some time ago...

Oh yeah, in the latest stuff in cvs (hoping that would
bail me out) pv_move.c is badly broken (doesn't
compile).

Thanks,

-- todd --


__________________________________________________
Do You Yahoo!?
Find the one for you at Yahoo! Personals
http://personals.yahoo.com
