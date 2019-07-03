From: Gang He <GHe@suse.com>
Date: Wed, 3 Jul 2019 06:33:55 +0000
Message-ID: <CH2PR18MB32069E9FAA3406460CB5BDBDCFFB0@CH2PR18MB3206.namprd18.prod.outlook.com>
References: <CH2PR18MB32067F038B414DF8CFAD779BCFF90@CH2PR18MB3206.namprd18.prod.outlook.com>
	<265c72ee-4589-a83a-38f6-e39ada8c2da0@redhat.com>
In-Reply-To: <265c72ee-4589-a83a-38f6-e39ada8c2da0@redhat.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Can't remove the snap LV of root volume on
	multipath disk PV
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>

Hi Zdenek,

Thank for your reply, the bug is opened at https://bugzilla.redhat.com/show_bug.cgi?id=1726524
I feel maybe RHEL lvm2 also has the similar problem.
The problem looks to related with multipath disk PV. 

Thanks
Gang

-----Original Message-----
From: Zdenek Kabelac [mailto:zkabelac@redhat.com] 
Sent: 2019��7��1�� 18:23
To: LVM general discussion and development <linux-lvm@redhat.com>; Gang He <GHe@suse.com>
Subject: Re: Can't remove the snap LV of root volume on multipath disk PV

Dne 01. 07. 19 v 8:31 Gang He napsal(a):
> Hello List,
> 
> I am using lvm2-2.02.180 on SLES12SP4, I cannot remove the snap LV of root volume, which is based on multipath disk PV.
> e.g.
> linux-kkay:/ # lvremove /dev/system/snap_root
>    WARNING: Reading VG system from disk because lvmetad metadata is invalid.
> Do you really want to remove active logical volume system/snap_root? [y/n]: y
>    device-mapper: reload ioctl on  (254:3) failed: Invalid argument
>    Failed to refresh root without snapshot.
> 
> But, I can remove the snap LV of data volume successfully, e.g.
> linux-kkay:/ # lvremove /dev/system/data_snap
>    WARNING: Reading VG system from disk because lvmetad metadata is invalid.
> Do you really want to remove active logical volume system/data_snap? [y/n]: y
>    Logical volume "data_snap" successfully removed
> 
> If I use the ordinary disk as PV (rather than multipath disk), I cannot encounter this problem (both snap LVs can be removed).
>

Hi

Please open new BZ case and provide full -vvvv traces of failing command and also possibly attache  'dmsetup table' 'dmsetup ls --tree' and 'dmsetup info -c' 'dmsetup status'


Regards

Zdenek
