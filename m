Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9H9Uafj026694
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2012 05:30:46 -0400
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9H9UYvX009508
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2012 05:30:35 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so3195671bkc.33
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2012 02:30:34 -0700 (PDT)
Message-ID: <507E7AB7.7080902@gmail.com>
Date: Wed, 17 Oct 2012 11:30:31 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <6004025.KRaXd7Eq3X@laptop>
In-Reply-To: <6004025.KRaXd7Eq3X@laptop>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin pool grows but meta data does not?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 16.10.2012 21:17, ben napsal(a):
> Experimenting with thin pools I noticed that extending a thin pool doesn't
> seem to make the metadata larger. Is that the expected behavior?

Yes  - metadata resize is not yet supported  (but extend will be available in 
hopefully near future).

You may see the %use of metadata via: 'lvs -o+metadata_percent'

For now you have to select in front reasonable big metadata size when you 
create thin pool. (i.e. 300MB seems to be pretty good size to start with), max 
size is <16GB.  (There is some auto-estimation based on given thin pool size - 
but if you expect the thin pool will significantly grow later - for now you 
have to set big enough metadata size for lvcreate command.

Zdenek
