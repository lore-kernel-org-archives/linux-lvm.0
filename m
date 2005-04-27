Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3R5kbO16399
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 01:46:37 -0400
Received: from mail.cluj.astral.ro (mx0.astral.ro [193.226.99.20])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3R5kTid009313
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 01:46:30 -0400
Message-ID: <426F2730.7010502@nextra.ro>
Date: Wed, 27 Apr 2005 08:46:24 +0300
From: Gergely Imre <gimre@nextra.ro>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove hangs
References: <426E07BE.6030606@nextra.ro> <20050426132910.M98025@pk25.com>
In-Reply-To: <20050426132910.M98025@pk25.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com


output of the command
 pvmove -t -vv -d /dev/sdb2 > /tmp/pvmove-test.txt 2>&1
is here (http://terran.noc.astral.ro/pvmove/pvmove-test.txt)

then, i ran it without -t, like this:
 pvmove -vv -d /dev/sdb2 > /tmp/pvmove.txt 2>&1

the output here:
http://terran.noc.astral.ro/pvmove/pvmove.txt

at first, everything seemed alright, it kept writing the progress in the
file. i even ran 'lvs' a couple of times:

[root@watchdog tmp]# lvs
LV            VG       Attr   LSize  Origin Snap%  Move      Move%
.
.
.
pvmove0       watchdog p-C-ao 72.22G               /dev/sdb2   4.15
watchdog_root watchdog -wn-ao  5.88G
watchdog_var  watchdog -wN-ao 72.22G

the filesystem on this LV was mounted and used during the pvmove, but
this shouldn't be a problem, right?

i kept an eye on it, it did it's job for around 67%, then it hung, the
system was not responding, any command failed, i had to reboot. after
the reboot the whole thing started all over again, from the beginning.
but there is nothing in the logs that would indicate a problem.

Diaz Rodriguez, Eduardo wrote:
> Hi, try with pvmove -t or pvmove -v,
> 
> Send the panics output, I think that we need more information.
> 
> regards!
> 
> 
> On Tue, 26 Apr 2005 12:19:58 +0300, Gergely Imre wrote
> 
>>hi
>>
>>i have a LV with two PVs in it, like this:
>>
>> --- Logical volume ---
>>  LV Name                /dev/watchdog/watchdog_var
>>  VG Name                watchdog
>>  LV UUID                v6U2JY-PBMf-snpJ-IXX5-ZzcV-y4fk-PchoQg
>>  LV Write Access        read/write
>>  LV Status              available
>>  # open                 1
>>  LV Size                72.22 GB
>>  Current LE             2311
>>  Segments               1
>>  Allocation             next free (default)
>>  Read ahead sectors     0
>>  Block device           254:6
>>
>>  --- Physical volumes ---
>>  PV Name               /dev/sdb2
>>  PV UUID               5v23aD-mkO0-I9Ur-zUKG-sGd2-8iCP-zhgfJe
>>  PV Status             allocatable
>>  Total PE / Free PE    2500 / 189
>>
>>  PV Name               /dev/sda1
>>  PV UUID               7mzLEZ-Va0c-sdiW-8KAV-lyjo-a5yI-GBORGS
>>  PV Status             allocatable
>>  Total PE / Free PE    2941 / 2753
>>
>>i want to remove sdb2, so i wanted to make a pvmove /dev/sdb2, so it
>>would move everything to sda1. the strange thing is, pvmove starts, and
>>after, say, 20% (about an hour or so) the whole system hangs 
>>somehow. i can ping the box, but any command i try to run, fails. 
>>it's like it's waiting for the disk to read/write, or something like 
>>that. the distrib is Fedora Core 2.
>>
>>lvm> version
>>  LVM version:     2.00.15 (2004-04-19)
>>  Library version: 1.00.14-ioctl (2004-04-06)
>>  Driver version:  4.4.0
>>
>>filesystem is ext3.
>>the system has 2GB RAM, dual Intel Xeon 3GHz.
>>
>>i tried with kernel 2.6.11.7, after a while it gives me kernel panic
>>during pvmove. then i tried with 2.6.9, it didn't panic, but it hung,
>>and i had to reboot.
>>
>>it's kinda urgent, thanks.
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
> =======================================================================================
> Este d�a que tanto temes por ser el �ltimo, es la aurora del d�a eterno.
> 		-- S�neca. (2 a.C-65) Fil�sofo latino. 
> =======================================================================================
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Gergely Imre
SysAdmin
Nextra TeleCom - group Astral
Tel: +4(0)266-317500
http://www.nextra.ro/gimre
GPG key: 0x34525305 (www.keyserver.net)
