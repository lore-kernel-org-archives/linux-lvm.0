Return-Path: <dice@mfa.kfki.hu>
Date: Thu, 14 Dec 2000 16:50:41 +0100 (CET)
From: Tamas Gergely <dice@mfa.kfki.hu>
Subject: Re: [linux-lvm] Debian packaging
In-Reply-To: <0012132115222N.00826@lyta>
Message-ID: <Pine.LNX.4.30.0012141645040.17005-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: Linux-LVM@sistina.com

Hi!

As I noticed the LVM utilities are placed under /usr in this LVM.DEB .

Wouldn't it be better to use '/' as root not '/usr'?
I mean, it would be better to place the utilities into /sbin instead of
/usr/sbin.

(on many systems /usr is located on an LV. But activiting/disactivating
using vgchange is impossible after unmounting /usr)

Thanks in advance,
Gergely Tamas
