Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2GJj4VF000697
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:45:04 -0400
Received: from e9.ny.us.ibm.com (e9.ny.us.ibm.com [32.97.182.139])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2GJisB1004141
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:44:54 -0400
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e9.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id o2GJYES2014723
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:34:14 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o2GJirUd2043910
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:44:53 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	o2GJirER025256
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:44:53 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av04.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o2GJirH4025249
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:44:53 -0400
Date: Tue, 16 Mar 2010 12:44:52 -0700
From: malahal@us.ibm.com
Message-ID: <20100316194452.GA31768@us.ibm.com>
References: <4ec1d19a71ad4c8a10b487a3cf49840f.squirrel@trans.am>
	<20100316180619.GC15884@maude.comedia.it>
	<f6105209d6067f820f119b0f157890d0.squirrel@trans.am>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6105209d6067f820f119b0f157890d0.squirrel@trans.am>
Subject: Re: [linux-lvm] Multipath / LVM2
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
To: linux-lvm@redhat.com

Do "rm -rf /etc/lvm/cache" to remove the LVM cache. If you need this at
boot time, of course, you need to create new initramfs with the new
/etc/lvm/lvm.conf file.

blub@trans.am [blub@trans.am] wrote:
> hello
> thanks for trying to help :)
> 
> I've changed the filter and preferred_names variables to
> 
> preferred_names="^/dev/mapper/"
> filter=["a|/dev/mapper/.*|", "r/.*/"]
> 
> without luck :(
> 
> new pvscan output:
> http://pastebin.com/5PysR0rD

I don't see any warnings about any duplicates. What is the problem?

Thanks, Malahal.
