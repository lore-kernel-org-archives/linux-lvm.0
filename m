Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0OMOjO17516
	for <linux-lvm@redhat.com>; Mon, 24 Jan 2005 17:24:45 -0500
Received: from out2.smtp.messagingengine.com (out2.smtp.messagingengine.com
	[66.111.4.26])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0OMOeu3027298
	for <linux-lvm@redhat.com>; Mon, 24 Jan 2005 17:24:40 -0500
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
References: <1106517355.26963.213384700@webmail.messagingengine.com>
	<20050124002632.GA23702@pob>
Subject: Re: [linux-lvm] Reducing/Resizing LVM where "/" filesystem is included
	in the LVM
In-Reply-To: <20050124002632.GA23702@pob>
Date: Mon, 24 Jan 2005 14:24:40 -0800
From: fromkth+lvm@fastmail.fm
Message-Id: <1106605480.13480.213476562@webmail.messagingengine.com>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: greenrd@greenrd.org

Thanks for the suggestions, but qtparted does not help.

I ran Knoppix Live CD 3.7 which has qtparted 0.4.4 and it does not
recognizes the linux lvm partition and shows it as unknown
type/filesystem in the list, and it does not give any other information
or any other option(e.g resize) when i right click that partition.

so the question remains how to do it.

Thanks.

-ajeet.

On Mon, 24 Jan 2005 00:26:32 +0000, "Robin Green" <greenrd@greenrd.org>
said:
> On Sun, Jan 23, 2005 at 01:55:55PM -0800, fromkth+lvm@fastmail.fm wrote:
> > Now I want to free some space from the linux LVM(hda6) and create a
> > FAT32 partition as hda7.
> > 
> > So how to reduce that LVM?
> 
> I suggest you use qtparted. Basically you need to:
> 
> 1. Resize /
> 2. Move the swap volume back so it is adjacent to / (as it is swap, you
> could just
> run swapoff, delete the volume, and then recreate it.)
> 3. Reduce the physical volume size
> 
> I don't know if qtparted can do step 3 but it can do steps 1 and 2, I
> think.
> 
> > one more questions my /boot parition is /dev/hda5 but in fstab it shows
> > it as LABEL=/boot
> > so how is that?
> 
> /dev/hda5 contains a label called /boot. That means if you move /boot to
> a different
> partition, you don't have to change your fstab, which is useful, but
> rarely.
> 
> However, if you ever insert another Linux-formatted hard drive in your
> system,
> from a different computer, it can cause the OS to become very confused as
> it cannot
> determine which "/boot"-labelled partition to use! That is the
> disadvantage of
> partition labelling.
> 
> -- 
> Robin
