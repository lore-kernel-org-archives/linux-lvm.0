References: <56E9D1D2.8000403@apollo.lv>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <56EAC5C6.10301@redhat.com>
Date: Thu, 17 Mar 2016 15:57:10 +0100
MIME-Version: 1.0
In-Reply-To: <56E9D1D2.8000403@apollo.lv>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvconvert -m 0 /dev/varlin/distfiles /dev/md0 =>
 zero filled logical volume
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: ray@apollo.lv

On 03/16/2016 10:36 PM, Raimonds Cicans wrote:
> Hello.
>
> I am trying to move LVM setup from old RAID md0 to new RAID md1
>
> I did "lvconvert -m 1 /dev/path/to/logical_volume /dev/md1" on bunch 
> of logical volumes.
> Everything went without problems.
>
> Then I tried to remove md0 from one of logical volumes by running 
> command:
> lvconvert -m 0 /dev/varlin/distfiles /dev/md0
>
> I tried to mount this logical volume, but failed.

Please provide "lvs -a" and the output of the lvconvert commands to tell 
better what failed here.

Did you check, that your new 2-legged mirror got convert to/from and
that it synced properly?

That said, this is a valid procedure beside using pvmove.

Can't tell what failed w/o further information.

Heinz

>
> Then I checked first  megabyte of logical volume it was zero filled.
>
> Partial output of "lvs -o+devices":
>   LV              VG     Attr       LSize   Pool Origin Data% Meta% 
> Move Log Cpy%Sync Convert Devices
>   backup          varlin -wi-ao---- 100,00g                          
> /dev/md0(6304)
>   backup          varlin -wi-ao---- 100,00g                          
> /dev/md0(8544)
>   data            varlin -wi-ao----  20,00g                          
> /dev/md0(28384)
>   distfiles       varlin -wi-a-----  20,00g                          
> /dev/md1(2738)
>   ftp             varlin rwi-aor---  10,00g 100,00           
> ftp_rimage_0(0),ftp_rimage_1(0)
>   ftpdown         varlin rwi-aor---  10,00g 100,00           
> ftpdown_rimage_0(0),ftpdown_rimage_1(0)
>
>
> lvm2: 2.02.116
> kernel: 4.4.2
>
>
> Questions:
>
> 1) What I did wrong?
> 2) Is it possible to salvage /dev/varlin/distfiles or I must restore 
> it from backups?
> 3) What I should do now to get system to safe state?
>
>
> Best regards,
> Raimonds Cicans
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
