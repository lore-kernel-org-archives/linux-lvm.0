Message-ID: <3560BA143F45D5118E670000E82459214C1E67@ssk.schneiderkenzingen.de>
From: "Koch, Steffen" <steffen.koch@sphinx-electronics.de>
Subject: RE: [linux-lvm] Help - how do I recover a lost Volume Group
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
Date: Tue Apr 15 04:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>
Cc: "'alan@chandlerfamily.org.uk'" <alan@chandlerfamily.org.uk>

> My main disk /dev/hda has a non-lvm root partition 
> (/dev/hda2) and one lvm
> partition (/dev/hda3)  [/dev/hda1 is a partition with another 
> OS on it :-( ]
> 
> It was starting to fail so I have purchased another disk and 
> temporarily
> wired it in as /dev/hdb.  I created three partitions on in 
> with /dev/hdb3 as
> the lvm partition.  I successfully copied the first two 
> partitions but with
> the third, in order to preserve my volume group name (vg1), I 
> did pvcreate
> /dev/hdb3, vgextend vg1 /dev/hdb3 and pvmove /dev/hda3 so 
> that all the data
> should now be on /dev/hdb3.

maybe copying the whole disk with tools like partition magic (forgive me)
would have been better. I managed to copy a PV from one disk to another.
