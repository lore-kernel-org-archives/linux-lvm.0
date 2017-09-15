Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CCA760480
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 18:35:08 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA2EF12987C
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 18:35:04 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id E9E111868E
	for <linux-lvm@redhat.com>; Fri, 15 Sep 2017 20:35:02 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 15 Sep 2017 20:35:02 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <914479528.2618507.1505463313888@mail.yahoo.com>
References: <914479528.2618507.1505463313888.ref@mail.yahoo.com>
	<914479528.2618507.1505463313888@mail.yahoo.com>
Message-ID: <738f3b758c749b6744def71f0a6a0e8d@xenhideout.nl>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

matthew patton schreef op 15-09-2017 10:15:
>>  From the two proposed solutions (lvremove vs lverror), I think I 
>> would  prefer the second one.
> 
> I vote the other way. :)

Unless you were only talking about lvremoving snapshots this is hugely 
irresponsible.

You are throwing away a data collection?

> First because 'remove' maps directly to the DM equivalent action which
> brought this about.

That would imply you are only talking about snapshots, ?, even if 
dmsetup only creates a mapping, throwing away that mapping generally 
throws away data.

> With respect to freezing or otherwise stopping further I/O to LV being
> used by virtual machines, the only correct/sane solution is one of
> 'power off' or 'suspend'. Reaching into the VM to freeze
> individual/all filesystems but otherwise leave the VM running assumes
> significant knowledge of the VM's internals and the luxury of time.

That is simply user centric action that will in this case differ because 
a higher level function is better at cleanly killing something than a 
lower level function.

Same as that fsfreeze would probably be better in that sense than 
lverror.

So in that sense, yes of course, I agree, that would be logical.

If you can do it clean, you don't have to do it rough.

In the same way you could have user centric action shut down webservers 
and so on. By user I mean administrator.

But for LVM team you can only provide mechanic that decides when action 
should be taken, and some default actions like possibly lverror and 
fsfreeze. You cannot decide what higher level interventions would be 
needed everywhere.

Of course clean shutdown would be ideal. This depends on system 
administrator.
