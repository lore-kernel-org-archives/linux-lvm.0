Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i22HJo812313
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 12:19:50 -0500
Received: from ms-smtp-02.rdc-kc.rr.com (ms-smtp-02.rdc-kc.rr.com [24.94.166.122])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i22HJob22980
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 12:19:50 -0500
Message-Id: <200403021719.i22HJk407665@ecstasy1.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20040302154631.GB12779@tykepenguin.com> (message from Patrick
	Caulfield on Tue, 2 Mar 2004 15:46:32 +0000)
Subject: Re: [linux-lvm] Adding xfs module to the initrd-lvm
References: <20040302152911.GI15556@tangerine.coulon.evette> <20040302154631.GB12779@tykepenguin.com>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  2 12:18:08 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

To: linux-lvm@redhat.com
In-reply-to: <20040302154631.GB12779@tykepenguin.com> (message from Patrick
	Caulfield on Tue, 2 Mar 2004 15:46:32 +0000)
Subject: Re: [linux-lvm] Adding xfs module to the initrd-lvm
BCC: kfuchs@unicycling.org
References: <20040302152911.GI15556@tangerine.coulon.evette> <20040302154631.GB12779@tykepenguin.com>
--text follows this line--
>On Tue, Mar 02, 2004 at 04:29:11PM +0100, Jean-Luc Coulon (f5ibh) wrote:

>> I would like to add the xfs module to the lvm created by  
>> lvmcreate_initrd.
>> 
>> Is there a mean to do that easily?
>> So I have to mount and existing one and add the module by hand?

Patrick Caulfield wrote:

>I suspect that's the easiest way if that's what you really need to do.

>> So I have to use the standard initrd tools?

>You could edit the existing lvmcreate_initrd to add the module (look
>for lvm-mod and write some similar code underneath it).
>
>But the easiest way, by far, is to have your kernel with XFS compiled
>into it rather than as a module!

An alternative is to simply modify the initrd manually (Very easy and
rather straightforward):

Make a backup copy of the initrd.

(If the initrd is compressed, uncompress it using gunzip.)

# mount -o loop /boot/initrd-<version> /data1
# cp -p /lib/modules/<version>/kernel/fs/xfs/xfs.o /data1/lib/modules/<version>/kernel/fs/xfs/
  <Destination directory can be anywhere as long as insmod arg in linuxrc
   matches.> 
# <edit> /data1/linuxrc
  <Add insmod command to insert module xfs.o.>
  /bin/insmod /lib/modules/<version>/kernel/fs/xfs/xfs.o
# umount /data1

(If the initrd was compressed, compress it using gzip.)

# shutdown -r now

Rather than replace the original initrd, one could copy and modify it
and make a new lilo or grub entry for the old kernel/modified initrd.
This allows one to boot from the original kernel/initrd in case the
modified initrd contains a mistake that prevents proper booting.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
