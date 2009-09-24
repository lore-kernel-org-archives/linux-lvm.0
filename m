Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8O4OJNI006851
	for <linux-lvm@redhat.com>; Thu, 24 Sep 2009 00:24:19 -0400
Received: from mail-gx0-f219.google.com (mail-gx0-f219.google.com
	[209.85.217.219])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8O4O6U9029547
	for <linux-lvm@redhat.com>; Thu, 24 Sep 2009 00:24:06 -0400
Received: by gxk19 with SMTP id 19so442235gxk.10
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 21:24:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d60517f30909232055g452df1cjcd298ddb0e428ba4@mail.gmail.com>
References: <d60517f30909222050j77b16ce7x769f442043151bbd@mail.gmail.com> 
	<d60517f30909232055g452df1cjcd298ddb0e428ba4@mail.gmail.com>
From: Thiago Nunes <thiagonunesrs@gmail.com>
Date: Thu, 24 Sep 2009 04:23:46 +0000
Message-ID: <d60517f30909232123h40482233ycb7d66069b6959ec@mail.gmail.com>
Subject: [linux-lvm] Re: "Incorrect metadata area header checksum" after a
	pvmove and pvresize
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
To: linux-lvm@redhat.com

Sorry for the previous html post.

After sending the previous email I found an metadata backup file
created after a vgdisplay. I'm posting it here to help the
understanding of my lvs situation.

http://dpaste.com/hold/97507/

Is secure to use this file to restore the metadata of the sda3?
