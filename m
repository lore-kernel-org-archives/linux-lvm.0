Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBKH4Dr09626
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2004 12:04:13 -0500
Received: from mr2.schneider.com (mr2.schneider.com [161.222.161.9])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBKH47M2018705
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2004 12:04:07 -0500
Received: from mm1.schneider.com (mm1.schneider.com [161.222.1.24])
	by mr2.schneider.com (8.12.10+Sun/8.12.10) with ESMTP id iBKH3kn1017462
	for <linux-lvm@redhat.com>; Mon, 20 Dec 2004 11:04:01 -0600 (CST)
Subject: RE: [linux-lvm] How to increase/decrease space
Message-ID: <OFD7F31933.61147BBC-ON86256F70.005CAFA3-86256F70.005DA21C@schneider.com>
From: AdabalaP@schneider.com
Date: Mon, 20 Dec 2004 11:02:43 -0600
MIME-Version: 1.0
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

Thanks Nicoya, It worked.

I was able to reduce my root "/" file system size, following the
instructions in
http://www.balug.org/pipermail/balug-talk/2002-April/000310.html .

but had to perform three additional steps;
(a) disable "/" fs mount in "fstab"
 (b)    reboot using rescue CD, and perfrom (i) resize2fs, (ii) lvreduce
 (c)    mount the "/" fs and change the "fstab" to enable "/" fs mount and
reboot.

thanks for everyone help.




                                                                                                                                       
                      "Nicoya Helm"                                                                                                    
                      <NHELM2@kumc.edu>        To:       <linux-lvm@redhat.com>                                                        
                      Sent by:                 cc:                                                                                     
                      linux-lvm-bounces        Subject:  RE: [linux-lvm] How to increase/decrease space                                
                      @redhat.com                                                                                                      
                                                                                                                                       
                                                                                                                                       
                      12/16/2004 03:20                                                                                                 
                      PM                                                                                                               
                      Please respond to                                                                                                
                      LVM general                                                                                                      
                      discussion and                                                                                                   
                      development                                                                                                      
                                                                                                                                       
                                                                                                                                       




>>> AdabalaP@schneider.com 12/16/04 2:05 PM >>>
>Thanks Nicoya. I was successfully able to increase the size of the
"/usr"
>file system, By using "resize2fs" command.

>Now, that i am able to increase the FS size, how do i go about
reducing the
>FS size with out the data loss, especially with "/" file system ?

That part I don't have experience with, but obviously the first step is
to reduce the amount of actual data on the FS so that it is less than
the size you want to shrink it to. If you are using LVM 1, you can use
e2fsadm to shrink the LV and the FS in one step, but there is no e2fsadm
for LVM2 .  For LVM 2 you have to do the 2-step resize2fs and lvreduce
as described in this post to another list:

http://www.balug.org/pipermail/balug-talk/2002-April/000310.html

>While increasing the space on a LV, Do i need to do lvresize,
lvextend,
>resize2fs or just lvextend and resize2fs ?

You should only need to do lvresize _or_ lvextend, then resize2fs.



Nicoya Helm
Project Manager, Network Services
University of Kansas Medical Center
nhelm2@kumc.edu

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
