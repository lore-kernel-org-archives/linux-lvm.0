Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
MIME-Version: 1.0
From: Kjartan Reynir Hauksson <krh@os.is>
Message-ID: <OFDF3AD6E8.3D6822EA-ON00256E0F.007CEE22-00256E0F.007CEE29@svunta.os.is>
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
Date: Fri Jan  2 16:54:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com





>no, the culprit for 0x3a is lilo, but initrd should purposefully ignore
>that.
>it should mount the root fs and then do a pivot_root, so the kernel
>trying to open a root device is unexpected.

Well I patched the lilo mdk source file myself so it's probably my fault
(didn't see anything wrong though).  I tried to get your package from
comedia.it but it's not responding, can I get it somewhere else ?
