Return-Path: <gerry@dorfam.ca>
Date: Sat, 7 Apr 2001 12:46:39 -0400 (EDT)
From: <gerry@dorfam.ca>
Subject: Re: [linux-lvm] 2.2.19 Patches??
In-Reply-To: <3ACE5D8E.26CADB95@ednet.ns.ca>
Message-ID: <Pine.LNX.4.30.0104071239490.1215-100000@leopard.dorfam.ca>
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
To: linux-lvm@sistina.com

Well, I tried to follow the instructions and surprisingly...LVM is working
with a fresh new 2.2.19 kernel!  I found it confusing to install patches
labeled for other kernels.  Also, I don't normally venture into the realm
of building my own kernel patches!

I had a question though.  When I got LVM working with the older 2.2.17
kernel I had two choices when I was running make xconfig.  The first was
to include LVM as inline or a module and the second was for lvm proc
support.  This time around with the 2.2.19 kernel I didn't get the lvm
proc support option.  Did I miss something???

Gerry


On Fri, 6 Apr 2001, Patrick Boutilier wrote:

> Below is some instructions direct from the README in the PATCHES directory.
> If you want to get your own raw-io patch get
> ftp://ftp.kernel.org/pub/linux/kernel/people/sct/raw-io/kiobuf-2.2.18.tar.bz2.
> I used raw-2.2.18.FULL.diff to patch my 2.2.19 kernel.
>
>snip....
>
