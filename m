From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] LVM Redhat 7.2 : Volume Group not activated on boot
Message-Id: <20020211210448.B26850@kluge.net>
References: <3C686693.2060007@miracleas.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C686693.2060007@miracleas.dk>; from peter.gram@miracleas.dk
    on Tue, Feb 12, 2002 at 01:49:23AM +0100
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
Date: Mon Feb 11 19:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 12, 2002 at 01:49:23AM +0100, Peter Gram wrote:
> # LVM initialization
> if [ -e /proc/lvm -a -x /sbin/vgchange -a -f /etc/lvmtab ]; then
>         action $"Setting up Logical Volume Management:" /sbin/vgscan && 
> /sbin/vgchange -a y
> fi

The problem is the first part of the if statement.  /proc/lvm doesn't exist
unless the lvm-mod module is loaded, and that doesn't happen by default.

On my RH7.2 box, I make initrd's with the "--with=lvm-mod" option so that
initrd forcably loads lvm-mod at bootup.  /proc/lvm then exists, and the
vgchange command is executed.  :)

-- 
Randomly Generated Tagline:
"We all know engineers are way better than doctors because doctors can
 only kill people one at a time while engineers can send 600 to a 1000
 people screaming into Mt. Rushmore at 300 to 400 knots." - Unknown
