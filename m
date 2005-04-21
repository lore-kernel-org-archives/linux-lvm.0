Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3LLisO24893
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2005 17:44:54 -0400
Received: from mail.utsl.gen.nz (210-54-92-184.ipnets.xtra.co.nz
	[210.54.92.184])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3LLimaK010052
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2005 17:44:48 -0400
Message-ID: <42681ECB.8090301@vilain.net>
Date: Fri, 22 Apr 2005 09:44:43 +1200
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] recovering data from an lvm partition
References: <ea5f9fb05042011544f275454@mail.gmail.com>
In-Reply-To: <ea5f9fb05042011544f275454@mail.gmail.com>
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
To: ray@putnamville.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

ray somcio wrote:
> I have a laptop harddrive which had FC3 installed, default filesystem
> setup using lvm.   Something happened to the drive where it doesn't
> boot anymore.  So I tried connecting it to another system running
> fedora 3.  is there a way to grab data off the laptop harddrive?

Something like;

   vgscan -a
   vgchange -ay

should make the VG active.  Then you can mount the partitions on it
(or just dd them off :) )

Sam.
