Return-Path: <bluca@comedia.it>
Date: Mon, 26 Mar 2001 08:48:57 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM on top of Software Raid
Message-ID: <20010326084857.B23957@colombina.comedia.it>
References: <sabefed6.028@MS106BN>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sabefed6.028@MS106BN>; from michael.burschik@postbank.de on Mon, Mar 26, 2001 at 08:29:11AM +0200
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
Content-Transfer-Encoding: 7bit
To: Michael Burschik <michael.burschik@postbank.de>
Cc: linux-lvm@sistina.com

On Mon, Mar 26, 2001 at 08:29:11AM +0200, Michael Burschik wrote:
> Is it possible to use multiple devices as physical volumes? The problem here seems to be related to the "partition ID" of the multiple devices. If it is possible, how do I do it? If it is not, are there any plans to fix it?
it is possible,
there is no partition id issue, you are most probably using outdated tools.
just grab the latest lvm_tools from www.sistina.com
mkraid your md device, pvcreate it and you are done.

Note: if md=raid5 you must be careful that every filesystem on it must have
the same blocksize.

L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
