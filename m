Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB6BajV04264
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 06:36:45 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id jB6BaaHf011115
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 06:36:37 -0500
Received: from pc8.trash.bin (pc8.trash.bin [192.168.4.8])
	by pc1.trash.bin (Postfix) with ESMTP id BA1D142D9
	for <linux-lvm@redhat.com>; Tue,  6 Dec 2005 12:36:29 +0100 (CET)
Date: Tue, 6 Dec 2005 12:36:29 +0100
From: Marc-Jano Knopp <pub_ml_lvm@marc-jano.de>
Subject: Re: [linux-lvm] Which size for snapshot volume for a *safe* backup?
Message-ID: <20051206113629.GB2867@mjk.myfqdn.de>
References: <20051205223911.GE3123@mjk.myfqdn.de>
	<20051206011017.GG3647@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051206011017.GG3647@agk.surrey.redhat.com>
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

On Tue, 06 Dec 2005 at 01:10 (+0000), Alasdair G Kergon wrote:
> On Mon, Dec 05, 2005 at 11:39:11PM +0100, Marc-Jano Knopp wrote:
> > So, obviously,
> >   snapshot volume size = original volume size
> > is not sufficient to hold a complete change of the original volume.
>  
> Correct - there's a little bit of metadata required too to 
> map each piece of data back into the right location.

Thought so, just wasn't sure if it gets stored inside the volume or in
an extra file or device.


I have noticed that lvdisplay <snapshot volume> prints:

  Allocated to snapshot:   5.00%

But as I don't know the inner workings of LVM, I preferred not to take
this value for all variants of logical volumes for granted, but instead
ask here in this list for exact numbers.


[lvscan displays inactive snapshot volume as active]

> The 'lvs' attributes should be accurate (and lvdisplay too I think).
> lvscan doesn't check properly and needs fixing, thanks.

http://www.gotfuturama.com/Multimedia/EpisodeSounds/2ACV14/10.mp3

:-)


Best regards

  Marc-Jano
