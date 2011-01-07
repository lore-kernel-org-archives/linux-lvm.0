Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p07AJsEI010956
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2011 05:19:54 -0500
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p07AJfZn028397
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2011 05:19:42 -0500
Received: by iwn9 with SMTP id 9so17512917iwn.33
	for <linux-lvm@redhat.com>; Fri, 07 Jan 2011 02:19:41 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 7 Jan 2011 15:42:09 +0530
Message-ID: <AANLkTi=n-aH71XgUmx4U157UWxjj2o416+T21p0mPzr9@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Subject: [linux-lvm] lvm to vmdk conversion
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,
if this is not the right list for question the give me any link.
I am not clear as the term I want to know.
I have a virtualization setup(kvm) where few guest Operating Systems
are running in separate LVM partitions.

Here is output of lvscan

 ACTIVE            '/dev/abcd/lvm1' [100.00 GiB] inherit
  ACTIVE            '/dev/abcd/lvm2' [150.00 GiB] inherit
  ACTIVE            '/dev/abcd/lvm3' [50.00 GiB] inherit
  ACTIVE            '/dev/abcd/lvm4' [100.00 GiB] inherit


I want all these OSeS running inside LVMs to be into a vmdk image.
I came across many tutorials on internet which talk of converting a
vmdk to qcow2 image using qemu-img.

I tried vmware-converter-client  also on a test machine which actually failed.
I want to convert all the above LVMs to vmdk image which I can give to
some people who will do experiments on the things installed in the VMs
as above on a Vmware environment or Xen even.
So what way should I go.
I came across a command
qemu-img convert -c -f raw -O vmdk /dev/abcd/lvm4 /backup/lvm4.img

Will the above affect the lvm4.
I do not want the VM running on original server to at all loose its
any of the content but also have a vmdk file for each of the Guest OS
which is running on kvm as mentioned above.
What should I google exactly I am not clear with this part.
