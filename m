Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
MIME-Version: 1.0
From: Kjartan Reynir Hauksson <krh@os.is>
Message-ID: <OF2A36FAD2.4372439D-ON00256E0E.00034E31-00256E0E.00034E39@svunta.os.is>
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
Date: Wed Dec 31 18:46:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com





>are you running a particular distro? if so telling which one it is could
>be useful in gifing you the right hints.

I using Mandrake 9.2 with mkinitrd 3.5.15.1 and a patched lilo 22.5.8

>your distro probably has an mkinitrd command, so you would need to patch
>it to support lvm2 if it does not already.
>you might also need to patch your sysinit boot script

Could you be a little more specific regarding the sysinit boot scripts as
it's probably the most confusing part of the process.

>you will also need patching lilo to understand device-mapper, else it
>will not run anymore on your dm patched kernel (see
>http://www.saout.de/misc/)

 Thanks
-Kjartan
