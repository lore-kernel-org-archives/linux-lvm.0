From: lembark@wrkhors.com
Subject: Re: [linux-lvm] RAID support...
Message-Id: <7480000.1009644669@duke.wrkhors.com>
In-Reply-To: <20011229104244.GB23434@irc.fem.tu-ilmenau.de>
References: <3C2CBAFB.90103@cdimed.com>
    <20011228123140.A9647@omnifarious.org>
    <20011229104244.GB23434@irc.fem.tu-ilmenau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Sat Dec 29 10:50:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


-- Mario 'BitKoenig' Holbe <Mario.Holbe@RZ.TU-Ilmenau.DE> on 12/29/01 11:42:44
+0100

> On Fri, Dec 28, 2001 at 12:31:40PM -0600, Eric M. Hopper wrote:
>> OS.  I question whether even RAID0 support is really necessary in LVM.
>> RAID should be stacked below, or above LVM, not packed inside.
> 
> Totally agreed. There is working RAID0 code in the Software-RAID.
> Why blowing up the kernel with two RAID0-code-trees...

There really isn't any "RAID" anything code in LVM. The 
striping, etc, capacity that combines PV's isn't about
RAID since it works above the hardware level. RAID0 
knows low-level things about the disk drives as hardware;
LVM only knows about PV's, which are a software abstracton
of hardware.

As an example, if you used a RAID controller to combine 
two drives you'd be stuck with both drives as RAID0 for
all time. No striping, whatever, just appending the space.
With LVM you can stripe some LV's, have others on one or
the other disk and other's growing. 

I've never seen a working case of RAID(n>0) being useful 
on LVM. The main reason is that RAID[135+] are about 
increasing hardware reliability while LVM is about abstracting
hardware out of existance. Stacking LVM on top of RAID gives
the best of both: Increased flexability of the large 
spaces on combined disks that are more reliable together.

--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
