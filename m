Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9JICRr02751
	for <linux-lvm@redhat.com>; Tue, 19 Oct 2004 14:12:27 -0400
Received: from smtp807.mail.ukl.yahoo.com (smtp807.mail.ukl.yahoo.com
	[217.12.12.197])
	by mx1.redhat.com (8.12.11/8.12.10) with SMTP id i9JICKGj000823
	for <linux-lvm@redhat.com>; Tue, 19 Oct 2004 14:12:26 -0400
Subject: Re: [linux-lvm] Unable to boot system
From: Frank Dean <frank-lists@smartpixie.com>
In-Reply-To: <9cb08bfa04101811461b27ca0b@mail.gmail.com>
References: <9cb08bfa04101811461b27ca0b@mail.gmail.com>
Message-Id: <1098209532.335.14.camel@st-estephe.smartpixie.com>
Mime-Version: 1.0
Date: Tue, 19 Oct 2004 19:12:12 +0100
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Pratik Solanki <pratik.solanki.ml@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi Pratik,

I'm afraid I'm not far past LVM newbie myself.

One problem I had was the startup scripts for Mandrake 10.0
'intelligently' determined whether I was running LVM1 or LVM2 by the
presence of configuration files.  (The configuration methods differ
between the LVM1 and 2).  As I had been messing around with both LVM1
and LVM2 I had a mixture, and this destroyed the logic of the startup
script.

It might be worth having a little look through the startup script to
figure out where it's going wrong, and maybe that'll point you at the
answer.  I believe Mandrake is similar to RedHat, so chances are that
your startup script is also /etc/rc.sysinit.

It's worth noting that the script expects errors in some situations and
retries some operations again later.  So seeing errors during boot isn't
necessarily a problem...

Of course, it might be failing before you get to the startup script, but
that would suggest something modified your initrd image during the
upgrade, if the upgrade is the cause and not a red herring.

Cheers,

Frank


On Mon, 2004-10-18 at 19:46, Pratik Solanki wrote:
> Hello,
> 
> I am a newbie to LVM and recently installed Fedora Core 2 with LVM. I
> have 2 hard disks, only one of them is used in a volume group. I have
> 4 logical volumes in the group, /, /usr, /home and swap. Everything
> was wonrkinbg fine until I decided to upgrade my system through yum. I
> used the development releases since I wanted gnome 2.8. I did not
> update everything; instead I just updated selective gnome packages.
> After rebooting my system refuses to come up. It says something like
> 
> Uncompressing Linux ....
> ...
> Reading all physical volumes. This can take a while ...
> Found Volume Group "Vol0". metadata lvm2
> 4 logical Volumes in volume group "Vol0" now active
> Restarting System
> 
> I can use the fedora rescue disk and mount all the volumes without any
> problem. I did notice that when I was restarting, my systems showed
> errors when disabling swap (swapoff), but it went by too fast for me
> to write down the exact error. Something about /dev/mapper/LV03 not
> found.
> 
> Any ideas on what is causing this and how I can fix it.
> 
> Thanks,
> Pratik.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
