Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i23CrW803641
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 07:53:32 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i23CrVn32485
	for linux-lvm@redhat.com; Wed, 3 Mar 2004 06:53:31 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Why can't I extend a LV after many times extends?
Message-ID: <20040303065331.H32693@homer.msp.redhat.com>
References: <20040302153451.GA13034@lepton.goldenhope.com.cn>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040302153451.GA13034@lepton.goldenhope.com.cn>; from lepton@mail.goldenhope.com.cn on Tue, Mar 02, 2004 at 11:34:51PM +0800
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar  3 07:52:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Mar 02, 2004 at 11:34:51PM +0800, lepton wrote:
> For making my data can balance on all of my three scsi disk, I use such
> methods to create my LV:
>   lvcreate -l 32 -n test vg /dev/sda1
>   lvextend -l +32 /dev/vg/test /dev/sdb1
>   lvextend -l +32 /dev/vg/test /dev/sdc1
>   lvextend -l +32 /dev/vg/test /dev/sda1
>   ......
 
Why not use LVM striping directly?
(lvcreate -i 3)

Alasdair
-- 
agk@redhat.com
