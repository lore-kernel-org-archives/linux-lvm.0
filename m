Date: Thu, 11 Oct 2001 04:56:21 -0400
From: Andres Salomon <dilinger@mp3revolution.net>
Subject: Re: [linux-lvm] eta for a 2.4.10 compatible release?
Message-ID: <20011011045621.A18923@mp3revolution.net>
References: <20011011023724.A22101@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011011023724.A22101@cistron.nl>
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
To: linux-lvm@sistina.com

This is by no means blessed by the official LVM folks, but what I've
been doing for quite a while is the following (assuming the latest
lvm and kernel tarballs are unpacked in the current directory):

cp LVM/1.0.1-rc4/kernel/*.c LVM/1.0.1-rc4/kernel/lvm-internal.h \
	linux/drivers/md/
cp LVM/1.0.1-rc4/kernel/lvm.h linux/include/linux/
cat linux/drivers/md/Makefile | \
	sed 's/^\(lvm-mod-objs.*\)$/\1 lvm-fs.o/' > m && \
	mv m linux/drivers/md/Makefile

Very simple procedure; replace all the lvm stuff in the kernel w/ the
new lvm files, and just add lvm-fs.o to the md Makefile:
-lvm-mod-objs	:= lvm.o lvm-snap.o
+lvm-mod-objs	:= lvm.o lvm-snap.o lvm-fs.o

No worries about rejected patches, and so on.


On Thu, Oct 11, 2001 at 02:37:24AM +0200, Wichert Akkerman wrote:
> 
> 
> I'm looking at the LVM CVS tree and the last change in the kernel
> patches I can find is from August 22, and the patches don't
> apply to a 2.4.10 ( which is almost 3 weeks old now) or 2.4.11,
> either Linus or ac tree.
> 
> Are there any plans to make a new release that does work with a
> recent kernel or even just to update the CVS? 
> 
> Wichert.
> 
> -- 
>   _________________________________________________________________
>  /       Nothing is fool-proof to a sufficiently talented fool     \
> | wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
> | 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 

-- 
"I think a lot of the basis of the open source movement comes from
  procrastinating students..."
	-- Andrew Tridgell <http://www.linux-mag.com/2001-07/tridgell_04.html>
