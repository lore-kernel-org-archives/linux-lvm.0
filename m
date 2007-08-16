Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7GNmk5b030351
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 19:48:47 -0400
Received: from sr04-05.mta.terra.com.br (sr04-05.mta.terra.com.br
	[200.154.152.54])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7GNmbKl014256
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 19:48:38 -0400
Received: from laquenogami.hst.terra.com.br (laquenogami.terra.com.br
	[200.176.10.18])
	by buniche.hst.terra.com.br (Postfix) with ESMTP id CCC903E3814C
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 20:48:35 -0300 (BRT)
Received: from [192.168.0.6] (bd218831.virtua.com.br [189.33.136.49])
	(authenticated user piterpk)
	by laquenogami.hst.terra.com.br (Postfix) with ESMTP id AC97BB40A6
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 20:48:35 -0300 (BRT)
Message-ID: <46C4E2D6.8000104@terra.com.br>
Date: Thu, 16 Aug 2007 20:50:46 -0300
From: Piter PUNK <piterpk@terra.com.br>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Tool to manage LVM
References: <46C33D37.7020001@terra.com.br>
	<slrnfc6ncl.4kl.robert.sander@raman.epigenomics.epi>
In-Reply-To: <slrnfc6ncl.4kl.robert.sander@raman.epigenomics.epi>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

linux-lvm@ml.epigenomics.com wrote:
> Hi!
> 
> Sorry to interrupt but isn't this exactly the list of features from
> EVMS? They have evmsn (ncurses interface) and emvsgui (GUI) to create,
> resize, etc. volumes.

Hi.

EVMS is a much more complex tool. lvmdisk tries to emulate the fdisk
behavior and to be a good tool to do the basic setup and management
(because that "basic" i think the Logical Volume resize is a need).

> EVMS currently lacks active developers, maybe you can put your resources
> into this project? http://evms.sourceforge.net/

I read the page and don't think both tools have the same goals.
And my capabilities in C aren't very good.

					Thanks the answer!

							Piter PUNK
-- 
     |        E-Mail: piterpk@terra.com.br        (personal)
    .|.               roberto.batista@ntux.com.br (professional)
    /V\
   // \\      UIN:116043354  Homepage:http://piterpunk.info02.com.br
  /(   )\
   ^`~'^         ----> Slackware Linux - The Best One! <----
  #105432
