Message-ID: <4E7B093C.1090003@redhat.com>
Date: Thu, 22 Sep 2011 12:09:00 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
	<1316623554-28975-22-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-22-git-send-email-lczerner@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 21/35] fsadm: Use DEFAULT_POOL when creating
	volume group
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
To: Lukas Czerner <lczerner@redhat.com>
Cc: linux-lvm@redhat.com

Dne 21.9.2011 18:45, Lukas Czerner napsal(a):
> I user did not specified group, use DEFAULT_POOL from configuration
> file.
> 

Since we start to use 'thin pool' terminology with thin target - it needs
probably more specific name -   DEFAULT_VG_POOL, DEFAULT_DEVICE_POOL ??

Zdenek
