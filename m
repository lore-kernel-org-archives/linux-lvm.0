Date: Wed, 5 Sep 2001 18:26:15 -0500
Message-ID: <20010905182615.A31878@beaver.iucha.org>
From: "Florin Iucha" <florin@iucha.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] "anchoring" the logical volumes to physical volumes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello!

I have two SCSI harddisks of 4.5 GB each and I want to install Linux on them
on top of LVM.

I want to put / /boot /var /home /usr/local on the first disk and /usr on the
second one. At the same time I want to have all partitions (except /boot) on 
LVM so I can extend/snapshot them.

I can take the obvious route of creating a PV on each of the harddisks and 
putting them in the same VG and then splitting the VG into LV. But I want
to make sure /usr gets on the second disk and all /usr and / get allocated
at the beginning of the PV.

I can simulate this by creating the first LVs than a LV that will fill up the
first PV then the LV for /usr... But this is ugly and I am not sure is
guaranteed to work.

Any "smart" solution to this problem? Any plans to implement such a feature
in lvcreate?

Thank you,
florin

-- 

"If it's not broken, let's fix it till it is."

41A9 2BDE 8E11 F1C5 87A6  03EE 34B3 E075 3B90 DFE4
