From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] unmapped dependency - RedHat rpm lvm-103
Message-ID: <20020528124833.GA21161@colombina.comedia.it>
References: <3CF27C73.3073.1A7BC5F@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CF27C73.3073.1A7BC5F@localhost>
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
Date: Tue May 28 10:26:46 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, May 27, 2002 at 06:35:31PM -0400, James B. Byrne  wrote:
> The lvmcreate_initrd script in the lvm-103.rpm requires the "strip" 
> command from binutils but binutils is not listed as a dependency.  I 
> don't know if this is your responsibility or redhat's but I am sending it 
> here as lvm is your package.
redhat uses it's own mkinitrd script that replaces
lvmcreate_initrd.
so maybe they should remove lvmcreate_initrd from their packages.
open a bug request do rh if you feel like it.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
