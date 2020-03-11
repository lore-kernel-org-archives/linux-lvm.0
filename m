Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D89710A58DB
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2020 17:24:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0FD9867B06
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2020 17:24:45 +0000 (UTC)
Received: from [134.119.228.2] (helo=webmailfront-cgn01.ispgateway.de)
	by smtprelay05.ispgateway.de with esmtpsa
	(TLSv1:ECDHE-RSA-AES256-SHA:256) (Exim 4.92.3)
	(envelope-from <maiski@maiski.net>) id 1jC55m-0001Vw-4q
	for linux-lvm@redhat.com; Wed, 11 Mar 2020 18:24:26 +0100
Date: Wed, 11 Mar 2020 18:24:26 +0100
Message-ID: <20200311182426.Horde.ihAVcWNsNhlTRdLvdCW3VA7@webmail.df.eu>
From: maiski@maiski.net
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] probable lvm thin_pool exhaustion
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="Yes"
To: linux-lvm@redhat.com


Hello all,

i am a total newbie besides the general knowledge of lvm.
With this disclaimer written I have the following problem,
which may def need some expert knowledge of lvm, because i couldn't
find solutions online for now :/

I am booting my system (in my case is Qubes, but I suppose that does  
not matter at this point)
and after entering my luks password get to the dracut emergency shell.
"Check for pool qubes-dom/pool00 failed (status:1). Manual repair required!"
The only aclive lv is qubes_dom0/swap.
All the others are inactive.

step 1:
lvm vgscan vgchange -ay
lvm lvconvert --repair qubes_dom0/pool00
Result:
using default stripesize 64.00 KiB.
Terminate called after throwing an instance of 'std::runtime_error'
what(): transaction_manager::new_block() couldn't allocate new block
Child 7212 exited abnormally
Repair of thin metadata volume of thin pool qubes_dom0/pool00 failed  
(status:1). Manual repair required!

step 2:
since i suspect that my lvm is full (though it does mark 15 g as free)
i tried the following changes in the /etc/lvm/lvm.conf
thin_pool_autoextend_threshold = 80
thin_pool_autoextend_percent = 2 (Since my the pvs output gives PSize:  
465.56g Pfree 15.78g, I set this to 2% to be overly cautious not to  
extend beyond the 15 G marked as free, since idk)
auto_activation_volume_list = to hold the group, root, pool00, swap  
and a vm that would like to delete to free some space
volume_list = the same as auto_activation_volume_list

and tried step 1 again, did not work, got the same result as above  
with qubes_swap as active only

step 3 tried
lvextend -L+1G qubes_dom0/pool00_tmeta
Result:
metadata reference count differ for block xxxxxx, expected 0, but got 1 ...
Check for pool qubes-dom/pool00 failed (status:1). Manual repair required!


Since I do not know my way around lvm, what do you think, would be the  
best way out of this?
Adding another external PV? migrating to a bigger PV?
I did not play with backup or achive out of fear to loose any  
unbackuped data which happens to be a bit :|
Any help will be highly appreciated!

Thanks in advance,
m
