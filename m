From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Problems with initrd for LVM2 on 2.6.0-test8 and -test9 kernels.. .
Message-ID: <20031030134909.GB1163@percy.comedia.it>
References: <253458D17524064C996F67C97116BF88065927@Oscar-5.north.mcld.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <253458D17524064C996F67C97116BF88065927@Oscar-5.north.mcld.net>
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
Date: Thu Oct 30 07:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Weber, Geoffrey M." <Geoffrey.Weber@mcleodusa.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Wed, Oct 29, 2003 at 09:26:14AM -0600, Weber, Geoffrey M. wrote:
>   library).    As   soon  as  I  try  to  use  LILO  or  GRUB  with  the
>   "root=/dev/vg00/root" or "root=3f00" (device major and minor numbers),
>   my  machine  hangs  after  "Uncompressing  Linux...  Ok,  booting  the
>   kernel.".
could you give us some more details about your setup, including actual
lines from your configuration.

>   I  have  also tried (unsuccessfully) to use an initrd image I found on
>   the 'net at [1]http://www.comedia.it/~bluca/cooker/lvm2/

There is no initrd image at that location.
What you find there is modified Mandrake rpm to support lvm2 in Mandrake
Linux 9.2/cooker, and has not been tested with anything different than
that.

>   to  see  what  I  could find out. When trying to use the Busybox "ash"
>   command  inside  the  modified evms initrd image, however, the machine
>   doesn't halt and give me a shell at all but keeps booting.
i saw this problem as well, i don't know if it is caused by some device
file missing in the initrd image or what.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
