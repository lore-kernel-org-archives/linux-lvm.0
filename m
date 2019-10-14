References: <CH2PR18MB32066B47726171588477EAC1CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5b456c7b-13bf-b7fc-9347-eb54ccb6cc72@redhat.com>
Date: Mon, 14 Oct 2019 12:39:45 +0200
MIME-Version: 1.0
In-Reply-To: <CH2PR18MB32066B47726171588477EAC1CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] devices/dir configuration option in
 /etc/lvm/lvm.conf can be edited?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <GHe@suse.com>

Dne 14. 10. 19 v 10:00 Gang He napsal(a):
> Hello List,
> 
> By default, devices/dir configuration option in /etc/lvm/lvm.conf is "=/dev".
> But, if I edit this configuration option, e.g. dir = "/dev/lvm", then lvcreate command will fail.
> 
> sles12sp4-node:/dev # lvcreate -L2G -ay -n testlv vgdata
>    /dev/lvm/vgdata/testlv: not found: device not cleared
>    Aborting. Failed to wipe start of new LV.
> 
> I am using lvm 2.02.183(or 180), this option can be edit individually?
> or any other option will affect this option, then lead to lvcreate failure.

Hi

The option is not so easy to explain:

In the first place on a today's system you shall never ever need to change 
this setting - as majority of systems runs 'udev' or something similar in a 
fixed position /dev.

So symlinks & devices appears at this directory (and without 'lvm2' direct 
work) only as a consequence of configured udev rules.

So now surely comes the obvious question -  why the 'setting' even exists when 
you should always use '/dev' anyway right ;) ?

And here the answer is longer -  lvm2 is very 'oldish' project from 'dark' era 
before udev took control over devices - and in this old era you could have 
configured different device directory for devices created by lvm2 - since it's 
been lvm2 physically creating these devices.

The usability for normal users is relatively questionable since almost every 
user wants his devices in /dev dir anyway, but couple wanted to maintain 
separate dir for lvm2 devices.

The 'other' use-case is for testing - where i.e. lvm2 test suite is/(or was) 
able to run its tests in completely isolated device directory.

But to be able to use this 'capability' - one has to enable other lvm.conf 
setting:  'activation/verify_udev_operations=1'  - when enabled lvm2 will 
ensure devices are in give directory.

But !!!! (and it's BIG BUT) this shall never be enabled on a system with 
running udevd and /dev  dir set - as basically nothing else then udevd is 
supposed to be creating anything in /dev dir.

So hopefully this explains most of the question you may have about this setting.

Regards

Zdenek
