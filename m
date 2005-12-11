Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBB3cw122137
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 22:38:58 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.205])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBB3cl07013214
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 22:38:47 -0500
Received: by wproxy.gmail.com with SMTP id i5so169431wra
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 19:38:46 -0800 (PST)
Message-ID: <1cbd6f830512101938g4ec7d36dq4fd9a081658edf47@mail.gmail.com>
Date: Sat, 10 Dec 2005 22:38:46 -0500
From: Mag Gam <magawake@gmail.com>
Subject: Re: [linux-lvm] LVM onFly features
In-Reply-To: <20051210230341.GJ3103@mjk.myfqdn.de>
MIME-Version: 1.0
Content-Disposition: inline
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051210223139.GI3103@mjk.myfqdn.de>
	<B3E2561C8D66866DCF5FD2D8@dhcp-2-206.wgops.com>
	<208D3DC6840704A034151D63@dhcp-2-206.wgops.com>
	<20051210230341.GJ3103@mjk.myfqdn.de>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Marc-Jano Knopp <pub_ml_lvm@marc-jano.de>

thanks everyone for their kind replies.

So, will LVM and FS (ext2/3 in particular )ever be considered as 1?
This would be nice for ease of devt.




On 12/10/05, Marc-Jano Knopp <pub_ml_lvm@marc-jano.de> wrote:
> On Sat, 10 Dec 2005 at 15:51 (-0700), Michael Loftis wrote:
> > --On December 10, 2005 3:44:00 PM -0700 Michael Loftis <mloftis@wgops.com>
> > wrote:
> > >--On December 10, 2005 11:31:40 PM +0100 Marc-Jano Knopp <pub_ml_lvm@marc-jano.de> wrote:
> [...]
> > >Any tail can be packed if it doesn't match the block size.  In our case
> > >the corruption evidenced itself as files with the first part being ok,
> > >and the last part being all NULLs (0x0) up to the 'normal' file size.
> >
> > I really should say *mostly* because yes, files that were entirely shorter
> > than the blocksize were essentially gone (full of NULLs).
>
> I knew it. :-)
>
>
> > Our mail server makes the best use of reiserfs because of the huge number
> > of files and the amount of files that end up packed.
>
> Same effect with news spool here (until ReiserFS lost files and I
> returned remorsefully to ext3 :-).
>
>
> Best regards
>
>   Marc-Jano
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
