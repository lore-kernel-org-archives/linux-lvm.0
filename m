Return-Path: <wichert@cistron.nl>
Date: Fri, 27 Jul 2001 14:52:20 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] File System type on (LVM) partition
Message-ID: <20010727145219.B29848@cistron.nl>
References: <20010727133117.A29848@cistron.nl> <20010727121801.38519.qmail@web13403.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010727121801.38519.qmail@web13403.mail.yahoo.com>; from plamb_98@yahoo.com on Fri, Jul 27, 2001 at 05:18:01AM -0700
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

Previously Pierre Lamb wrote:
> I believe the stand ext2 is 83 and lvm is 8e so one
> could check for those values

That's a really poor check. 83 is `Linux Native', which isn't limited
to ext2 at all. My LVM PV happens to be type 83 as well actually.

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
