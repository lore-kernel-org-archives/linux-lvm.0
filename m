From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvmcreate_initrd problem
Message-ID: <20020606144120.GI1080@tykepenguin.com>
References: <20020422023605.A12545@golem.blacknet.de> <20020603193550.73967.qmail@web14602.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020603193550.73967.qmail@web14602.mail.yahoo.com>
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
Date: Thu Jun  6 09:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jun 03, 2002 at 12:35:50PM -0700, Adrian Noland wrote:
> Hello,
> I'm trying to create an initrd and I'm hitting my head against this
> error:
> 
> lvmcreate_initrd -- ummounting ram disk
> umount: /tmp/initrd.2400: not mounted
> lvmcreate_initrd -- ERROR umounting /tmp/initrd.2400
>                  -- removing /tmp/initrd.2400
>                  -- removing /tmp/mnt.2400
> rmdir: `/tmp/mnt.2400': Device or resource busy
>                  -- removing /tmp/lib.2400
>                  -- exit with code 1
> 
> How do I find out why /tmp/initrd.$$ isn't mounted? Furthermore, can I
> unmount it on my own and complete the script my self? What values would
> I use for $DEVRAM and $INITRD?
> 

The wierd thing is that mount hasn't given an error. I suppose the thing to do
is to stick a "pause" or an "exit" after the mount to see if has actually worked
(if not, then strace it and see why not). If it has worked then figure out why
it get umounted in between or if the variable named gets mangled for any reason.

patrick
