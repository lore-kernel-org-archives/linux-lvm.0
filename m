Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104042035.f34KZ8M09891@webber.adilger.int>
Subject: Re: [linux-lvm] vgscan -- no volume groups found
In-Reply-To: <005c01c0bd15$707ee0a0$0400a8c0@ci696011a.lxintn1.ky.home.com> from
 Jonathan DeHaan at "Apr 4, 2001 10:42:14 am"
Date: Wed, 4 Apr 2001 14:35:07 -0600 (MDT)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

You write:
> Having successfully installed LVM on /dev/md0 (sd[ab]1) including root on
> LVM, I was finally ready to kill my online backup on /dev/hda6. I pvcreated
> it, vgextended it, and lvextended an lv that needed more room. When I
> rebooted, however, vgscan cannot find my vg. I am using kernel 2.4.2 and
> 0.9.1_beta5.
> 
> I downloaded beta6 tools and created a separate initrd on another machine
> that gives me a bash prompt, but vgscan now complains of invalid i/o
> protocol v. 11. I did try the UUID trick found in the mailing list archives,
> and I have verified that both my PV's have the correct list of UUIDs in
> order, but beta5 vgscan still complains of no volume groups found.

Beta5 was a strange beast, and it is the only one with IOP 11.  You need
to run beta5 tools with a beta5 kernel.  Otherwise, you should run beta6
tools with beta6 kernel, or beta[234] tools with beta[2346] kernel.

I don't recall which problems were fixed beta5 -> beta6.  Is it possible
for you to get another kernel (beta6 preferrably) so you can run beta6
tools?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
