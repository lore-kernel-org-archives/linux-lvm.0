Return-Path: <bluca@comedia.it>
Date: Thu, 14 Dec 2000 16:41:53 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] devfs
Message-ID: <20001214164152.A1886@colombina.comedia.it>
References: <0012132117412P.00826@lyta>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0012132117412P.00826@lyta>; from russell@coker.com.au on Wed, Dec 13, 2000 at 09:17:41PM +0100
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
To: Linux-LVM@sistina.com

On Wed, Dec 13, 2000 at 09:17:41PM +0100, Russell Coker wrote:
> It appears that devfs is not supported in LVM at this time (but I can't be 
> certain because I haven't got it going properly yet).  What are the plans for 
> devfs support?

this is not exact, there is some devfs support in lvm 0.9, or
0.8 in kernels >= 2.4.0-test8, but it does not work!!!

i had to patch the lvm tools so they don't remove the /dev/<vgname> directory

also from my brief testing it seems that devfs tries to create the
/dev/vg/group node when activating the vg (while this should be done
during vgscan), but does not create the lv defice files.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
