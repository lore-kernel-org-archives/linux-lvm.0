From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] VG lost, VG restorable without lvmconf? Need help!
Message-Id: <636740000.1017419834@dizzy.wrkhors.com>
In-Reply-To: <004e01c1d71d$7c587580$9865fea9@homecomputer>
References: <200203280951.g2S9p8h23250@lorus.lonx.net>
    <15805.1017323123@www6.gmx.net>
    <004e01c1d71d$7c587580$9865fea9@homecomputer>
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
Date: Fri Mar 29 10:37:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- "dan.am" <lvm@lonx.net>

>> > Are your disks Maxtor ?
>>
>> no and yes :)
>> hda is IBM (30 GB)
>> hdb is a Maxtor 61,4 GB / 5400
> This probably has something to do with it. I have some Maxtor stuff too.
>>
>> I am afraid that I have no current backups of these files if backups at
>> all :-(
> This is a problem. Hmmmm...Try recreating your vol group config by running
> "vgcreate" and "lvcreate" from command line. Do not use yast , as this
> will call "vgscan" again
> Or maybe:
> 1. mv /sbin/vgscan /sbin/vgscan.BOGUS
> 2. YasT to recreate VG.
> In any case work carefully, since you are in trouble
>
> Also try "vgcfgrestore" , but   assume it is broken too, as it was in my
> case

Remember thta LVM doesn't effect the data on your disk, just
the LVM headers. If you remember the approx. sizes of things
you may be able to bring the LV back on line long enough to
back it up, blow off LVM, re-create the thing from scratcn,
run the VG backups and restore the original data.

All you can do it play around with it until the volume mounts.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
