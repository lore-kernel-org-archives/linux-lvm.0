Return-Path: <dirk.derycke@icos.be>
Subject: Re: [linux-lvm] Fwd: 2.4.0 kernel doesn't see LVM
From: dirk.derycke@icos.be
Date: Wed, 24 Jan 2001 10:30:03 +0100
Message-ID: <OF48A10ED6.E78FC82F-ONC12569DE.00339875@icos.be>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

for me the upgrade from 2.4.0-test12 to 2.4.0 was simple. I upgraded the
user tools to 0.9
rebooted with 2.4.0. Important note: my root partition is NOT LVM.
Then I executed the vgscan from the 0.9 tools which detected the 0.8 LVM
data, then I activated the volume group and mounted the LV's.

A backup however is always a safe thing to do. But normally the above
procedure should work fine...
Note that I had a 2.2.14 with 0.7 tools first before 2.4.0-testXX and
didn't have to backup and restore data...

What would be the point of having industrial strength disk management when
you have to backup and restore
every software upgrade (imagine hundreds of gigs)?.

regards,

Dirk





Benoit SERRA <bs@infologic.fr>@sistina.com on 01/24/2001 09:31:22 AM

Please respond to linux-lvm@sistina.com

Sent by:  linux-lvm-admin@sistina.com


To:   linux-lvm@sistina.com
cc:

Subject:  Re: [linux-lvm] Fwd: 2.4.0 kernel doesn't see LVM


Mark Phillips wrote:
>
> Hi,
>
> I am currently running a 2.4.0-test9 kernel with LVM compiled in and
> with associated software, version 0.8.final.  Everything works fine
> here.
>
> I tried compiling the final version of 2.4.0 with LVM compiled in, but
> when I tried booting, it complained that it didn't know about my LVM
> devices!  It seems strange that 2.4.0-test9 works fine but 2.4.0
> doesn't.  Could it be that I need to upgrade to 0.9 of the LVM
> software?
>

With 2.4.0, the LVM version is 0.9, which is not compatible with 0.8.
So you have to upgrade your user space tools to 0.9, and to migrate your
0.8final LVM volumes to 0.9
volumes. For me, the safiest way to do this is to make a backup of your
data, crash all your LVm setup, reboot on 2.4.0, create your VG and LV
with  0.9 user space tools, and then restore data.
I think there is some way to migrate without restoring data, check the
list archive for this.

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
