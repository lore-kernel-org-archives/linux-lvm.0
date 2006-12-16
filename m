Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBGHe74K026203
	for <linux-lvm@redhat.com>; Sat, 16 Dec 2006 12:40:07 -0500
Received: from x8.develooper.com (x8.develooper.com [216.52.237.208])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBGHe7US011049
	for <linux-lvm@redhat.com>; Sat, 16 Dec 2006 12:40:07 -0500
Mime-Version: 1.0 (Apple Message framework v752.2)
In-Reply-To: <E8CF7DA6-A3E9-46A3-B8C5-BF5F3BB08571@develooper.com>
References: <E8CF7DA6-A3E9-46A3-B8C5-BF5F3BB08571@develooper.com>
Message-Id: <1B86C5AB-165D-4908-AD11-90F5949DCD27@develooper.com>
From: =?ISO-8859-1?Q?Ask_Bj=F8rn_Hansen?= <ask@develooper.com>
Subject: Re: [linux-lvm] FC6: pvmove gives "device-mapper: reload ioctl
	failed: Invalid argument"
Date: Sat, 16 Dec 2006 09:40:00 -0800
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Dec 16, 2006, at 9:15 AM, Ask Bj=EF=BF=BDrn Hansen wrote:

[...]
>   device-mapper: reload ioctl failed: Invalid argument
>   ABORTING: Temporary mirror activation failed.  Run pvmove --abort.
[...]

I rebooted and ran pvmove /dev/md13 /dev/md8 again with -v -v -v -d -=20
d -d

Output at
	http://tmp.askask.com/2006/12/pvmove-failure.txt


  - ask

--=20
http://develooper.com/ - http://askask.com/
