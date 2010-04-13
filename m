Message-ID: <4BC4200E.5090603@redhat.com>
Date: Tue, 13 Apr 2010 09:41:02 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <d692c3.61ee.127f6071a79.Coremail.chaimvy@163.com>
In-Reply-To: <d692c3.61ee.127f6071a79.Coremail.chaimvy@163.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] what does 'orphan vg' mean?(global vg?)
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Busby.Cheung" <chaimvy@163.com>

On 04/13/2010 09:16 AM, Busby.Cheung wrote:
>       While I was reading the lvm source code, I can't understand what
> 'is_orphan' means(like 'is_orphan_vg' function). what's the different
> between orphan and global vg?

Orphan PV is device with PV label which is not attached to any Volume Group.
(IOW it is handled by LVM, but space on it is not yet allocatable.)

There is no such thing like Global VG in LVM2, only "global lock".
It is internal lock used to avoid parallel scanning of all devices.
(you will see it in vgscan command for example).

Milan
