Message-ID: <3EE1FB7E.2010807@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] ext3 slash
References: <1054888476.11446.8.camel@lupin>
In-Reply-To: <1054888476.11446.8.camel@lupin>
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
Date: Sat Jun  7 09:50:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Geoff Dolman wrote:
> How can I change the slash volume from ext3 to ext2? As I mentioned I
> edited fstab so there must be some other record somewhere telling the
> kernel that slash is ext3 but what? Do I need to make a new initrd.img?
yes, you have to create a new initrd, after writing ext2 in the /etc/fstab.

mkinitrd -v -f /boot/initrd-k.v.e-r.img k.v.e-r

-- 
Luca Berra -- bluca@comedia.it
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
