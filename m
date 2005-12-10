Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBAN3w124730
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 18:03:58 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.21])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id jBAN3nBG005956
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 18:03:50 -0500
Received: from pc8.trash.bin (pc8.trash.bin [192.168.4.8])
	by pc1.trash.bin (Postfix) with ESMTP id BE54442D9
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 00:03:41 +0100 (CET)
Date: Sun, 11 Dec 2005 00:03:41 +0100
From: Marc-Jano Knopp <pub_ml_lvm@marc-jano.de>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <20051210230341.GJ3103@mjk.myfqdn.de>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051210223139.GI3103@mjk.myfqdn.de>
	<B3E2561C8D66866DCF5FD2D8@dhcp-2-206.wgops.com>
	<208D3DC6840704A034151D63@dhcp-2-206.wgops.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <208D3DC6840704A034151D63@dhcp-2-206.wgops.com>
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

On Sat, 10 Dec 2005 at 15:51 (-0700), Michael Loftis wrote:
> --On December 10, 2005 3:44:00 PM -0700 Michael Loftis <mloftis@wgops.com> 
> wrote:
> >--On December 10, 2005 11:31:40 PM +0100 Marc-Jano Knopp <pub_ml_lvm@marc-jano.de> wrote:
[...]
> >Any tail can be packed if it doesn't match the block size.  In our case
> >the corruption evidenced itself as files with the first part being ok,
> >and the last part being all NULLs (0x0) up to the 'normal' file size.
> 
> I really should say *mostly* because yes, files that were entirely shorter 
> than the blocksize were essentially gone (full of NULLs).

I knew it. :-)


> Our mail server makes the best use of reiserfs because of the huge number 
> of files and the amount of files that end up packed.

Same effect with news spool here (until ReiserFS lost files and I
returned remorsefully to ext3 :-).


Best regards

  Marc-Jano
