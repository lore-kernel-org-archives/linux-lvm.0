Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1BCgji23677
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2004 07:42:45 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Unrecognised LVM device type
Message-ID: <20040211124243.GA2960@redhat.com>
References: <BAY2-F92tTx7e4VksaV0002ea59@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY2-F92tTx7e4VksaV0002ea59@hotmail.com>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 11 17:07:05 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

/dev/mapper/bigdisk is not contained in /etc/lvm/.cache.
YOu need to change your /etc/lvm/lvm.conf device name filter to include it.

Why do you want to create such bigdisk and use it as a PV ?
Just create PVs on hd[ac]4 and use LV striping.

Regards,
Heinz    -- The LVM Guy --

On Thu, Feb 05, 2004 at 03:01:02PM +0000, mons grapius wrote:
> Hi
> 
> Sorry to post this again but my attempts to register with the mailing list 
> failed so badly I have no way of knowing if my original email made it....
> 
> No doubt I'm being stupid but I cannot find a whole load of documentation
> on device mapper and LVM2 - there's a certain amount with the source but
> it's more what I'd call a rough guide.
> 
> My problem is I cannot create a PV (let alone a logical Vol) on a
> devicemapped device.
> 
> I am using a stock 2.4.22 kernel with the latest stable dm and LVM2 stuff
> from the sistina web site.
> 
> if I use "lvm version" I get the following
> 
> LVM Version 2.00.08 (2003-11-14)
> Library Version 1.00.07-ioctl (2003-11-21)
> Driver 4.0.5
> 
> The kernel patches, the compiles went perfectly and I can see the device
> mapper stuff loaded (I've compiled the dm and lvm stuff in statically) at
> boot time. I run the mknod scripts at boot up as well.
> 
> I have managed to create a simple stripe using hda4 and hdc4 partitions
> and I have a lovely big devicemapper device called bigdisk.
> 
> The special file for this is in /dev/mapper/bigdisk and has major 254 and
> minor of 0.
> 
> I can create any regular file system on this device mount it and use it.
> 
> If I try to initialise this with pvcreate as in
> 
> lvm pvcreate -vvv /dev/mapper/bigdisk
> 
> it fails. The ominous line is:
> 
> /dev/mapper/bigdisk: Skipping: Unrecognised LVM device type 254
> 
> 
> That's it I cannot progress further than that.
> 
> I am using the sample lvm.conf file that came with the LVM2 code.
> Initially I had no lvm.conf file (just for testing) and it did not work.
> 
> I have created a LVM on /dev/hdd4 and that works perfectly so I know the
> general installation must be good - well I assume it is!
> 
> I know that I have to be missing something obviously simple but without
> any doccos I am stumped.
> 
> Can anyone help - I hope someone else is trying to create LVs on
> devicemapper type devices.
> 
> Mark
> 
> _________________________________________________________________
> Sign-up for a FREE BT Broadband connection today! 
> http://www.msn.co.uk/specials/btbroadband
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat, Inc.
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
