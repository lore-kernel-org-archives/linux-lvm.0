From: Heming Zhao <heming.zhao@suse.com>
Date: Tue, 3 Sep 2019 05:02:25 +0000
Message-ID: <9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
References: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
	<20190829143759.GA22659@redhat.com>
In-Reply-To: <20190829143759.GA22659@redhat.com>
Content-Language: en-US
Content-ID: <D09834CCF535FA4884E7F1E0AA370AE8@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] system boot time regression when using lvm2-2.03.05
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
To: LVM general discussion and development <linux-lvm@redhat.com>, David
	Teigland <teigland@redhat.com>
Cc: Martin Wilck <mwilck@suse.de>

Hello

I found my mail which sent on last Friday and yesterday didn't appear in 
mail list, it may be blocked for attachment. So I resend it without 
attachment.

---below is original mail--
Hello David,

When event_activation=1 & obtain_device_list_from_udev = 0 in lvm.conf.
the boot time became: 1min 9.349s  (before time: 2min 3.661s)

When event_activation=0 & obtain_device_list_from_udev = 0
time: 1min 7.219s (before time: 1min 57.478s)

And the systemctl status for pvscan when time is 2min & 1min (obtain_xx=0)
```
# ls -lh *.txt
-rw-r--r--. 1 root root 640K Aug 30 19:17 
systemctl-status-all-pvscan-1min.txt
-rw-r--r--. 1 root root 664K Aug 30 18:49 
systemctl-status-all-pvscan-2min.txt
```
the scripts:
```
for i  in `systemctl list-units | grep lvm2-pvscan | cut -d' ' -f 3`; do 
systemctl status $i; done > systemctl-status-all-pvscan-2min.txt
```

There are 2 test result for above for loop. (these files will delete 3 
months later)
1> systemctl-status-all-pvscan-1min.txt
    event_activation=1 & obtain_device_list_from_udev = 0

2> systemctl-status-all-pvscan-2min.txt
    event_activation=1 & obtain_device_list_from_udev = 1

Test result URL:
https://gist.github.com/zhaohem/f9951bb016962cdd07bf7c9d3d7fd525

Thanks.
