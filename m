Return-Path: <alec@shadowstar.net>
Message-Id: <5.0.2.1.2.20010318030921.00a677d0@bugs.home.shadowstar.net>
Date: Sun, 18 Mar 2001 03:22:35 -0500
From: Alec Smith <alec@shadowstar.net>
Subject: Re: [linux-lvm] Getting LVM to startup on RedHat
In-Reply-To: <F3871yEXUIEAOeIiGXi00001997@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Where are the LVM patches for 2.2.18? Or, will I have to run 0.9.1beta6 for 
this? As the server I'm working with is half a continent away and will cost 
me $100/hr for local administration, I'd like to stick with well-tested and 
stable versions of kernel patches.

Personally I prefer Debian over RedHat because of the init script setup. 
Other than RedHat, my only other options were FreeBSD or WinNT. I've never 
quite understood FreeBSD (limited tinkering time on a test box) and refuse 
to touch NT with a 10' pole as a server.

To get LVM working, I ended up specifying noauto in the fstab. vgscan and 
vgchange -ay don't seem to work when placed before mounting of filesystems 
as directed in the HowTO, but will work if placed at the end of rc.sysinit. 
On the downside, I had to hardcode the mount of the LVM filesystem.

Alec


At 03:59 PM 3/17/01 -0800, you wrote:

>I put mine in rc.3 or whatever runlevel you boot at.  I just created a 
>small script that kicks it off and it works fine.  Maybe that would do the 
>trick for ya.
>
>And if you are compiling why not just jump up to 2.2.18.
>
>>From: Alec Smith <alec@shadowstar.net>
>>Reply-To: linux-lvm@sistina.com
>>To: <linux-lvm@sistina.com>
>>Subject: [linux-lvm] Getting LVM to startup on RedHat
>>Date: Sat, 17 Mar 2001 18:19:22 -0500 (EST)
>>
>>I've compiled kernel 2.2.17+LVM-0.9 patches on a RedHat 6.2 machine. If I
>>run
>>
>>vgscan
>>vgchange -ay
>>mount /dev/malepages/data /data
>>
>>at a command prompt, all works well. However, if I include
>>
>>/usr/sbin/vgscan
>>/usr/sbin/vgchange -ay
>>
>>(exactly as above) in my /etc/rc.d/rc.sysinit the commands don't seem to
>>be run at reboot. After the reboot, I can run the vgchange and mount
>>commands without first doing a vgscan without incident.
>>
>>Any ideas what could be going on?
>>
>>Thanks,
>>Alec
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>
>_________________________________________________________________
>Get your FREE download of MSN Explorer at http://explorer.msn.com
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
