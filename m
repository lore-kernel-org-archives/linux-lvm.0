Date: Tue, 16 Nov 1999 10:23:14 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvcreate_initrd & redhat 6.1
Message-ID: <19991116102313.A24250@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <8525682A.0078290B.00@fund-dc2.txfund.com>
Mime-Version: 1.0
In-Reply-To: <8525682A.0078290B.00@fund-dc2.txfund.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Mon, Nov 15, 1999 at 04:53:07PM -0600, Jonathan S. Polacheck wrote:
> Also, any suggestions as to where to put the "vgscan" and "vgchange -a y"
> on this system.  It uses the "Sys V" rc.d setup (no /sbin/init.d/boot
> file).
/etc/rc.d/rc.sysinit

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
