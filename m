Return-Path: <banal@home.com>
Message-ID: <3AEAF58F.D69444A9@home.com>
Date: Sat, 28 Apr 2001 09:53:35 -0700
From: Evan Day <banal@home.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM 0.9.1beta7 and 2.4.4 (get_hardblocksize removed)
References: <002501c0cfc5$e5ab7560$56dc10c3@tal.org>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Replace the calls to get_hardblocksize() with get_hardsect_size().  There
are probably patches on the way for this, though.

Kaj-Michael Lang wrote:
> 
> Looks like the function:
> get_hardblocksize(kdev_t dev)
> 
> has been removed in 2.4.4. And LVM uses it in two places.
> Can someone fix it ?
> 
> --
> Kaj-Michael Lang
> milang@tal.org
> Java? I've heard of it, it is what I drink while hacking PHP!
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
