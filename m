Return-Path: <james@fr.clara.net>
Date: Thu, 8 Feb 2001 14:51:46 +0100 (CET)
From: James <james@fr.clara.net>
Subject: Re: [linux-lvm] Setup for RAID1 with LVM
In-Reply-To: <3A827F18.4B387240@suse.de>
Message-ID: <Pine.LNX.4.21.0102081419050.740-100000@munster.noc.fr.clara.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm not an expert to say the least and I have only known raid and LVM for
few weeks but
from what I have managed to do myself, it is pretty straigt forward.
I am using Debian kernel 2.4.1 (with Raid, LVM, and reiserfs support)
The lvm tools are lvm_0.9.1_beta3. Unfortunatly what you are attempting to
do, transfer an existing (working) system to a mirrored system. I haven't
tried, and probably won't :-)

2 x 20gb drives hda hdb

On hda do a small install on the first partition of 500mb, and a swap, hdb
partitioned in the same way with the swap active. 
Setup the Raid (kernel etc) reboot on that kernel of course. Install the
lvm stuff. 

Then I do this :-)

hda / 500
    /swap 512
    / (the rest RAID auto)	

hdb /500
    /swap 512
    / (The rest RAID auto)

Setup the raidtab business.
Reboot, and normaly I can create an md device with hda3 and hdb3. 
Then pvcreate /dev/md0
Then vgcreate toto /dev/md0
Then lvcreate my /dev/toto/usr /var /home etc...
Format them or reiser them as in my case.
copy everything from /xxx /dev/toto/xxx using the super command
find . |cpio -pm /mnt

Then I have something like this.

Filesystem            Size  Used Avail Use% Mounted on
/dev/hda1             656M  421M  202M  68% /
/dev/lvdev/home       484M   23k  459M   0% /home
/dev/lvdev/var        484M   22M  437M   5% /var
/dev/lvdev/usr        484M  422M   37M  92% /usr

At the moment I am trying to decide if this is any use to me :-) I would
also like to be able to mirror the / but I haven't been able to yet(any
help gratefully recieved). And I don't know if this is how others are
doing it.

Comments more than welcome, I would like to perfect thsi :-)

James


On Thu, 8 Feb 2001, Jens Bruckmann wrote:

> Dear LVM-Specialists,
> 
> I would like to setup a configuration with LVM and RAID1. Poorly you
> can't just do a lvextend -m 1 like on HP-UX :-))
> 
> I could not find any hints so far for a step by step description, the
> part has to be included in the LVM-Howto.
> 
> I have two SCSI-Disks of nearly the same size, on Disk 1 I already have
> a working installation of Linux.
> 
> /usr, /opt and /var reside on LVs. I want these three LVs to be mirrored
> online to the second disk as it is possible on HP-UX.
> 
> Can someone shortly describe, how to setup such a configuration?
> 
> 
> Thanks for help,
> 
> 	Jens
> 
> -- 
> -----------------------------------------------------------------------
> Jens Bruckmann              .-.       Mail:    jens.bruckmann@suse.de
> SuSE Linux Solutions AG     /v\       Phone:   +49 - 40 - 89 69 82 18
> Friesenweg 5F              // \\      Fax:     +49 - 40 - 85 40 04 35
> D-22763 Hamburg           /(   )\
>                            ^^-^^      
> -----------------------------------------------------------------------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
