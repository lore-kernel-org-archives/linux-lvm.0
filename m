Return-Path: <wichert@cistron.nl>
Date: Tue, 13 Mar 2001 21:17:49 +0100
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] Changing device numbers.
Message-ID: <20010313211749.B18064@cistron.nl>
References: <001601c0ac41$fc35a640$0f01a8c0@myplace.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001601c0ac41$fc35a640$0f01a8c0@myplace.net>; from list@showme.wox.org on Tue, Mar 13, 2001 at 08:48:16PM -0800
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
> I want root to have major 58, minor 0 and usr major 58, minor 1. How can I
> get that done.

The first thing that comes to my mind is: why would anyone care
what the device numbers are? The whole purpose of device files,
and especially devfs, is that you can use names instead of number
and never need to care about them.

Wichert.

-- 
   ________________________________________________________________
 / Generally uninteresting signature - ignore at your convenience  \
| wichert@cistron.nl                  http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
