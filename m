Message-ID: <3905652C.5B5CF85C@ednet.ns.ca>
Date: Tue, 25 Apr 2000 06:28:12 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mounting lv's from fstab
References: <39053E22.D84F870F@netconnect.com.au>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bug1 <bug1@netconnect.com.au>
Cc: "linux-lvm@msede.com" <linux-lvm@msede.com>

I just put the vgchange command in /etc/rc.d/rc.sysinit just before the
RAID part.

.......
# Load modules (for backward compatibility with VARs)
if [ -f /etc/rc.d/rc.modules ]; then
        /etc/rc.d/rc.modules
fi

# LVM
/sbin/vgscan
/sbin/vgchange -a y

# Add raid devices
if [ -f /proc/mdstat -a -f /etc/raidtab ]; then
        echo -n "Starting up RAID devices: "


.......

bug1 wrote:

> I put all my logical volumes in /etc/fstab but it doesnt work
> automatically.
>
> Everytime i restart my machine i have to manually activate my volume
> group by typing vgchange -a y archive.
>
> Is there a way of automatically doing this with lvm or would i have to
> write an init script ?
>
> Thanks
>
> Glenn McGrath
