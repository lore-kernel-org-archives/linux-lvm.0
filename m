Message-ID: <012201c2d81e$f79ac8d0$070414ac@pin>
From: "Christian Limpach" <chris@pin.lu>
References: <F162r1WkfXNEmY6vQ5L0001efc9@hotmail.com>
Subject: Re: [linux-lvm] LVM 1.0.3 to LVM 1.0.6 upgrade path on a Redhat 8.0 Production System
MIME-Version: 1.0
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
Date: Wed Feb 19 07:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I'm a bit confused about the patch installation instructions as they refer
> to the patch being for Linus kernels and not popular distributions (ie.
> Redhat)...and I *really* need some help with upgrading/patching LVM 1.0.3x
> to LVM 1.0.6 on a Redhat 8.0 production system running the Redhat
> 2.4.18-24.8.0 kernel as I need to increase and resize one of my LV's
beyond
> the current 240gig limitation yesterday. :)

using a different version of the tools and/or kernel code won't change the
limit on your LV since that limit gets set at VG creation.  The default
limit seems to have changed with 1.0.6 but that will only affect newly
created VGs (which will use a larger physicial extent size by default).  I
think this is well documented in the FAQ and/or mailing list archives[1].

     christian

[1] google for "lvm lv size limit" and the first hit would have explained
it...  teach a man how to fish ;-)
