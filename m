Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0BIQSi3002412
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 13:26:28 -0500
Received: from mail-yx0-f184.google.com (mail-yx0-f184.google.com
	[209.85.210.184])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0BIQHX0031784
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 13:26:18 -0500
Received: by yxe14 with SMTP id 14so1417829yxe.23
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 10:26:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1263228858.2845.12.camel@pc7.dolda2000.com>
References: <1263228858.2845.12.camel@pc7.dolda2000.com>
Date: Mon, 11 Jan 2010 13:26:17 -0500
Message-ID: <b74494e61001111026g29f01b4ei2fc339ff980edba7@mail.gmail.com>
From: Misc Things <formisc@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd598da525ba5047ce7ac24
Subject: Re: [linux-lvm] Removing a PV from a mirror
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--000e0cd598da525ba5047ce7ac24
Content-Type: text/plain; charset=ISO-8859-1

oh... sorry to hear.
Actually, Fredrick, you may just answered my question that i posted earlier
about moving VG to another disk(s) and changing the stiping to linear. I
think (hope) that the command i needed is : lvconvert -m 0 ....

i hope you did take a backup ?
Andrew


On Mon, Jan 11, 2010 at 11:54 AM, Fredrik Tolf <fredrik@dolda2000.com>wrote:

> Hi list,
>
> I've got a mirror volume with two S-ATA disks, one of which started
> getting bad sectors recently, and I want to replace it. I'm having
> trouble removing it from the volume, however.
>
> When googling around on the subject, I've read everywhere that I
> shouldn't have to do anymore than remove it, and LVM should discover
> that and reconvert the mirror back into a linear volume. To be a bit
> more careful, though, I ran "echo 1 >/sys/block/sdh/device/delete" to
> have it removed properly in software first. Much to my surprise, shall
> we say, that just made the LV die a horrible death; it started returning
> EIO for every access to it, and I had to reboot the server to get it
> working again. Again, this is the proper procedure according to what
> I've been reading on the net; did I do it wrong, somehow, or are my
> sources completely off? (And if this doesn't work, then what would
> actually happen if the disk were to fail physically?)
>
> As I rebooted the server, I tried disconnecting the disk in advance, but
> that made LVM unable to bring the VG back online at all.
>
> How am I supposed to take this disk out of the volume? If I should use
> `lvconvert -m 0 $LV', then how do I specify which disk is to be removed?
>
> I'm using a stock Debian stable (Lenny) installation, meaning Linux
> 2.6.24 and LVM2 2.02.39.
>
> Appreciative for any answers,
>
> Fredrik Tolf
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--000e0cd598da525ba5047ce7ac24
Content-Type: text/html; charset=ISO-8859-1

oh... sorry to hear.<br>Actually, Fredrick, you may just answered my question that i posted earlier about moving VG to another disk(s) and changing the stiping to linear. I think (hope) that the command i needed is : lvconvert -m 0 ....<br>
<br>i hope you did take a backup ?<br>Andrew<br><br><br><div class="gmail_quote">On Mon, Jan 11, 2010 at 11:54 AM, Fredrik Tolf <span dir="ltr">&lt;<a href="mailto:fredrik@dolda2000.com">fredrik@dolda2000.com</a>&gt;</span> wrote:<br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Hi list,<br>
<br>
I&#39;ve got a mirror volume with two S-ATA disks, one of which started<br>
getting bad sectors recently, and I want to replace it. I&#39;m having<br>
trouble removing it from the volume, however.<br>
<br>
When googling around on the subject, I&#39;ve read everywhere that I<br>
shouldn&#39;t have to do anymore than remove it, and LVM should discover<br>
that and reconvert the mirror back into a linear volume. To be a bit<br>
more careful, though, I ran &quot;echo 1 &gt;/sys/block/sdh/device/delete&quot; to<br>
have it removed properly in software first. Much to my surprise, shall<br>
we say, that just made the LV die a horrible death; it started returning<br>
EIO for every access to it, and I had to reboot the server to get it<br>
working again. Again, this is the proper procedure according to what<br>
I&#39;ve been reading on the net; did I do it wrong, somehow, or are my<br>
sources completely off? (And if this doesn&#39;t work, then what would<br>
actually happen if the disk were to fail physically?)<br>
<br>
As I rebooted the server, I tried disconnecting the disk in advance, but<br>
that made LVM unable to bring the VG back online at all.<br>
<br>
How am I supposed to take this disk out of the volume? If I should use<br>
`lvconvert -m 0 $LV&#39;, then how do I specify which disk is to be removed?<br>
<br>
I&#39;m using a stock Debian stable (Lenny) installation, meaning Linux<br>
2.6.24 and LVM2 2.02.39.<br>
<br>
Appreciative for any answers,<br>
<br>
Fredrik Tolf<br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

--000e0cd598da525ba5047ce7ac24--
