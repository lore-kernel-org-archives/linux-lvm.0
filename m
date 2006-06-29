Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5TESrY7003040
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 10:28:53 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.184])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5TESlou003165
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 10:28:47 -0400
Received: by nf-out-0910.google.com with SMTP id a27so70260nfc
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 07:28:43 -0700 (PDT)
Message-ID: <44A3E3FB.901@gmail.com>
Date: Thu, 29 Jun 2006 16:30:19 +0200
From: "ThomasC." <shoktai@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm and fstab
References: <44A3DF57.4080003@gmail.com> <20060629142338.GB20554@vwclub.ro>
In-Reply-To: <20060629142338.GB20554@vwclub.ro>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Cristian Livadaru wrote:
> On Thu, Jun 29, 2006 at 04:10:31PM +0200, ThomasC. wrote:
>> Hi,
>>
>> I am using RHEL3.
>> I have been reading the LVM howto and it is very clear but i am missing 
>> something anyways.
>> During the setup with DiskDruid i created a Volume group and two logical 
>> volumes.
>> One LV for /opt and another one for /stage.
>> After rebooting the OS i don't have any /stage partition.
>>
>> lvscan
>> lvscan -- ACTIVE            "/dev/Volume00/LogVol00" [19.53 GB]
>> lvscan -- ACTIVE            "/dev/Volume00/LogVol01" [19.53 GB]
>> lvscan -- 2 logical volumes with 39.06 GB total in 1 volume group
>> lvscan -- 2 active logical volumes
>>
>> But the fstab doesn't point to any Logical volume:
>>
>> The fstab contains
>> LABEL=/1                /                       ext3    defaults        1 1
>> LABEL=/boot             /boot                   ext3    defaults        1 2
>> none                    /dev/pts                devpts  gid=5,mode=620  0 0
>> none                    /proc                   proc    defaults        0 0
>> none                    /dev/shm                tmpfs   defaults        0 0
>> /dev/cciss/c0d0p3       swap                    swap    defaults        0 0
>> /dev/cdrom              /mnt/cdrom              udf,iso9660 
>> noauto,owner,kudzu,ro 0 0
>>
>> and a df -h returns
>>
>> [root@Pearl remarkit]# df -h
>> Filesystem            Size  Used Avail Use% Mounted on
>> /dev/cciss/c0d0p4     9.7G  2.4G  6.8G  27% /
>> /dev/cciss/c0d0p1      97M   14M   78M  15% /boot
>> none                  1.9G     0  1.9G   0% /dev/shm
>>
>>
>> So i don't understand what is really inside the logical volumes are they 
>> "empty" right now?
>>
> 
> I don't know what Diskdruid does since I don't know RH but you have to
> enter the mount points manualy in fstab or mount the partitions manualy
> ...
> you could do a mount /dev/Volume00/LogVol00 /opt and then you should
> have what you want.
> 
> Best Regards, Cristian Livadaru
Thats what i thought but the weird thing is that i can already access 
/opt so i am not very enthusiastic trying to mount it again....
