From: "James B. Byrne " <ByrneJB@Harte-Lyne.ca>
MIME-Version: 1.0
Message-ID: <3CFB7E61.1848.B19791A@localhost>
In-reply-to: <E17EJYM-0008II-00@hermes.sistina.com>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Re: linux-lvm digest, Vol 1 #602 - 14 msgs
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
Date: Mon Jun  3 13:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: Thierry DE CARVALHO <thierry.decarvalho@online.fr>

On Thu, 30 May 2002 19:45:33 +0200
Thierry DE CARVALHO <thierry.decarvalho@online.fr> wrote:

> Try with grub (here /dev/vg00/lvol1 is the root fs):
> 
> title=GNU/Linux Debian 2.2 (potato)
> kernel (hd0,1)/vmlinuz-2.2.19 root=3a00 ramdisk_size=8192 vga=10
> #                                   ^^^^ <major><minor> of the lv
> #                                   device
> in hex
> initrd (hd0,1)/initrd-lvm-2.2.19.gz

I am afraid that this does not make a lot of sense to me.  Where 
does one get the major/minor numbers for the logical volume?

Regards,
Jim
---     e-mail is NOT a secure channel 
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3
