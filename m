Return-Path: <gashaw@asosa.org>
Date: Fri, 2 Feb 2001 10:04:22 -0800 (PST)
From: Gashaw Mengistu <gashaw@asosa.org>
Subject: Re: [linux-lvm] startup scripts
In-Reply-To: <3A7B17B2.8A75537B@asosa.org>
Message-ID: <Pine.LNX.4.21.0102021002400.23087-100000@compath.asosa.org>
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

Oh .. I am using Mandrake 7.2 with Kernel 2.4.1 compiled with RAID and LVM
support built in.

On Fri, 2 Feb 2001, Gashaw Mengistu wrote:

> Hello all,
> 
> New here. 
> I am trying to get my RAID working with LVM. So far so good. But I have
> a couple of questions:
> 
> Where does the startup script go? I tried to put it in rc.sysinit right
> after the hostname setup and tells me LVM startup is sucessful but would
> not really start the VG. It fails on fsck. Then it drops me to shell and
> I can manually start LVM by doing vgchange -ay (exact same way it is in
> rc.sysinit) and do fsck and continue booting from there. What gives?
> 
> The other question is probably just a fluke but I couldn't create a
> directory on the file system mounted on LVM. I can create files though.
> But then it went away when I rebooted.
> 
> Thanks
