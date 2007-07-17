Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6H3CKOK025064
	for <linux-lvm@redhat.com>; Mon, 16 Jul 2007 23:12:20 -0400
Received: from bdmcc-us.com (bdmcc-us.com [209.42.230.180])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6H3CIPL024507
	for <linux-lvm@redhat.com>; Mon, 16 Jul 2007 23:12:18 -0400
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id B764E17FA5D
	for <linux-lvm@redhat.com>; Mon, 16 Jul 2007 23:12:16 -0400 (EDT)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 24679-01-9 for <linux-lvm@redhat.com>;
	Mon, 16 Jul 2007 23:12:15 -0400 (EDT)
Date: Mon, 16 Jul 2007 23:12:15 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] disk recovery - mounting external USB lvm2 volume
Message-ID: <20070717031215.GB24644@bdmcc-us.com>
References: <ca3f4a240707151830q4cd06100hbaea5969e4589258@mail.gmail.com>
	<20070716014007.GA31102@bdmcc-us.com>
	<ca3f4a240707161928y94deabr15839a6b6eb554ef@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca3f4a240707161928y94deabr15839a6b6eb554ef@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jul 16, 2007 at 09:28:01PM -0500, Allan Wolfe wrote:
> Thanks Brian.  This is starting to make sense.  The Fedora 7 and the old FC6
> both are named the defaults.  Here is the result from the vgchange:
> 
> $ sudo vgchange -a y
>  2 logical volume(s) in volume group "VolGroup00" now active
>  2 logical volume(s) in volume group "VolGroup00" now active
> 
> Digging around in the man pages, it looks to me as though I will need to
> rename the active/current volume using vgrename command, change the
> /etc/fstab to the new name and then follow on with mounting the old volume
> using the old default volume.
> 
> Am I on the right track?  Thanks for your help.

Yes, you are.  However, I recommend that you plan every step carefully,
so that you don't wind up with an unbootable system.  Make sure that you
have renamed the "local" LVM volumes, the fstab entries and anything
that might depend on those names. ( some things can break, but you had
better make sure that you can boot -- by the way, what do the entries in
grub.conf refer to? )



Brian
