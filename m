Return-Path: <claudio@conectiva.com>
Date: Thu, 21 Dec 2000 07:44:47 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] '/etc/init.d/lvm' script in debian package
In-Reply-To: <Pine.LNX.4.31.0012210915340.10260-100000@falka.mfa.kfki.hu>
Message-ID: <Pine.LNX.4.21.0012210739480.3255-100000@scuzzlebutt.helllabs>
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

On Thu, 21 Dec 2000, Gergely Tamas wrote:

> A few ideas ...
> 1) if LVM is compiled into the kernel and /boot/System.map is reachable,
> than it could be detected using e.g. 'grep lvm System.map'
> 
> 2) if /usr/src/kernel/.config is reachable, than it could be detected
> using e.g. 'grep -i lvm .config'

Doesn't work. If you're booting different kernels, /boot/System.map
will be incorrect at some point, and you can build different kernels
without actually installing them.
