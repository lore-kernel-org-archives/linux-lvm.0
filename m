Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m73NwL7s022771
	for <linux-lvm@redhat.com>; Sun, 3 Aug 2008 19:58:21 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.248])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m73NwCjo007266
	for <linux-lvm@redhat.com>; Sun, 3 Aug 2008 19:58:12 -0400
Received: by an-out-0708.google.com with SMTP id d31so351965and.124
	for <linux-lvm@redhat.com>; Sun, 03 Aug 2008 16:58:12 -0700 (PDT)
Message-ID: <f4f537b50808031658h61d5c295xe93b1ffab3b9a15e@mail.gmail.com>
Date: Sun, 3 Aug 2008 18:58:11 -0500
From: "Eugene Vilensky" <evilensky@gmail.com>
Subject: Re: [linux-lvm] create logical volumes over remote file system (like
	samba)?
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: LVM general discussion and development <linux-lvm@redhat.com>

If you can dedicate a link using iSCSI may be an option, but if by
"remote" you mean over the general internet, it may be an interesting
toy but the latencies will quickly be untenable for any production
use.

What are the original poster's requirements that NFS cannot meet? If
you raid0 a slow disk and a fast disk, you end up with a (nostly) slow
disk, so why even entertain the thought?

- Original message -
Hi, I think this is not possible with Samba as Samba will provide a NAS...



On 8/3/08, Zurell, Falko <Falko.Zurell@idmedia.com> wrote:
> Hi,
>
> I think this is not possible with Samba as Samba will provide a NAS storage
> (space with filesystem etc.). For LVM you would need raw devices. So maybe
> iSCSI would be an idea.
>
>
>
>
>
> ________________________________
>
> Von: linux-lvm-bounces@redhat.com
> An: linux-lvm@redhat.com
> Gesendet: Sun Aug 03 22:35:00 2008
> Betreff: [linux-lvm] create logical volumes over remote file system
> (likesamba)?
>
>
> hi list
>
> after asking the question on some boards/irc channels i got the hint of
> using LVM.
> Since, after reading some docs, im not sure if it solves my needs im asking
> here.
>
> I try to create some kind of RAID0 using remote storage servers.
> And i think i will use Samba for this.
> So the question is: is it possible to create a RAID0 using LVM over remote
> Storages?
> I thought of mouting the samba shares on local directories and then create
> an lvm
> over it and mount it in another directory.
> Is this possible using LVM?
> Or are there any alternatives which can solve this problem?
>
> thx all
>
>
> ________________________________
>
> Invite your mail contacts to join your friends list with Windows Live
> Spaces. It's easy! Try it!
> <http://spaces.live.com/spacesapi.aspx?wx_action=create&wx_url=/friends.aspx&mkt=en-us>
>
>

-- 
Sent from Gmail for mobile | mobile.google.com

Eugene Vilensky
evilensky@gmail.com
