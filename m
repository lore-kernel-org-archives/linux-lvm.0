MIME-Version: 1.0
In-Reply-To: <51DBDDE8.3010206@redhat.com>
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
	<51DBDDE8.3010206@redhat.com>
Date: Tue, 9 Jul 2013 16:51:56 +0500
Message-ID: <CAKAA-nnZUvBuHmRaD9mn19gC51GfiihmweaJXTDRfRN92mstag@mail.gmail.com>
From: Micky <mickylmartin@gmail.com>
Subject: Re: [linux-lvm] Very slow i/o after snapshotting
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
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

> Is this supposed to be a bug report ?

Sorry for bashing the info. I was just answering the questions. LOL!

> So far I've no idea about disks/tables in use, system/kernel in use, lvm
> version in use....

RHEL 6.4 kernel-2.6.32-358.el6 (also tested with self compiled 3.8)
lvm2-2.02.98-9.el6.x86_64
Disk on external mega raid controller with ext4
Running Xen hypervisor but tested without it as well
