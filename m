Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7FKA2lK018338
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 16:10:03 -0400
Received: from gk.uu.epigenomics.net (qmailr@gk.uu.epigenomics.net
	[195.127.125.226])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7FK9x1p014820
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 16:10:00 -0400
From: linux-lvm@ml.epigenomics.com
Subject: Re: [linux-lvm] Tool to manage LVM
Date: Wed, 15 Aug 2007 20:09:57 +0000 (UTC)
Message-ID: <slrnfc6ncl.4kl.robert.sander@raman.epigenomics.epi>
References: <46C33D37.7020001@terra.com.br>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, 15 Aug 2007 14:51:51 -0300,
 Piter PUNK <piterpk@terra.com.br> wrote:
> Hi,
>
> 	I am writing an small app to manage LVM. Currently it supports:
>
> 	1. Create and Remove Physical Volumes
> 	2. Create, Remove, Extend and Reduce Volume Groups
> 	3. Create and Remove Logical Volumes

Hi!

Sorry to interrupt but isn't this exactly the list of features from
EVMS? They have evmsn (ncurses interface) and emvsgui (GUI) to create,
resize, etc. volumes.

EVMS currently lacks active developers, maybe you can put your resources
into this project? http://evms.sourceforge.net/

Greetings
-- 
Robert Sander                     Senior Manager Information Systems
Epigenomics AG    Kleine Praesidentenstr. 1    10178 Berlin, Germany
phone:+49-30-24345-0                            fax:+49-30-24345-555
http://www.epigenomics.com             robert.sander@epigenomics.com
