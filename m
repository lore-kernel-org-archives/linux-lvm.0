Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p4O9pC0v028247
	for <linux-lvm@redhat.com>; Tue, 24 May 2011 05:51:12 -0400
Received: from smtp.smtpout.orange.fr (smtp11.smtpout.orange.fr
	[80.12.242.133])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4O9p9CF004310
	for <linux-lvm@redhat.com>; Tue, 24 May 2011 05:51:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by axege.com (Postfix) with ESMTP id 9E39150089
	for <linux-lvm@redhat.com>; Tue, 24 May 2011 11:56:21 +0200 (CEST)
Received: from axege.com ([127.0.0.1])
	by localhost (axege.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zywVN3IwJZx for <linux-lvm@redhat.com>;
	Tue, 24 May 2011 11:56:20 +0200 (CEST)
Received: from [10.0.0.69] (unknown [10.0.0.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by axege.com (Postfix) with ESMTPSA id 23AE650067
	for <linux-lvm@redhat.com>; Tue, 24 May 2011 11:56:20 +0200 (CEST)
From: "Franck Routier (personnel)" <alci@mecadu.org>
In-Reply-To: <1306228823.2195.9.camel@franck-VPCCW2S1E>
References: <1306228823.2195.9.camel@franck-VPCCW2S1E>
Date: Tue, 24 May 2011 11:51:06 +0200
Message-ID: <1306230666.2195.10.camel@franck-VPCCW2S1E>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Trim support on stripped volumes ?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

I found this commit
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=7b76ec11fec40203836b488496d2df082d5b2022
that suggests it could work, but I'm not sure at all...

Franck


Le mardi 24 mai 2011 à 11:20 +0200, Franck Routier (personnel) a écrit :
> Hi,
> 
> I have set-up of server with 4 SSDs (OCZ Vertex 2) stripped using LVM.
> Logical volume has been created using the -i 4 option (iostat confirms
> that the 4 disks work in parallel when I write a file).
> 
> Ext4 fs is used on the volume, mounted with -discard option.
> 
> I am using kernel 2.6.38.
> 
> My question is : is there a chance that TRIM command makes its way to
> the disks through LVM ? I've read contradictory informations on the web
> and I'm sure this is the best place to ask.
> 
> My second question is : how would I make _sure_ it works ?
> I've found a way to do it with hdparm --fibmap and hdparm --read-sector
> here http://askubuntu.com/questions/18903/how-to-enable-trim
> 
> But I don't think this can work with LVM. Would there be a similar way
> to make sure it is working while using LVM ?
> 
> Thanks a lot,
> 
> Franck
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
