Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9L6i5V16326
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 02:44:05 -0400
Received: from feel.to (sv.digitalhouse.co.jp [211.10.15.172])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9L6i2Qm024353
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 02:44:03 -0400
Received: from [192.168.0.10] (68.pool5.dsltokyo.att.ne.jp [165.76.172.68])
	by feel.to (8.11.6/3.7W/POP-auth(00031322)) with ESMTP id j9L6hp619447
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 15:43:51 +0900
Message-ID: <43588EDC.1040001@snow.email.ne.jp>
Date: Fri, 21 Oct 2005 15:46:52 +0900
From: Mark Sargent <powderkeg@snow.email.ne.jp>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Reducing ext3 LV
References: <43572E5D.1010803@snow.email.ne.jp>
	<1129844206.25448.4.camel@localhost.localdomain>
In-Reply-To: <1129844206.25448.4.camel@localhost.localdomain>
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


>i asked a similar question a couple weeks ago but got no response.
>this is how i did it
>  
>
heck, a coupla weeks ago..that's awfully slow..I got a reply on the 
Fedora List within the hour...

>umount /dev/path/to/lv
>e2fsadm -L 20G /dev/path/to/lv
>
>additionally i wanted to remove a disk from the LV so:
>
>pvmove /dev/hdx
>vgreduce /dev/hdx
>
>i am by no means an lvm expert.
>
me neither...quick question, though..the HOWTO says, see below, that the 
e2fsadm doesn't exist in LVM2. Were you using LVM1.?

*LVM 2 Caveat
* There is currently no e2fsadm equivalent for LVM 2 and the e2fsadm 
that ships with LVM 1 does not work with LVM 2.

>  i joined the list to get help with my
>situation, and have been hanging out.
>
lucky for you, you weren't hanging out in a dangerous situation...

> maybe this will get you pointed in
>the right direction.
>
>  
>
it is helpful, cheers.

>good luck
>
>  
>
you too.

>randy
>
>  
>
Mark Sargent.

>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>
