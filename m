From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM Boot = /sbin/modprobe: error while loading
    shared libraries: libzso.1
Message-Id: <20011227084538.A24890@colombina.comedia.it>
References: <000201c18e66$847edec0$0b00a8c0@homelan.org>
    <000401c18e76$2917df40$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000401c18e76$2917df40$0b00a8c0@homelan.org>; from
    ben@bens-house.org.uk on Thu, Dec 27, 2001 at 01:31:08AM -0000
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
Date: Thu Dec 27 01:43:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 27, 2001 at 01:31:08AM -0000, Ben Holness wrote:
> I should also mention that I ran lvmcreate_initrd with the -D option, but
> that didn't help.
please try 
mkinitrd -v -f /boot/initrd `uname -r`
instead of lvmcreate_initrd and tell me if it works

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
