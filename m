Return-Path: <josv@osp.nl>
Date: Tue, 20 Feb 2001 13:03:03 -0800
From: Jos Visser <josv@osp.nl>
Message-ID: <20010220130303.A505@jadzia>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Stripe size of 2K allowed?
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

Hi,

I was trying to create a striped lvol with a stripe size of 2K. This
failed due to an illegal parameter:

# lvcreate -i 2 -I 2 -L 100 vg01
lvcreate -- invalid stripe size 2

It seems that stripe sizes of 1K and 2K are not allowed, although the
lvcreate manual page says that the stripe size is 2^n with 0<=n<=7.

Duh?

++Jos


-- 
I have no need for a spirituality which can not encompass my humanness.
