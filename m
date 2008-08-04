Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m74EaL0R029239
	for <linux-lvm@redhat.com>; Mon, 4 Aug 2008 10:36:21 -0400
Received: from fk-out-0910.google.com (fk-out-0910.google.com [209.85.128.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m74Ea1GT018627
	for <linux-lvm@redhat.com>; Mon, 4 Aug 2008 10:36:08 -0400
Received: by fk-out-0910.google.com with SMTP id e30so2304297fke.3
	for <linux-lvm@redhat.com>; Mon, 04 Aug 2008 07:35:55 -0700 (PDT)
Message-ID: <a847b5a10808040735n59431d13h6a9ae8c91326e143@mail.gmail.com>
Date: Tue, 5 Aug 2008 00:35:55 +1000
From: "Jason Lee" <huajie.lee@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9692_12989845.1217860555533"
Subject: [linux-lvm] Problem in LVM settings in VMware
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
To: linux-lvm@redhat.com

------=_Part_9692_12989845.1217860555533
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I am quite new to VMware and recently installed a VM of Fedora in my Host OS
Win XP. In this VM, I have couple of VMDK files which comes together as
parts of vmdk file. Each vmdk file is about 2-3GB size and I have 4 of them
totalling to 8-12GB. However, currently, I am facing shortage of space.

What I did was freeing up some space from my Host OS and in the VM, I can
see this "unallocated space" partition. So, I have no idea how to proceed
with these unallocated space partition. Ultimate goal is to absorb this
unallocated partition as similar LVM so these current LVM can expand beyond
the existing size.

I am currently using VM server 1.0.5 Build and LVM2. I tried to find several
articles from the net but that didnt help due to my specific problem.
I tried Pvdisplay and only able to see one VG even though it has various
parts of vmdk. Besides, Im not sure whether issuing Pvcreate for this newly
created partition would help.

Anyone could please advise me.

Thanks alot.

Rgrds,

------=_Part_9692_12989845.1217860555533
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Hi,<br><br>I am quite new to VMware and recently installed a VM of Fedora in my Host OS Win XP. In this VM, I have couple of VMDK files which comes together as parts of vmdk file. Each vmdk file is about 2-3GB size and I have 4 of them totalling to 8-12GB. However, currently, I am facing shortage of space. <br>
<br>What I did was freeing up some space from my Host OS and in the VM, I can see this &quot;unallocated space&quot; partition. So, I have no idea how to proceed with these unallocated space partition. Ultimate goal is to absorb this unallocated partition as similar LVM so these current LVM can expand beyond the existing size. <br>
<br>I am currently using VM server 1.0.5 Build and LVM2. I tried to find several articles from the net but that didnt help due to my specific problem.<br>I tried Pvdisplay and only able to see one VG even though it has various parts of vmdk. Besides, Im not sure whether issuing Pvcreate for this newly created partition would help.<br>
<br>Anyone could please advise me. <br><br>Thanks alot.<br><br>Rgrds,<br></div>

------=_Part_9692_12989845.1217860555533--
