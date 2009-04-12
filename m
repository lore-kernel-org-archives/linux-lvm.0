Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3CDsd87008470
	for <linux-lvm@redhat.com>; Sun, 12 Apr 2009 09:54:39 -0400
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3CDsJpY021895
	for <linux-lvm@redhat.com>; Sun, 12 Apr 2009 09:54:19 -0400
Received: by yx-out-2324.google.com with SMTP id 8so1007517yxm.81
	for <linux-lvm@redhat.com>; Sun, 12 Apr 2009 06:54:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49DF2403.10009@Calva.COM>
References: <49DCA275.8070203@Calva.COM> <49DF02A7.50606@Calva.COM>
	<20090410101959.GA21846@us.ibm.com> <49DF2403.10009@Calva.COM>
Date: Sun, 12 Apr 2009 06:54:19 -0700
Message-ID: <c268e4660904120654p6c62460tbd67716e42cfa3d3@mail.gmail.com>
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid 
	10"?
From: Drew <drew.kay@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

In my experience, on the linux platform it's easier to avoid LVM's
raid-like features and let software raid, specifically md, handle the
raid for you. It's another layer to manage but not much more
complexity.

Not to knock on the LVM folks, they do awesome work, but imho the code
for the software raid is better tested if only by virtue of how often
it's used/tested/broken. LVM, as I see it, is designed to take
physical disks/arrays and hide the underlying structure into one giant
pool for the admin to manage.


-- 
Drew

"Nothing in life is to be feared. It is only to be understood."
--Marie Curie
