Message-ID: <536A24FC.4010907@redhat.com>
Date: Wed, 07 May 2014 14:20:12 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <1399447987.73696.YahooMailNeo@web141603.mail.bf1.yahoo.com>	<5369FFAB.2040701@redhat.com>
	<1399457072.41382.YahooMailNeo@web141606.mail.bf1.yahoo.com>
In-Reply-To: <1399457072.41382.YahooMailNeo@web141606.mail.bf1.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Add a disk from remote node to LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mahmood Naderan <nt_mahmood@yahoo.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 05/07/2014 12:04 PM, Mahmood Naderan wrote:
> 
> 
> 
>> How do you mean "remote drive" exactly? What type is it - is it iscsi, nbd...?
> 
> There are two nodes in a single rack. Each has 4 slots for SATAII disks. Current configuration is
> 
> 
> N1: /dev/sda, /dev/sdb, /dev/sdc, /dev/sdd where the last three (b, c, d) are grouped in in a single LVM volume.
> 
> 
> N2: /dev/sda, /dev/sdb where the last one (b) is free and I want to add it to the LVM of N1.
> 
> Each node is running an independent operating system (scientific linux)Currently /dev/sdb on N2 is not shared. I have just format it as ext4 (which is the same format as the LVM of N1).
> 
> 

One option here is to export the sdb on N2 as iscsi target and then connect
it to N1 node. But you must be very careful that nothing touches the sdb on N2
(mainly not writing anything to the drive or not trying to activate anything that
can be found on the drive), including LVM itself. As for LVM, you should configure
global_filter (or filter if you have older version of LVM) in /etc/lvm/lvm.conf
to exclude sdb on LVM scans (also, be cautious that under some circumnstances
"sdb" is not stable name and kernel can assign a different name on next reboot).

For example you can have a look at these howtos - there are slight differences
amongst distributions, mainly the package names, but the logic stays the same:

http://www.howtoforge.com/using-iscsi-on-fedora-10-initiator-and-target
http://www.howtoforge.com/using-iscsi-on-debian-squeeze-initiator-and-target
http://www.howtoforge.com/using-iscsi-on-ubuntu-10.04-initiator-and-target

But iscsi is just one option, there are more options how to export a drive
and attach it on remote node... You can also check for "nbd" (network block device),
that's another way that comes to my mind at the moment.

Though the best in your case would be if you could just attach the drive
physically to the machine where needed, if possible, of course.

> 
>> But essentially, you need to connect the remote drive first and then do a pvcreate and vgextend.
> 
> Should I run these commands on N1 or N2?

Once you have the remote drive attached (let's say it ends up attached as sdx on N1),
just use:

pvcreate /dev/sdx
vgextend vg /dev/sdx

(replace sdx and vg with actualy drive and vg name)

And you're done.

-- 
Peter
