Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A30FE44.73B992A7@tls.msk.ru>
Date: Fri, 08 Dec 2000 18:29:08 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] BLOCK_SIZE?
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

Little question that I already posted here a week ago or so.
What drawbacks can suffer if one changes BLOCK_SIZE in
include/linux/lvm.h from 1024 (or 4096 on S/390) to 512?
I can't understand from code what't a real purpose of
this constant, -- lvm seemed to work well with BLOCK_SIZE=512,
no troubles so far, -- but i'm still not shure if it is
"legal" to change that.  At least there is some purpose on
having different values for this constant on S/390 and other
platforms, -- again, can't see that purposes...

Oh yes, this is about 2.2 kernel and lvm-0.9.

Thank you.

Regards,
 Michael.
