From: James Longworth <longi@batty.ecr.mu.oz.au>
Message-Id: <200211190903.gAJ93mM15712@batty.ecr.mu.oz.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Advice needed: vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "vg0" from physical volume(s)
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
Date: Tue Nov 19 03:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-LVM@Sistina.com

Hi,

I got your email address from the LVM man pages, hopefully I'm emailing
the right person.

I have an LVM device that has lost its LVM data.

The error I'm getting is vgscan -- ERROR "vg_read_with_pv_and_lv():
current PV" can't get data of volume group "vg0" from physical volume(s)

I haven't tried recreating any of the devices because I didn't want to
risk overwriting any data on the disks.

Can you point me at some documentation on rescuing an LVM partition, or
if you have time, possibly give me some advice on where to start?

It would be greatly appreciated.

James

-- 
James Longworth
longi@unimelb.edu.au
(03) 8344-3361
"Working for Melbourne University gives people real incentives to want
things that nobody else wants."  -- Apologies to Andy Warhol.
