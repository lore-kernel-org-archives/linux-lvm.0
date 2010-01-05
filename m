Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o05MvJGE016103
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 17:57:19 -0500
Message-Id: <79CF1BE4-C82E-490C-B563-9C8BC16FCDD2@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <4B438ECC.5000805@alteeve.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Tue, 5 Jan 2010 16:52:16 -0600
References: <4B438ECC.5000805@alteeve.com>
Subject: Re: [linux-lvm] What is holding back clustered snapshotting?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Jan 5, 2010, at 1:11 PM, Madison Kelly wrote:

> Hi all,
>
>  I know that, currently, this isn't supported. Would someone be able  
> to explain or point me at a place to read up on what is holding this  
> feature back? What are the difficulties? Is it just a question of  
> time, or are there certain technical hurdles in the way?
>
>  Thanks for any input!

The solution isn't ridiculously hard.  It has actually been  
implemented a couple times by me and at least once by Mikulas  
leveraging a locking interface I had proposed.  (You can search the  
various dm-devel archives for them.)

Our current priority is to improve the snapshot implementation (shared  
snapshots), but cluster snapshots is on the todo list.  It does tend  
to be a matter of time.  As I said, a couple implementations have come  
forward, but it requires a team effort to push it upstream - the  
priority hasn't been high enough for it to surpass other things on the  
list.

  brassow
