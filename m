Return-Path: <claudio@conectiva.com>
Date: Sat, 23 Dec 2000 16:46:52 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] 0.9 tools compatible with 0.8 kernel? (and vice
 versa)
In-Reply-To: <Pine.LNX.4.30.0012231751490.5052-100000@fogarty.jakma.org>
Message-ID: <Pine.LNX.4.21.0012231630430.649-100000@scuzzlebutt.helllabs>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, 23 Dec 2000, Paul Jakma wrote:

> on-disk LVM isn't touched though, right? so it's just a tools issue,
> right? ie, booting lvm 0.9 isn't going to leave me with on-disk
> structures that 0.8 would barf on?

It's tools + kernel, but the files in /etc/lvmtab.d are different
(so make sure you're doing a vgscan after the root filesystem is
mounted read-write).

> > rpm http://distro.conectiva.com.br/experimental/
> 
> excellent. thanks!


LVM initialization is tricky -- just calling lvmiopversion to load
lvm-mod with IOP 10 (lvm 0.9) didn't work in all machines I tried :\
An explicit insmod may be necessary. Something is being delayed in
the module initialization, it would be nice to fix this as well in
future versions.

Also to avoid a "failed" status (in RH-style initscripts) when you have
the tools installed but no VGs configured, you may need to do something
like

# Set up LVM
# Warning: this requires lvm-base >= 1.0-4cl

activate_lvm() {
    lvm_msg="Activating logical volumes (LVM IOP $1): "
    (/sbin/vgscan; /sbin/vgchange -a y) >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        action "$lvm_msg" true
    else
        action "$lvm_msg" false
    fi
}   

if [ -x /sbin/lvmiopversion ]; then
    insmod -q lvm-mod >/dev/null
    iopver=`/sbin/lvmiopversion`
    if [ $iopver -gt 0 -a $iopver -lt 10 ]; then
        grep -q VG /proc/lvm && activate_lvm $iopver
    else
        grep -q VG /proc/lvm/global && activate_lvm $iopver
    fi
fi

just after the root fs is mounted read-write. I still prefer debian-style
initialization, but if you're using RH/Mandrake/Conectiva you'll probably
have to put that in rc.sysinit.


claudio
