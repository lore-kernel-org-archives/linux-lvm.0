From: Harald Milz <hm@seneca.muc.de>
Subject: Re: [linux-lvm] lvcreate_initrd & redhat 6.1
Date: 16 Nov 1999 00:38:34 GMT
Message-ID: <80q92a$38h$1@seneca.muc.de>
References: <8525682A.0078290B.00@fund-dc2.txfund.com>
Reply-To: h.milz@seneca.muc.de
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Jonathan S. Polacheck <JPolache@txfund.com> wrote:

> lvmcreate_initrd -- making ram filesystem
> lvmcreate_initrd -- ERROR making ram disk filesystem

No (init) ramdisk support in your kernel. 

> Also, any suggestions as to where to put the "vgscan" and "vgchange -a y"
> on this system.  It uses the "Sys V" rc.d setup (no /sbin/init.d/boot
> file).

Into /sbin on the initrd. The script does it for you nicely. 

-- 
Reporter (to Mahatma Gandhi): Mr Gandhi, what do you think of Western
	Civilization?
Gandhi:	I think it would be a good idea.
