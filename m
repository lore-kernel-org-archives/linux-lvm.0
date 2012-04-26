Message-ID: <4F99B3EA.6050401@redhat.com>
Date: Thu, 26 Apr 2012 22:45:30 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <20120424132419.GA2244@bdmcc-us.com>
	<20120426145811.GA3329@bdmcc-us.com> <4F997C15.6090300@redhat.com>
	<20120426172338.GA1355@bdmcc-us.com> <4F998A2C.6030909@redhat.com>
	<20120426194315.GA2873@bdmcc-us.com>
In-Reply-To: <20120426194315.GA2873@bdmcc-us.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Missing PV
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
To: Brian McCullough <bdmc@bdmcc-us.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 04/26/2012 09:43 PM, Brian McCullough wrote:
> On Thu, Apr 26, 2012 at 07:47:24PM +0200, Milan Broz wrote:
>>
>> Are you sure that VM see that second qcow file content? I don't think so.
> 
> You are right.
> 
> dmesg shows that the "drive" is found and accessable to the system.
> 
> HOWEVER, no partitions.  Or more properly, no partition table!   ????

If it was second disk, it can be without partition table, lvm does not
require it.

Never try to recover something when you are not sure if it was there ;-)

You can easily check - in guest, go to the /etc/lvm directory,
there should be metadata backups. Chekck them, there should be comment
which disk was there.

Can you paste some old metadata (_correct_ metadata, before disk disappeared)
to pastebin and send a link to it? Or directly to mail.

run "blkid -p <disk>" on it - what it reports?

> I tried a tool know I know of called "testdisk," which attempts to
> recover partition tables, and it wasn't able to help.  Odd.

Why? These tries can do more damages. Maybe someone just installed
e.g. grub there - this is fully recoverable still.

Paste that metadata above, we will see.

Milan
