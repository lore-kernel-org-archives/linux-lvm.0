Return-Path: <sa@hogia.net>
Date: Tue, 7 Aug 2001 15:31:54 +0200
From: Sebastian Andersson <sa@hogia.net>
Message-ID: <20010807153154.P495@hogia.net>
Mime-Version: 1.0
Subject: [linux-lvm] Two computers with one shared array?
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

I've got two computers connected to a JBOD array.
On it I've got 3 VGs and a bunch of free disks.
I'd like to use 2 of the VGs on one of the computers and the
other VG on the other computer.

Should I still vgscan on both computers at startup and then
vgchange -a y VG1 VG2 on the first computer and
vgchange -a y VG3 on the other computer?

Is it safe to vgchange -a n  on both computers or should
I only vgchange -a n VGx ?

Can I change the LVGs in a VG or do I need to inactivate everything on
the other computer while I do this and then vgscan after I'm done?

Regards,
/Sebastian
-- 
                             .oooO o,o Oooo.           Sex,
                             (   ) \_/ (   )      (o_   Drugs
"Life is not fair, but root   \ (  /|\  ) / (o_   //\    and
password helps!" -- The BOFH   \_)     (_/  (/)_  V_/_    UNIX.
