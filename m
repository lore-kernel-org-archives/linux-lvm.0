From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] lvm 1.03 on redhat 7.3
Message-ID: <20020529010653.A9487@zealot.blacknet.de>
References: <3CF3DA1A.1612.6FD9111@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CF3DA1A.1612.6FD9111@localhost>; from ByrneJB@Harte-Lyne.ca on Tue, May 28, 2002 at 07:27:22PM -0400
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
Date: Tue May 28 19:06:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, May 28 '02 at 19:27, James B. Byrne  wrote:
> ram disk compressed image found at block 0
> freeing initrd memory 1211k freed
> VFS:mounted root (ext2 filesystem)
> attempt to access beyond end of device
Your initrd image does not work, it's to big.

Try uncompressing /boot/<your-initrd>.img (best you copy it to
/tmp/initrd.gz, gunzip this) and figure out the size. Round this size to
the next "regular" number and add "ramdisk=8192" or what ever your size
it to the append line in lilo.conf. rerun lilo and try again.

It might be required to boot from some kind of recovery device if you've
realy screwed up. hopefully you have something like this, otherwise
there are some generic solutions available on freshmeat.net

Cu,
    Goetz.
