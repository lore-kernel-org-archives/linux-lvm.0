From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM Boot = /sbin/modprobe: error while loading
    shared libraries: libzso.1
Message-Id: <20011228011524.C27880@colombina.comedia.it>
References: <20011227084538.A24890@colombina.comedia.it>
    <000001c18f0d$32835860$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000001c18f0d$32835860$0b00a8c0@homelan.org>; from
    ben@bens-house.org.uk on Thu, Dec 27, 2001 at 07:32:17PM -0000
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
Date: Thu Dec 27 18:13:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 27, 2001 at 07:32:17PM -0000, Ben Holness wrote:
> I also had a look at the man page for initrd and noticed that there is
> a --fstab option, which I might need to use, as my current setup is as
> follows:

yes, sorry, i should have mentioned it
.....
> Configuring LVM
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> vgchange -- no volume groups found
> 
ugh,
try modifying /sbin/mkinitrd 

where it says

if [ -n "$lvmroot" ]; then
	INITRDFILES="/sbin/vgchange /sbin/vgscan"
	cp -aL /sbin/vgchange $MNTIMAGE/sbin
	cp -aL /sbin/vgscan $MNTIMAGE/sbin
fi

change to

if [ -n "$lvmroot" ]; then
	INITRDFILES="/sbin/vgchange /sbin/vgscan /sbin/lvmdiskscan"
	cp -aL /sbin/vgchange $MNTIMAGE/sbin
	cp -aL /sbin/vgscan $MNTIMAGE/sbin
	cp -aL /sbin/lvmdiskscan $MNTIMAGE/sbin
fi

and where is:

if [ -n "$lvmroot" ]; then
    echo "echo Configuring LVM" >> $RCFILE
    echo "/sbin/vgscan" >> $RCFILE
    echo "/sbin/vgchange -a y" >> $RCFILE
    IMAGESIZE=$[IMAGESIZE + 4096]
fi

change to:

if [ -n "$lvmroot" ]; then
    echo "echo Configuring LVM" >> $RCFILE
    echo "/sbin/lvmdiskscan" >> $RCFILE
    echo "/sbin/vgscan" >> $RCFILE
    echo "/sbin/vgchange -a y" >> $RCFILE
    IMAGESIZE=$[IMAGESIZE + 4096]
fi

then we compare output of lvmdiskscan run on your system

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
