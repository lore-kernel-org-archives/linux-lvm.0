From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040101110941.GA13503@percy.comedia.it>
References: <OF2A36FAD2.4372439D-ON00256E0E.00034E31-00256E0E.00034E39@svunta.os.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF2A36FAD2.4372439D-ON00256E0E.00034E31-00256E0E.00034E39@svunta.os.is>
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
Date: Thu Jan  1 05:11:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 01, 2004 at 12:36:06AM +0000, Kjartan Reynir Hauksson wrote:
>>are you running a particular distro? if so telling which one it is could
>>be useful in gifing you the right hints.
>
>I using Mandrake 9.2 with mkinitrd 3.5.15.1 and a patched lilo 22.5.8
3.5.15.1?, you mean _MY_ mkinitrd and _MY_ patched lilo?
http://www.comedia.it/~bluca/cooker/lvm2
good, then i can help you

(i suppose you also installed the other stuff from there: lvm1 and lvm2
and initscripts)

>>your distro probably has an mkinitrd command, so you would need to patch
>>it to support lvm2 if it does not already.
just run mkinitrd -v -f /boot/initrd-2.4.22.img 2.4.22
(assuning it was a vanilla 2.4.22)

then you should have a block in your /etc/lilo.conf that looks like
this:
image=/boot/vmlinuz-2.4.22
        label=lvm2
        root=/dev/root/1
        initrd=/boot/initrd-2.4.22.img
        append="devfs=mount"
        read-only

>>you might also need to patch your sysinit boot script
>Could you be a little more specific regarding the sysinit boot scripts as
>it's probably the most confusing part of the process.

if you install the initscripts on my page it should just work
(note that i updated my page today)

note my patched initscripts does not care what the default alternative
for lvm is (lvm1 or lvm2) but you might, so check and change it with the
"update-alternatives --config" command if you have both rpm installed.

note2: if you want a mandrake patched kernel with support for lvm2
included go to: http://www.netikka.net/tmb/Cooker

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
