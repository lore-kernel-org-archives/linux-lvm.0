Message-ID: <3B96B853.8090307@st-peter.stw.uni-erlangen.de>
Date: Thu, 06 Sep 2001 01:42:11 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "anchoring" the logical volumes to physical volumes
References: <20010905182615.A31878@beaver.iucha.org>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com


Florin Iucha wrote:

>Hello!
>
>I have two SCSI harddisks of 4.5 GB each and I want to install Linux on them
>on top of LVM.
>
>I want to put / /boot /var /home /usr/local on the first disk and /usr on the
>second one.At the same time I want to have all partitions (except /boot) on 
>LVM so I can extend/snapshot them.
>
>I can take the obvious route of creating a PV on each of the harddisks and 
>putting them in the same VG and then splitting the VG into LV. But I want
>to make sure /usr gets on the second disk and all /usr and / get allocated
>at the beginning of the PV.
>
>I can simulate this by creating the first LVs than a LV that will fill up the
>first PV then the LV for /usr... But this is ugly and I am not sure is
>guaranteed to work.
>
>Any "smart" solution to this problem? Any plans to implement such a feature
>in lvcreate?
>
i think it's already implemented, there should be an option which tells 
lvcreate which PV's
to use for the LV you are creating . see the man page to lvcreate or 
lvcreate --help

>
>Thank you,
>florin
>
