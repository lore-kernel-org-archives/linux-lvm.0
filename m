Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBCJ5ALc032212
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 14:05:10 -0500
Received: from bay0-omc2-s7.bay0.hotmail.com (bay0-omc2-s7.bay0.hotmail.com
	[65.54.246.143])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBCJ4XES024053
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 14:04:33 -0500
Message-ID: <BAY124-W369BAF74F0EBE8FA1B966ACD650@phx.gbl>
From: Glynn <glymor@hotmail.com>
Subject: RE: [linux-lvm] After replacing sata card can't read
Date: Wed, 12 Dec 2007 19:04:28 +0000
In-Reply-To: <20071212082953.GA23948@percy.comedia.it>
References: <BAY124-W59BBCA092E4CB4D14E3BE1CD650@phx.gbl>
	<20071212082953.GA23948@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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



>>  mdadm  --create --assume-clean /dev/md2 --level=5 --raid-devices=6 /dev/sd[a-f]1
> and you are 1000% sure you got the order right?

No, I'm pretty sure I didn't. I tried again with what I thought was the right order but to no affect, so I ran it again without the assume-clean and it rebuilt one of the drives. I assumed that meant mdadm was now okay with the ordering?

> usually after doing "mdadm --create --assume-clean" you should check
> that data is still readable, if not try changing the order of drives in
> "mdadm" and try again.

Would it make sense to try and resolve this by constructing a bash script to try all the permitations of drive order until pvdisplay returns something?

Thanks for your help and I apologize for essentially asking mdadm questions on the lvm mailling list.
_________________________________________________________________
Telly addicts unite!
http://www.searchgamesbox.com/tvtown.shtml
