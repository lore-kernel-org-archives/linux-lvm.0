Return-Path: <bluca@comedia.it>
Date: Tue, 13 Mar 2001 22:41:49 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Changing device numbers.
Message-ID: <20010313224149.A32112@colombina.comedia.it>
References: <001601c0ac41$fc35a640$0f01a8c0@myplace.net> <20010313211749.B18064@cistron.nl> <003301c0ac47$0ed576e0$0f01a8c0@myplace.net> <20010313214317.A19896@cistron.nl> <004f01c0ac4a$fa071760$0f01a8c0@myplace.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004f01c0ac4a$fa071760$0f01a8c0@myplace.net>; from list@showme.wox.org on Tue, Mar 13, 2001 at 09:52:38PM -0800
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
To: linux-lvm@sistina.com

On Tue, Mar 13, 2001 at 09:52:38PM -0800, Bas wrote:
> I thought so too, but that made me connect a monitor twice today and append
> a "root=/dev/rootvg/root" line ...
i put 
append="root=/dev/vg01/lvol1" in lilo.conf

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
