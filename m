Message-ID: <20030402164704.61870.qmail@web14403.mail.yahoo.com>
From: Aman Shahi <shahi_aman@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM1 Snapshot
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
Date: Wed Apr  2 10:47:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

does that mean that I will have to dedicate that
physical device for the Snapshot. I mean if I had
4 device /dev/sda /dev/sdb /dev/sdc /dev/sdd and
previously if I was striping my original LV over
all the 4 devices, in the current context I stripe
the original LV over 3 devices and create the
Snapshot LV over the 4th (dev/sdd) ?

-------------------------
On Tue, Apr 01, 2003 at 07:35:16AM -0800, Aman Shahi
wrote:
> 
> Using LVM1, how do I create a snapshot LV on a
> different physical device than the original LV
> 

Just add the PV name to the end of the command-line.

eg. if your original LV (/dev/vg/original) is on
/dev/sdc1 and you want the
snapshot on /dev/sdj1 do:

lvcreate -L<size> -s -n snapshot /dev/vg/original
/dev/sdj1

-- 

patrick





__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com
