Return-Path: <gene_yee@hotmail.com>
From: "hail narcissus" <gene_yee@hotmail.com>
Subject: Re: [linux-lvm] Getting LVM to startup on RedHat
Date: Sat, 17 Mar 2001 15:59:20 -0800
Mime-Version: 1.0
Message-ID: <F3871yEXUIEAOeIiGXi00001997@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I put mine in rc.3 or whatever runlevel you boot at.  I just created a small 
script that kicks it off and it works fine.  Maybe that would do the trick 
for ya.

And if you are compiling why not just jump up to 2.2.18.

>From: Alec Smith <alec@shadowstar.net>
>Reply-To: linux-lvm@sistina.com
>To: <linux-lvm@sistina.com>
>Subject: [linux-lvm] Getting LVM to startup on RedHat
>Date: Sat, 17 Mar 2001 18:19:22 -0500 (EST)
>
>I've compiled kernel 2.2.17+LVM-0.9 patches on a RedHat 6.2 machine. If I
>run
>
>vgscan
>vgchange -ay
>mount /dev/malepages/data /data
>
>at a command prompt, all works well. However, if I include
>
>/usr/sbin/vgscan
>/usr/sbin/vgchange -ay
>
>(exactly as above) in my /etc/rc.d/rc.sysinit the commands don't seem to
>be run at reboot. After the reboot, I can run the vgchange and mount
>commands without first doing a vgscan without incident.
>
>Any ideas what could be going on?
>
>Thanks,
>Alec
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm

_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com
