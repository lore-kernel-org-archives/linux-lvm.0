Subject: Re: [linux-lvm] mount root filesystem on lvm
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <3EBD22B3.4090808@inode.at>
References: <3EBBF411.6060405@inode.at>  <3EBBFF45.4050006@inode.at>
	 <1052511447.6321.22.camel@chtephan.cs.pocnet.net>
	 <3EBD22B3.4090808@inode.at>
Message-Id: <1052607008.1489.2.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
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
Date: Sat May 10 17:49:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Manfred Gschweidl <m.gschweidl@inode.at>
Cc: linux-lvm@sistina.com

Am Sam, 2003-05-10 um 18.02 schrieb Manfred Gschweidl:

> i have one more question: what does your "lilo.conf" look like???
> especially the "root=...." parameter ist he most interesting one. how 
> does it need to be named with device-mapper???

It looks fairly simple:

boot    = /dev/hda
vga     = normal
read-only
lba32
prompt
timeout = 30
message = /boot/message

image  = /boot/vmlinuz
  label  = linux
  root   = /dev/mapper/vg-root
  initrd = /boot/initrd

But I think you can also use /dev/vg/root (in my case). I think lilo
only uses this line to look up the device number (major, minor).

What's your problem?

-- 
Christophe Saout <christophe@saout.de>
