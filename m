Subject: Re: [linux-lvm] LVM2 and /proc support?
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <001001c378de$b4bd17f0$3300a8c0@home.dom>
References: <001001c378de$b4bd17f0$3300a8c0@home.dom>
Message-Id: <1063374423.8147.0.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Fri Sep 12 09:15:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Sean Oh <oh@storageone.co.kr>
Cc: linux-lvm@sistina.com

Am Fr, 2003-09-12 um 05.34 schrieb Sean Oh:

> It seems like LVM2 does not support /proc FS. In LVM1, there was
> /proc/lvm/ files containing LVM informations. My script files used to
> use that /proc FS, instead of directly issuing LVM commands, for the
> speed.
>  
> No support for /proc in LVM2?

LVM2 is userspace only, so... no /proc support there.

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html
