From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm 1.03 on redhat 7.3
Message-ID: <20020529061538.GB25290@colombina.comedia.it>
References: <3CF3DA1A.1612.6FD9111@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CF3DA1A.1612.6FD9111@localhost>
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
Date: Wed May 29 01:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, May 28, 2002 at 07:27:22PM -0400, James B. Byrne  wrote:
> I am trying to mount a root fs using lvm on redhat 7.3 using the 
> howto guide provided by sistina.com.  I am getting this message:

isn't this covered in the redhat manual?
well redhat provided lvm and mkinitrd tool do support it

i suppose you are running from a root on a partitioned disc
and you copied everything to your lvm root which is at
the moment mounted under /mnt/lvm
and that you have fixed the /etc/fstab under the new lvm root
to reflect the new setup: ie you have sth like
/dev/vg00/lvol3 / ext3 defaults 0 1

now run:
mkinitrd -v --fstab=/mnt/lvm/etc/fstab /boot/initrd_lvm `uname -r`
and use the newly created initrd to boot your system.


L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
