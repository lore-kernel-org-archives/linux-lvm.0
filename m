Return-Path: <wichert@cistron.nl>
Date: Tue, 13 Mar 2001 21:43:17 +0100
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] Changing device numbers.
Message-ID: <20010313214317.A19896@cistron.nl>
References: <001601c0ac41$fc35a640$0f01a8c0@myplace.net> <20010313211749.B18064@cistron.nl> <003301c0ac47$0ed576e0$0f01a8c0@myplace.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003301c0ac47$0ed576e0$0f01a8c0@myplace.net>; from list@showme.wox.org on Tue, Mar 13, 2001 at 09:24:35PM -0800
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

Previously Bas wrote:
> Because since I removed a couple of LVs and created a few, lilo seems to
> have some trouble when it's told that root=/dev/rootvg/root. (this number
> has changed). Plus I think it looks a lot "nicer" ...

Just running lilo again should fix that, right? It would be nice if
someone updated grub to handle LVM

Wichert.

-- 
   ________________________________________________________________
 / Generally uninteresting signature - ignore at your convenience  \
| wichert@cistron.nl                  http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
