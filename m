Return-Path: <thomas@n-ary.com>
Message-ID: <31470A1D25F5D311940A0020182B88D319F973@mail.n-ary.com>
From: Thomas Inglis <thomas@n-ary.com>
Date: Thu, 17 May 2001 14:10:04 +0100
MIME-Version: 1.0
Subject: [linux-lvm] main drive fail
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Thomas, Did you restore the lvm related entries in /etc ?
Well, using
   vgcfgrestore -nlvmGroup /dev/hdb1         (thx Dominque)
says that /etc/lvmconf/lvmGroup.conf doesnt exists, backup not available.
So no, how do I do this?
Thomas
__________________________________________________
n-ary .. .. .. functionality through creativity
http://www.n-ary.com/ +44 (1387) 242800

tagServlet ... a java alternative to ColdFusion!
http://www.tagServlet.com/
