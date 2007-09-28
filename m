Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8S4XsbT021913
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2007 00:33:54 -0400
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.232])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8S4XqGE023733
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2007 00:33:52 -0400
Received: by nz-out-0506.google.com with SMTP id r28so1850022nza
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2007 21:33:52 -0700 (PDT)
Message-ID: <c268e4660709272133yd835b98n75d0080376e36440@mail.gmail.com>
Date: Thu, 27 Sep 2007 21:33:51 -0700
From: Drew <drew.kay@gmail.com>
Subject: Re: [linux-lvm] Resizing an ext3 file system after extending a
	logical volume group
In-Reply-To: <78B3687E-533C-4AEF-BD23-7DA4E3308C40@uiuc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <78B3687E-533C-4AEF-BD23-7DA4E3308C40@uiuc.edu>
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

Looking at it your planned steps are fine except you don't need to
worry about turning the journal off and then on afterwards. I've done
ext3 resizing operations on LVM many times over the last few years and
*never* experienced issues with the journal.

Remember the journal is there to keep data corruption (and fsck time)
at a minimum if the file system goes down uncleanly. AFAIK, unmounting
an ext3 file system forces the journal to commit itself to disk, which
means the journal is empty during the resize operation anyways.


-Drew
