From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Red Hat Advanced Server + LVM
Message-ID: <20030623142222.A5533@uk.sistina.com>
References: <689F43A6CF84E541A721C5C3FD5ADECC02F5B6@blr-m3-msg.wipro.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <689F43A6CF84E541A721C5C3FD5ADECC02F5B6@blr-m3-msg.wipro.com>; from sharad.tiwari@wipro.com on Sun, Jun 22, 2003 at 01:10:20PM +0530
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
Date: Mon Jun 23 08:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jun 22, 2003 at 01:10:20PM +0530, Sharad Tiwari wrote:
> If I have created a volume group(say 'testvg') containg two physical
> volumes say /dev/sda5 and /dev/sda6, and then remove one of the
> physical volume say /dev/sda6 and then do a pvdisplay it shows
> /dev/sda6 as an unknown device ... 
 
> Now doing a vgreduce gives the proper result. So I did not understand
> why we are prividing this feature (using pvremove) of removing a
> physical volume from  an existing VG.
 
pvremove is the opposite of pvcreate - it removes the LVM label from the
device that you want to remove from the LVM system and use for something
else.

It is *not* a replacement for vgreduce.

Obviously the warning needs to be made clearer - you need to think
carefully about what you're doing before using -ff.

> Really WIPE LABELS from physical volume "/dev/sda7" of volume group "testvg" [y/n]? y
>   WARNING: Wiping physical volume label from /dev/sda7 of volume group "testvg"
>   Labels on physical volume "/dev/sda7" successfully wiped

Alasdair
-- 
agk@uk.sistina.com
